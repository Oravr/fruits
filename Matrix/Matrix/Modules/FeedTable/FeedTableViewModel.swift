//
//  FruitTableViewControllerViewModel.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

protocol FeedTableViewModel {
    var cellViewModels: Observable<[FruitCellViewModel]?> {get set}
    var isLoading: Observable<Bool> { get }
    var repository: Repository { get }
    var parser: DataParser { get }
    
    init(with providor: Repository, parser: DataParser)
    
    func fetchData()
    func cellIdentifier(for viewModel: RowViewModel) -> String
}

class FeedTableViewModelImpl: FeedTableViewModel {
    let repository: Repository
    var parser: DataParser
    var cellViewModels: Observable<[FruitCellViewModel]?> = Observable(value: nil)
    let isLoading = Observable<Bool>(value: false)  

    required init(with repository: Repository, parser: DataParser) {
        self.repository = repository
        self.parser = parser
        
    }
    
    func fetchData() {
        self.isLoading.value = true
        
        self.repository.fetchData() {  [weak self] result in
            if case .success(let data) = result {
                self?.handleSuccessDataFetch(with: data)
            }
            if case .failure (let error) = result {
                self?.handleFailureDataFetch(with: error)
            }
        }
    }
    
    func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is FruitCellViewModel:
            return FruitCell.identifier
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}

//MARK: Service
private extension FeedTableViewModelImpl {
    private func handleFailureDataFetch(with error: Error) {
        print(error) // refetch? Handle some other way..
    }
    
    private func handleSuccessDataFetch(with data: Data) {
        parser.decode(data: data) { [weak self] (models: Fruits?) in
            if let models = models {
                self?.setupCellsViewModels(with: models)
            }
        }
    }
    
    private func setupCellsViewModels(with models: Fruits) {
        var newViewModels = [FruitCellViewModelImpl]()
        
        for fruit in models.fruits {
            newViewModels.append(FruitCellViewModelImpl(model: fruit))
        }
        self.cellViewModels.value = newViewModels
        self.isLoading.value = false
    }
}
