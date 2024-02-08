//
//  MealListViewTests.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import XCTest
@testable import RecipeRoamer

final class MealListViewTests: XCTestCase {
    
    var sut: MealListViewController!
    var presenter: MockMealListPresenter!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        presenter = MockMealListPresenter()
        sut = MealListViewController()
        sut.presenter = presenter
        navigationController = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        presenter = nil
        sut = nil
        navigationController = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_callsPresenter() {
        XCTAssertTrue(presenter.viewLoaded)
    }
    
    func test_didSelectItemAt() {
        //GIVEN
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        XCTAssertFalse(presenter.didSelectItem)
        XCTAssertNil(presenter.selectedIndex)
        let index = 1
        
        //WHEN
        sut.collectionView(collectionView, didSelectItemAt: IndexPath(item: index, section: 0))
        
        //THEN
        XCTAssertTrue(presenter.didSelectItem)
        XCTAssertEqual(presenter.selectedIndex, index)
    }
    
    func test_didReachEndOfPage() {
        //GIVEN
        XCTAssertFalse(presenter.reachedEndOfPage)
        let scrollView = UIScrollView()
        
        //WHEN
        sut.scrollViewDidEndDecelerating(scrollView)
        
        //THEN
        XCTAssertTrue(presenter.reachedEndOfPage)
    }
    
    func test_cellForItemAt() {
        //GIVEN
        let index = 0
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: "MealCollectionViewCell")
        sut.meals = mockMeals
        
        //WHEN
        let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(item: index, section: 0))
        
        //THEN
        XCTAssertNotNil(cell)
    }
    
    func test_searchBartextDidChange() {
        //GIVEN
        let searchBar = UISearchBar()
        XCTAssertFalse(presenter.queryTextChanged)
        XCTAssertEqual(presenter.query, "")
        let newQuery = "Spaghetti"
        
        //WHEN
        sut.searchBar(searchBar, textDidChange: newQuery)
        
        //THEN
        XCTAssertTrue(presenter.queryTextChanged)
        XCTAssertEqual(presenter.query, newQuery)
    }
    
    func test_searchBarSearchButtonClicked() {
        //GIVEN
        let searchBar = UISearchBar()
        
        //WHEN
        sut.searchBarSearchButtonClicked(searchBar)
        
        //THEN
        XCTAssertFalse(sut.view.isFirstResponder)
    }
    
    @MainActor func test_reloadWithMeals() {
        //GIVEN
        XCTAssertTrue(sut.meals.isEmpty)
        
        //WHEN
        sut.reload(with: mockMeals)
        
        //THEN
        XCTAssertEqual(sut.meals.count, mockMeals.count)
    }
    
    func test_configureNavigationBar() {
        //GIVEN
        let title = "Recipe Roamer"
        
        //WHEN
        sut.configureNavigationBar()
        
        //THEN
        XCTAssertEqual(sut.title, title)
    }
    
}
