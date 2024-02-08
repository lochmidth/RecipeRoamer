//
//  MealListPresenterTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealListPresenterTests: XCTestCase {
    
    var sut: MealListPresenter!
    var interactor: MockMealListInteractor!
    var router: MockMealListRouter!
    var view: MockMealListView!
    
    override func setUp() {
        super.setUp()
        view = MockMealListView()
        interactor = MockMealListInteractor()
        router = MockMealListRouter()
        sut = MealListPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = sut
    }
    
    override func tearDown() {
        sut = nil
        view = nil
        interactor = nil
        router = nil
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        //GIVEN
        interactor.suspendInteractor = true
        
        //WHEN
        sut.viewDidLoad()
        
        //THEN
        XCTAssertTrue(view.isLoading)
        XCTAssertTrue(view.navigationBarConfigured)
    }
    
    func test_didReachEndOfPage_thenFetchMeals() {
        //GIVEN
        interactor.suspendInteractor = true
        let scrollView = UIScrollView()
        
        //WHEN
        sut.didReachEndOfPage(scrollView)
        
        //THEN
        XCTAssertFalse(interactor.fetchMealsCalled)
    }
    
    func test_didSelectItem_thenShowRecipe() {
        //GIVEN
        sut.meals = mockMeals
        let index = 1
        
        //WHEN
        sut.didSelectItem(at: index)
        
        //THEN
        XCTAssertTrue(router.showRecipeCalled)
    }
    
    func test_queryTextDidChange_notSearchImmediately() {
        //GIVEN
        let givenQuery = "Spaghetti"
        
        //WHEN
        sut.queryTextDidChange(givenQuery)
        
        //THEN
        XCTAssertFalse(view.isLoading)
        XCTAssertFalse(interactor.mealsSearched)
    }
    
    func test_queryTextDidChange_searchAfterTimeGap() {
        //GIVEN
        let givenQuery = "Spaghetti"
        let expectation = XCTestExpectation(description: "Wait for specified time tap")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            expectation.fulfill()
        }
        
        //WHEN
        sut.queryTextDidChange(givenQuery)
        
        
        //THEN
        wait(for: [expectation], timeout: 1.5)
        XCTAssertTrue(interactor.mealsSearched)
    }
    
    func test_didReceiveQueryResults_thenReload() {
        //GIVEN
        let meals = mockMeals
        
        //WHEN
        sut.interactor(interactor, didReceiveQueryResults: meals)
        
        //THEN
        XCTAssertFalse(view.isLoading)
    }
    
    func test_didFailWithError_thenShowAlert() {
        //GIVEN
        let error = MockError.someError
        
        //WHEN
        sut.interactor(interactor, didFailWith: error)
        
        //THEN
        XCTAssertFalse(view.isLoading)
        XCTAssertTrue(router.didShowAlert)
        XCTAssertEqual(router.alertTitle, "Oops!")
        XCTAssertEqual(router.alertMessage, error.localizedDescription)
    }
    
}
