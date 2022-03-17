//
//  DetailsView.swift
//  Matrix
//
//  Created by Or.Avraham on 17/03/2022.
//

import UIKit

class DetailsView: UIView {
    var name: String = ""
    var desc: String = ""
    var price: Double = 0
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = name
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.heightAnchor.constraint(equalTo: label.heightAnchor),
            label.widthAnchor.constraint(equalTo: label.widthAnchor)
        ])
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = desc
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 10),
            label.heightAnchor.constraint(equalTo: label.heightAnchor),
            label.widthAnchor.constraint(equalTo: label.widthAnchor)
        ])
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "\(price)"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            label.heightAnchor.constraint(equalTo: label.heightAnchor),
            label.widthAnchor.constraint(equalTo: label.widthAnchor)
        ])
        return label
    }()
    

    func setup(name: String, desc: String, price: Double) {
        self.name = name
        self.desc = desc
        self.price = price
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(descLabel)
        self.addSubview(priceLabel)
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
