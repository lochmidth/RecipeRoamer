//
//  MealAPI.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 28.01.2024.
//

import Foundation
import Moya

enum MealAPI {
    case fetchMeals(letter: String)
    case searchMeal(query: String)
}

extension MealAPI: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseUrlString)!
    }
    
    var path: String {
        return Constants.searchPath
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMeals(let letter):
            return .requestParameters(parameters: [Constants.letterParam: letter], encoding: URLEncoding.queryString)
        case .searchMeal(let query):
            return .requestParameters(parameters: [Constants.queryParam: query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return Constants.header
    }
}

extension MealAPI {
    struct Constants {
        static let baseUrlString = "https://www.themealdb.com/api/json/v1/1"
        static let searchPath = "/search.php"
        static let header = ["Content-type": "application/json"]
        static let letterParam = "f"
        static let queryParam = "s"
    }
}
