//
//  FruitTableCellTableViewCell.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import UIKit

class FruitCell: UITableViewCell, CellConfigurable {
    static let identifier = "FruitCell"
    
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    
    private lazy var loadingIdicator: UIActivityIndicatorView = {
        let indicator = self.setupLoadingIndicator(for: fruitImage)
        indicator.color = .white
        return indicator
    }()
    
    var viewModel: FruitCellViewModel? {
        didSet {
            guard let viewModel = viewModel else {return}
            self.fruitLabel.text = viewModel.getName()
        }
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? FruitCellViewModel else { return }
        self.viewModel = viewModel

        self.loadingIdicator.startAnimating()
        self.viewModel?.imageData.addObserver({ data in
            if let data = data,
               let image = UIImage(data: data) {
                self.fruitImage.image = image
                self.loadingIdicator.stopAnimating()
            }
        })
    }
}
