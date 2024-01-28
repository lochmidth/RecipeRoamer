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
        return URL(string: "https://www.themealdb.com/api/json/v1/1")!
    }
    
    var path: String {
        return "/search.php"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMeals(let letter):
            return .requestParameters(parameters: ["f": letter], encoding: URLEncoding.default)
        case .searchMeal(let query):
            return .requestParameters(parameters: ["s": query], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
