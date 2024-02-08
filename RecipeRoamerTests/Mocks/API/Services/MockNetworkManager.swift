//
//  MockNetworkManager.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 6.02.2024.
//


import Foundation
import Moya
@testable import RecipeRoamer

enum MockError: Error {
    case someError
}

class MockNetworkManager: NetworkManaging {
    
    var result: Result<Any, Error>?
    
    var isRequestCalled = false
    func request<T: Codable>(_ target: Moya.TargetType) async throws -> T {
        isRequestCalled = true
        
        if let result = result {
            switch result {
            case .success(let value as T):
                return value
            case .failure(let error):
                throw error
            default:
                throw MockError.someError
            }
        } else {
            throw MockError.someError
        }
    }
}
