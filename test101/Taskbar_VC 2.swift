//
//  File.swift
//  test101
//
//  Created by Jonathan Chi on 7/8/21.
//

import UIKit

class Taskbar_VC : UITabBarController {
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        //MARK: Declaring an instance of first icon's class
        
        let first_view = Home_VC()
        let second_view = College_Top_Thirty()
        
        //MARK: Connect the tabbar item to each view controller
        
        first_view.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "camera" ), tag: 0)
        second_view.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        
        //MARK: Creating a viewcontroller list
        let list = [first_view, second_view]
        
        //assigning the array of views to the TabBarController
        viewControllers = list
        
        
        
    }
    
    
    
    
    
    
    
    
}
