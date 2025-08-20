//
//  Extension + TabController.swift
//  FalconForms
//
//  Created by Pratheesh Bennet on 20/08/25.
//

import UIKit

extension UITabBarController {
  func setupAppearance(backgroundColor: UIColor = .systemBackground,
                       textColor: UIColor = .label) {
    let appearance = UITabBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = backgroundColor
    
    tabBar.standardAppearance = appearance
    tabBar.scrollEdgeAppearance = appearance
    tabBar.tintColor = UIColor { trait in
      if trait.userInterfaceStyle == .dark {
        // Dark mode tint
        return UIView().tintColor
      } else {
        // Light mode tint
        return UIColor(red: 18/255.0, green: 26/255.0, blue: 140/255.0, alpha: 1.0)
      }
    }
    tabBar.unselectedItemTintColor = textColor.withAlphaComponent(0.6)
  }
}
