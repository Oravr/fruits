//
//  JSONParser.swift
//  iOSDeveloperAssignment
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

enum DataParserResults {
    case Success
    case Error(String)
}

protocol DataParser {
    func decode<T: Codable>(data: Data, with completionHandler: (T?) -> Void)
}
struct JSONDataParser: DataParser {
    func decode<T: Codable>(data: Data, with completionHandler: (T?) -> Void) {

        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(T.self, from: data)
            completionHandler(model)
        } catch {
            print("**Failed to Decode JSON with error: \(error)")
            fatalError()
        }
    }
}
