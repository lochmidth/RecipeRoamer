//
//  MealServiceTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealServiceTests: XCTestCase {
    var sut: MealService!
    var networkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = MealService(networkManager: networkManager)
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func test_fetchMeals_thenSuccess() async {
        //GIVEN
        networkManager.result = .success(mockMealListResponse)
        
        //WHEN
        do {
            let response = try await sut.fetchMeals(by: "a")
            
            //THEN
            XCTAssertTrue(networkManager.isRequestCalled)
            XCTAssertEqual(response.meals.count, mockMealListResponse.meals.count)
        } catch {
            return
        }
    }
    
    func test_fetchMeals_thenFail() async {
        //GIVEN
        networkManager.result = .failure(MockError.someError)
        
        //WHEN
        do {
            let response = try await sut.fetchMeals(by: "a")
            
            //THEN
            XCTAssertTrue(networkManager.isRequestCalled)
            XCTAssertNil(response)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func test_searchMeal_thenSuccess() async {
        //GIVEN
        networkManager.result = .success(mockMealListResponse)
        
        //WHEN
        do {
            let response = try await sut.searchMeal("Sphagetti")
            
            //THEN
            XCTAssertTrue(networkManager.isRequestCalled)
            XCTAssertEqual(response.meals.count, mockMealListResponse.meals.count)
        } catch {
            return
        }
    }
    
    func test_searchMeal_thenFail() async {
        //GIVEN
        networkManager.result = .failure(MockError.someError)
        
        //WHEN
        do {
            let response = try await sut.searchMeal("Spigiti")
            
            //THEN
            XCTAssertTrue(networkManager.isRequestCalled)
            XCTAssertNil(response)
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
