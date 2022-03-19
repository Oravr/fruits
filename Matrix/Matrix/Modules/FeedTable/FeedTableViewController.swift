//
//  ViewController.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import UIKit

class FeedTableViewController: UITableViewController {
    var viewModel: FeedTableViewModel!
    
    private lazy var loadingIdicator: UIActivityIndicatorView = {
        let indicator = self.view.setupLoadingIndicator(for: self.view)
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        initBinding()
        viewModel.fetchData()
    }
}

//MARK: Service
private extension FeedTableViewController  {
    private func initBinding() {
        viewModel.cellViewModels.addObserver { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.isLoading.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.loadingIdicator.startAnimating()
                self?.title = "Loading..."
            } else {
                self?.loadingIdicator.stopAnimating()
                self?.title = "Fruits"
            }
        }
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FruitCell.nib(), forCellReuseIdentifier: FruitCell.identifier)
        tableView.backgroundColor = .black
    }
    
    private func showDetailsViewControler(for viewModel: FruitCellViewModel) {
        let detailsVC = DetailsViewController()
        detailsVC.setup(with: viewModel)
        show(detailsVC, sender: self)
    }
}

//MARK: UITableViewDataSource
extension FeedTableViewController  {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellViewModels.value?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let rowViewModel = viewModel.cellViewModels.value?[indexPath.row] as? RowViewModel else {
            print("ViewModel does not conform RowViewModel Protocol!")
            fatalError()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier(for: rowViewModel), for: indexPath)
        
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        cell.layoutIfNeeded()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let fruitViewModel = viewModel.cellViewModels.value?[indexPath.row] {
            showDetailsViewControler(for: fruitViewModel)
            //Needs to move Logic to some Coordinator..
        }
    }
}
