//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Furkan on 9.04.2023.
//

import Foundation

protocol NetworkService {
    func download(_ resource : String) async throws -> [User]
    var type : String { get }
}
