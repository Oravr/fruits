//
//  DataProvider.swift
//  iOSDeveloperAssignment
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

typealias GetDataResult = Result<Data, GetDataFailureReason>

enum GetDataFailureReason: Int, Error {
    case notFound = 404
}

protocol Repository {
    func fetchData(_ completionHandler: @escaping(GetDataResult) -> Void)
}

struct RepositoryImpl: Repository {
    private let fruitsURL = URL(string: "https://dev-api.com/fruitsBT/getFruits")!
    
    func fetchData(_ completionHandler: @escaping (GetDataResult) -> Void) {
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: fruitsURL) else {
                completionHandler(.failure(.notFound))
                return
            }
            completionHandler(.success(payload: data))
        }
    }
}
