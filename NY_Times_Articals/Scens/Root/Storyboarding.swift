//
//  Storyboarding.swift
//  NY_Times_Articals
//
//  Created by Ali Waseem on 28/07/2024.
//

import UIKit

protocol Storyboarding {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboarding where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

    static var storyboardName: String {
        return "Main"
    }
}
