//
//  UIViewController+Ext.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 29.01.2024.
//

import Foundation
import JGProgressHUD

extension UIViewController {
    
    static let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading"
        return hud
    }()
    
    @MainActor
    func showLoader(_ show: Bool) {
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}
