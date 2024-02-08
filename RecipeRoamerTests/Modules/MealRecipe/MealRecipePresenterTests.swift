//
//  MealRecipePresenterTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 8.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealRecipePresenterTests: XCTestCase {

    var sut: MealRecipePresenter!
    var interactor: MockMealRecipeInteractor!
    var view: MockMealRecipeView!
    
    override func setUp() {
        super.setUp()
        view = MockMealRecipeView()
        interactor = MockMealRecipeInteractor()
        sut = MealRecipePresenter(view: view, interactor: interactor)
        interactor.presenter = sut
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        view = nil
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        //GIVEN
        interactor.suspendInteractor = true
        
        //WHEN
        sut.viewDidLoad()
        
        //THEN
        XCTAssertTrue(interactor.fetched)
    }
    
    func test_didReceiveMeal_thenReload() {
        //GIVEN
        let meal = mockMeals[0]
        
        //WHEN
        sut.interactor(interactor, didReceiveMeal: meal)
        
        //THEN
        XCTAssertNotNil(sut.meal)
        XCTAssertTrue(view.reloaded)
    }

}
