//
//  Utility.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 14/01/25.
//

import Foundation

class Utility {
    enum JsonParseError: Error {
        case invalidPath
    }
    
    static func loadJson<T: Decodable>(_ filename: String) throws -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            throw JsonParseError.invalidPath
        }
        
        data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    }
}
