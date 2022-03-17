//
//  DetailsViewController.swift
//  Matrix
//
//  Created by Or.Avraham on 17/03/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    private var viewModel: FruitCellViewModel!
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.backgroundColor = .systemGreen
        stackView.axis  = .vertical
        stackView.distribution  = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 2.0
        stackView.layer.cornerRadius = 100
        
        let textLabel = UILabel()
        textLabel.text = viewModel.model.name
        textLabel.textAlignment = .center
        
        
        let desLabel = UILabel()
        desLabel.text = viewModel.model.description
        desLabel.textAlignment = .center
        
        let priceLabel = UILabel()
        priceLabel.text = "\(viewModel.model.price)"
        priceLabel.textAlignment = .center
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(desLabel)
        stackView.addArrangedSubview(priceLabel)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupImageView()

        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true

    }
    
    private func setupImageView() {
        if let imageData = viewModel.imageData.value {
            imageView.image = UIImage(data: imageData)
            
            imageView.circular()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
                imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width),
                imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height)
            ])
        }
    }
    
    func setup(with viewModel: FruitCellViewModel) {
        self.viewModel = viewModel
    }
}
