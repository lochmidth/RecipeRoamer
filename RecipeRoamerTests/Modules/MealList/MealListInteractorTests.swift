//
//  MealListInteractorTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealListInteractorTests: XCTestCase {
    
    var sut: MealListInteractor!
    var presenter: MockMealListPresenter!
    var mealService: MockMealService!

    override func setUp() {
        mealService = MockMealService()
        sut = MealListInteractor(mealService: mealService)
        presenter = MockMealListPresenter()
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        mealService = nil
        presenter = nil
        super.tearDown()
    }
    
    func test_fetchMeals_fetchIndexOutOfRange_thenReceiveSameMeals() async {
        //GIVEN
        sut.fetchIndex = 40
        sut.meals = mockMeals
        
        //WHEN
        await sut.fetchMeals()
        
        //THEN
        XCTAssertEqual(sut.meals.count, mockMeals.count)
    }
    
    func test_fetchMeals_invalidResponse_thenFailWithError() async {
        //GIVEN
        mealService.fetchMealsResult = .failure(MockError.someError)
        
        //WHEN
        await sut.fetchMeals()
        
        //THEN
        XCTAssertTrue(presenter.failed)
    }
    
    func test_searchMeals_givenEmptyQuery_thenReset() async {
        //GIVEN
        let query = ""
        let response = mockMealListResponse
        mealService.fetchMealsResult = .success(response)
        
        //WHEN
        await sut.searchMeal(query: query)
        
        //THEN
        XCTAssertEqual(sut.meals.count, mockMeals.count * 2) //it fecthes twice
    }
    
    func test_searchMeals_givenValidQuery_thenDidReceiveQueryResults() async {
        //GIVEN
        let query = "Sphagetti"
        mealService.searchMealResult = .success(mockMealListResponse)
        
        //WHEN
        await sut.searchMeal(query: query)
        
        //THEN
        XCTAssertTrue(presenter.queryResultsReceived)
    }
    
    func test_searchMeals_givenInvalidQuery_thenDidnotReceiveAnyMeals() async {
        //GIVEN
        let query = "Spigiti"
        mealService.searchMealResult = .failure(MockError.someError)
        
        //WHEN
        await sut.searchMeal(query: query)
        
        //THEN
        XCTAssertTrue(presenter.didNotReceiveAnyMealsCalled)
    }

}
