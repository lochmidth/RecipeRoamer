//
//  MealListViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

protocol MealListViewOutput: AnyObject {
    func viewDidLoad()
    func didReachEndOfPage()
    func didSelectItem(at index: Int)
    func queryTextDidChange(_ query: String)
}

final class MealListViewController: UIViewController {
    //MARK: - Properties
    
    var presenter: MealListViewOutput!
    
    let mealListView = MealListView()
    
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MealCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: \(indexPath.row). cell is clicked")
        presenter.didSelectItem(at: indexPath.item)
        let recipe = MealRecipeViewController()
        navigationController?.pushViewController(recipe, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("DEBUG: End of page, no more meal. Handle Load more meals")
        presenter.didReachEndOfPage()
    }
}

extension MealListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.queryTextDidChange(searchText)
    }
}

extension MealListViewController: MealListViewInput {
    func configureNavigationBar() {
        navigationItem.title = "Recipe Roamer"
    }
}
