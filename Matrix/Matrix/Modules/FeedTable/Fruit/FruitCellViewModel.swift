//
//  FruitCellViewModel.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation


protocol FruitCellViewModel: RowViewModel {
    var model: Fruit { get }
    var imageData: Observable<Data?> { get }
    
    func getName() -> String
    func getImageURL() -> URL
}

class FruitCellViewModelImpl: FruitCellViewModel {
    var model: Fruit
    var imageData: Observable<Data?> = Observable(value: nil)
    
    init(model: Fruit) {
        self.model = model
        downloadImageData()
    }
    
    func getName() -> String {
        return model.name
    }
    
    func getImageURL() -> URL {
        return URL(string: model.image)!
    }
}

//MARK: Service
private extension FruitCellViewModelImpl {
    private func downloadImageData() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self,
                  let url = URL(string: self.model.image),
                  let data = try? Data(contentsOf: url) else {return}
            self.imageData.value = data
        }
    }
}
