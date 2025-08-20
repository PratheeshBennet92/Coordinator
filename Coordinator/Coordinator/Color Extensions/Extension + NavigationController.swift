//
//  Extension + NavigationController.swift
//  FalconForms
//
//  Created by Pratheesh Bennet on 20/08/25.
//

import UIKit


extension UINavigationController {
  func setupAppearance(backgroundColor: UIColor = .systemBackground,
                       textColor: UIColor = .label) {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = backgroundColor
    appearance.titleTextAttributes = [.foregroundColor: textColor]
    appearance.largeTitleTextAttributes = [.foregroundColor: textColor]
    
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
    navigationBar.compactAppearance = appearance
    navigationBar.tintColor = UIColor { trait in
      if trait.userInterfaceStyle == .dark {
        // Dark mode tint
        return UIView().tintColor
      } else {
        // Light mode tint
        return UIColor(red: 18/255.0, green: 26/255.0, blue: 140/255.0, alpha: 1.0)
      }
    }
  }
}
