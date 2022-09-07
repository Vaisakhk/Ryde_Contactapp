//
//  FileHandler.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 7/9/22.
//

import Foundation

class FileHandler {
    static let sharedHandler = FileHandler()
    
    private init (){
        
    }
    
    func getDataFromFile(name:String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: name, ofType: "json") else {
            preconditionFailure("Could not find expected file in test bundle")
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            preconditionFailure("Could not find expected file in test bundle")
        }
        return data
    }
}
