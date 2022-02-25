//
//  Search_Model_TableView.swift
//  test101
//
//  Created by Alex Huang on 8/15/21.
//

import Foundation
import UIKit

class Search_Model_TableView : UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UINavigationControllerDelegate {
    
    // MARK: declare data container
    var original_data = [String]()
    var searching_data = [String]()
    
    // MARK: declare switch
    var in_Search_Mode: Bool = false
    
    // MARK: declare UISearchController & UISearchBar
    var search_Controller = UISearchController()
    var search_Bar = UISearchBar()
    
    // MARK: configure UISearchBar
    func configure_SearchBar() {
        // MARK: search bar contains UITextField
        // MARK: similar to UIButton which contains UIImageView and UILabel
        search_Bar.sizeToFit()
        search_Bar.delegate = self
        search_Bar.barStyle = .default
        search_Bar.placeholder = "Search"
        navigationItem.titleView = search_Bar
        search_Bar.autocapitalizationType = .none
        search_Bar.tintColor = .black
    }
    
    // MARK: handle search logic (filter)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // declare object of input message
        let searchText = searchText.lowercased()
        
        // check if searchText is empty
        guard !searchText.isEmpty else {
            searching_data = original_data
            model_tableview.reloadData()
            return
        }
        
        // MARK: filter
        searching_data = original_data.filter({ raw_Data -> Bool in
            raw_Data.lowercased().contains(searchText.lowercased())
        })
        
        //MARK: turn in search mode on
        in_Search_Mode = true
        
        // MARK: reload tableview again
        model_tableview.reloadData()
    }
    
    // MARK: handle search bar text did begin editing
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    // MARK: search bar cancel button clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    
    // MARK: resign to the first responder
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if in_Search_Mode {
            return searching_data.count
        } else {
            return original_data.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = model_tableview.dequeueReusableCell(withIdentifier: "test", for: indexPath)
        
        if in_Search_Mode {
            cell.textLabel?.text = searching_data[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = original_data[indexPath.row]
            return cell
        }
    }
    
    lazy var model_tableview: UITableView = {
        let tb = UITableView()
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "test")
        tb.frame = view.frame
        return tb
    }()
    
    // Testing data implementation
    func adding_data() {
        for i in 1..<10 {
            original_data.append(" \(i) ")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        adding_data()
        configure_SearchBar()
        
        view.addSubview(model_tableview)
        model_tableview.delegate = self
        model_tableview.dataSource = self
        
        // MARK: initialize search controller
        search_Controller = UISearchController(searchResultsController: nil)
    }
}


