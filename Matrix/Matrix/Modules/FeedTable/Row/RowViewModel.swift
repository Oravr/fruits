//
//  RowViewModel.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

protocol RowViewModel {}

protocol ViewModelPressable {
    var cellPressed: (()->Void)? { get set }
}
