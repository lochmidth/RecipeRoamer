//
//  MealRecipeViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

protocol MealRecipeViewOutput: AnyObject {
    
}

class MealRecipeViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MealRecipeViewOutput!
    
    let mealRecipeView = MealRecipeView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func loadView() {
        mealRecipeView.tableView.delegate = self
        mealRecipeView.tableView.dataSource = self
        view = mealRecipeView
    }
}

extension MealRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        var content = UIListContentConfiguration.valueCell()
            
            switch indexPath.row {
            case 0:
                // Meal Name Cell
                content.text = "Beef Mechado"
                content.prefersSideBySideTextAndSecondaryText = true
                content.secondaryText = "Stew, Warming"
                content.image = UIImage(systemName: "fork.knife")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                
            case 1:
                // Ingredients Cell
                content.text = "3 gloves Garlic\n1 sliced Onion\n2 lbs Beef\n8 ounces Tomato Puree\n1 cup Water\n3 tps Olive oil\n1 slice Lemon\n1 large Potatoes\n1/4 cup Soy Souce\n1/2 tps Black Pepper\n2 Bay Leaves\nTo Taste Salt"
                content.image = UIImage(systemName: "list.bullet")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            case 2:
                // Instructions Cell
                content.text = "0.\tMake the beef tenderloin marinade by combining soy sauce, vinegar, ginger, garlic, sesame oil, olive oil, sugar, salt, and ground black pepper in a large bowl. Mix well.\r\n1.\tAdd the cubed beef tenderloin to the bowl with the beef tenderloin marinade. Gently toss to coat the beef. Let it stay for 1 hour.\r\n2.\tUsing a metal or bamboo skewer, assemble the beef kebob by skewering the vegetables and marinated beef tenderloin.\r\n3.\tHeat-up the grill and start grilling the beef kebobs for 3 minutes per side. This will give you a medium beef that is juicy and tender on the inside. Add more time if you want your beef well done, but it will be less tender.\r\n4.\tTransfer to a serving plate. Serve with Saffron rice.\r\n5.\tShare and enjoy!\r\n"
                content.image = UIImage(systemName: "book")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            default:
                break
            }
            
            cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MealRecipeHeaderView()
        header.configure()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
}

extension MealRecipeViewController: MealRecipeViewInput {
    
}

#Preview(traits: .defaultLayout, body: {
    UINavigationController(rootViewController: MealRecipeViewController())
})
