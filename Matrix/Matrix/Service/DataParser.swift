//
//  JSONParser.swift
//  iOSDeveloperAssignment
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

enum DataParserResults<T> {
    case success(models: T)
    case failure(String)
}

protocol DataParser {
    func decode<T: Codable>(data: Data, with completionHandler: (DataParserResults<T>) -> Void)
}
struct JSONDataParser: DataParser {
    func decode<T: Codable>(data: Data, with completionHandler: (DataParserResults<T>) -> Void) {

        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(T.self, from: data)
            completionHandler(.success(models: model))
        } catch {
            completionHandler(.failure("Failed to Decode JSON with error: \(error)"))
        }
    }
}
