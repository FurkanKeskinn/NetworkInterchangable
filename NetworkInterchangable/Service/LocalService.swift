//
//  LocalService.swift
//  NetworkInterchangable
//
//  Created by Furkan on 9.04.2023.
//

import Foundation

class LocalService : NetworkService{
    
    var type: String = "LocalService"
    
    func download(_ resource : String) async throws -> [User]{
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let userModel = try JSONDecoder().decode([User].self, from: data)
        
        return userModel
    }
}
