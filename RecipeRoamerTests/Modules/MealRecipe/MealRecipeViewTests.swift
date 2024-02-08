//
//  MealRecipeViewTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealRecipeViewTests: XCTestCase {
    var sut: MealRecipeViewController!
    var presenter: MockMealRecipePresenter!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        presenter = MockMealRecipePresenter()
        sut = MealRecipeViewController()
        sut.presenter = presenter
        navigationController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        navigationController = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_callsPresenter() {
        XCTAssertTrue(presenter.viewLoaded)
    }
    
    func test_TableViewNumberOfRowsInSection() {
        // GIVEN
        let tableView = UITableView()
        let section = 0
        
        // WHEN
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: section)
        
        // THEN
        XCTAssertEqual(numberOfRows, 3)
    }

    
    func test_TableViewcellForItemAt() {
        //GIVEN
        let index = 0
        let tableView = UITableView(frame: .zero)
        tableView.register(MealRecipeTableViewCell.self, forCellReuseIdentifier: "MealRecipeCell")
        sut.meal = mockMeals[0]
        
        //WHEN
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(item: index, section: 0))
        
        //THEN
        XCTAssertNotNil(cell)
    }
    
    func test_TableViewviewForHeaderInSection() {
        //GIVEN
        let section = 0
        let tableView = UITableView(frame: .zero)
        sut.meal = mockMeals[0]
        
        //WHEN
        let header = sut.tableView(tableView, viewForHeaderInSection: section)
        
        //THEN
        XCTAssertNotNil(header)
    }
    
    func test_TableViewHeightForHeaderInSection() {
        // GIVEN
        let tableView = UITableView()
        let section = 0
        
        // WHEN
        let heightForHeaderInSection = sut.tableView(tableView, heightForHeaderInSection: section)
        
        // THEN
        XCTAssertEqual(heightForHeaderInSection, 250)
    }

    func test_reloadWithMeals() {
        //GIVEN
        XCTAssertNil(sut.meal)
        
        //WHEN
        sut.reload(with: mockMeals[0])
        
        //THEN
        XCTAssertEqual(sut.meal?.name, mockMeals[0].name)
    }
    
}
