//
//  MealRecipeInteractorTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 8.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealRecipeInteractorTests: XCTestCase {

    var sut: MealRecipeInteractor!
    var presenter: MockMealRecipePresenter!
    var meal: Meal!
    
    override func setUp() {
        super.setUp()
        presenter = MockMealRecipePresenter()
        meal = mockMeals[0]
        sut = MealRecipeInteractor(meal: meal)
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        meal = nil
        presenter = nil
        super.tearDown()
    }
    
    func test_fetch_thenDidReceiveMeal() {
        //GIVEN
        
        //WHEN
        sut.fetch()
        
        //THEN
        XCTAssertTrue(presenter.mealReceived)
        XCTAssertEqual(sut.meal.name, meal.name)
        
    }
}
