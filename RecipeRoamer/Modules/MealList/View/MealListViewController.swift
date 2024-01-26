//
//  MealListViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

protocol MealListViewInput: AnyObject {
    
}

final class MealListViewController: UIViewController {
    //MARK: - Properties
    
    let mealListView = MealListView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    override func loadView() {
        mealListView.output = self
        view = mealListView
    }
    
    //MARK: - Helpers
    
    private func configureNavigationBar() {
        navigationItem.title = "Recipe Roamer"
    }
}

extension MealListViewController: MealListViewOutput {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MealCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: \(indexPath.row). cell is clicked")
    }
}

#Preview(traits: .defaultLayout, body: {
    UINavigationController(rootViewController: MealListViewController())
})
