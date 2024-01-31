//
//  MealListViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit
import JGProgressHUD

protocol MealListViewOutput: AnyObject {
    func viewDidLoad()
    func didReachEndOfPage(_ scrollView: UIScrollView)
    func didSelectItem(at index: Int)
    func queryTextDidChange(_ query: String)
}

final class MealListViewController: UIViewController {
    //MARK: - Properties
    
    var presenter: MealListViewOutput!
    private let mealListView = MealListView()
    private var meals = [Meal]()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        mealListView.collectionView.delegate = self
        mealListView.collectionView.dataSource = self
        mealListView.searchBar.delegate = self
        view = mealListView
    }
}

extension MealListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MealCollectionViewCell
        cell.configureCell(with: meals[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath.item)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        presenter.didReachEndOfPage(scrollView)
    }
}

extension MealListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.queryTextDidChange(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

extension MealListViewController: MealListViewInput {
    func reload(with meals: [Meal]) {
        self.meals = meals
        self.mealListView.collectionView.reloadData()
    }
    
    func showLoading() {
        showLoader(true)
    }
    
    func hideLoading() {
        showLoader(false)
    }
    
    func configureNavigationBar() {
        title = "Recipe Roamer"
    }
    
    func configureKeyboardDismissal() {
        setupTapGestureforKeyboardDismissal()
    }
}
