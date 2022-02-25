//
//  TableView_Sample.swift
//  test101
//
//  Created by Jonathan Chi on 7/21/21.
//

import Foundation
import UIKit

class College_Search : UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UINavigationControllerDelegate {
   
    var searched_college_list = [College]()
    var in_search_mode : Bool = false

    
   

        //MARK: SEARCH
        
        var search_controller = UISearchController()
        var search_bar = UISearchBar()

        public func configure_search_bar(){
                //contains UITextField
                //similar to UIButton which contains UIImageView and UILabel
            search_bar.sizeToFit()
            search_bar.delegate = self
            search_bar.barStyle = .default
            search_bar.backgroundColor = .black
            search_bar.placeholder = return_text(en: "Search for Colleges", es:"Búsqueda de universidades", zh: "搜寻大学")
            search_bar.autocapitalizationType = .none
            
            search_bar.searchTextField.textColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
            navigationItem.titleView = search_bar
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            //declare object of input message
            let searchText = searchText.lowercased()

            guard !searchText.isEmpty else{//do have input
                searched_college_list = college_list
                college_table_view.reloadData()
                return
            }
            //filter
            if language == .ES {
                searched_college_list = college_list.filter({ raw_Data -> Bool in raw_Data.college_nameES!.lowercased().contains(searchText.lowercased())})
            } else if language == .ZH {
                searched_college_list = college_list.filter({ raw_Data -> Bool in raw_Data.college_nameZH!.lowercased().contains(searchText.lowercased())})
            } else {
                searched_college_list = college_list.filter({ raw_Data -> Bool in raw_Data.college_name.lowercased().contains(searchText.lowercased())})
            }
            in_search_mode = true

            college_table_view.reloadData()
        }
    
        //handle searchbar text did being editing (status)
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
            //add some extra action
        }

        //search bar cancel button clicked
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    
    //MARK: TABLEVIEW
    
    let college_table_view_identifier : String = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if in_search_mode {
            return searched_college_list.count
        }
        return college_list.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//defines height for each row
            return 50
        }
        //MARK: bring up detailed view
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if in_search_mode{
                let secondVC = College_Detailed_VC()
                secondVC.College_Data = searched_college_list[indexPath.row]
                secondVC.modalPresentationStyle = .fullScreen
                present(secondVC, animated: true, completion: nil)
            }
            else{
                let secondVC = College_Detailed_VC()
                secondVC.College_Data = college_list[indexPath.row]
                secondVC.modalPresentationStyle = .fullScreen
                present(secondVC, animated: true, completion: nil)
            }
            
            
            
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//styling for each cell, imports custom search cell
            
            let cell = college_table_view.dequeueReusableCell(withIdentifier: college_table_view_identifier, for: indexPath) as! search_customized_cell
            
            
            if in_search_mode{
                cell.name.text = return_text(en: searched_college_list[indexPath.row].college_name, es: searched_college_list[indexPath.row].college_nameES!, zh: searched_college_list[indexPath.row].college_nameZH!)
                var url_link = "https://logo.clearbit.com/"
                url_link+=searched_college_list[indexPath.row].domain!

                cell.logo.downloaded(from: url_link, contentMode: .scaleAspectFit)
                cell.backgroundColor = .black
                return cell
            }
            else{
                cell.name.text = return_text(en: college_list[indexPath.row].college_name, es: college_list[indexPath.row].college_nameES!, zh: college_list[indexPath.row].college_nameZH!)


                var url_link = "https://logo.clearbit.com/"
                url_link+=college_list[indexPath.row].domain!

                cell.logo.downloaded(from: url_link, contentMode: .scaleAspectFit)
                cell.backgroundColor = .black
                return cell
            }
            
            //loops through saved colleges array to check if
        }
    
    lazy var college_table_view : UITableView = {
       let tb = UITableView()
        tb.register(search_customized_cell.self, forCellReuseIdentifier: college_table_view_identifier)
        tb.backgroundColor = .black
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    func setup_table_view(){
        view.addSubview(college_table_view)
        college_table_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        college_table_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        college_table_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        self.college_table_view.reloadData()
        setup_table_view()
        configure_search_bar()
        search_controller = UISearchController(searchResultsController: nil)
    }
}


//MARK: CUSTOMIZED TABLEVIEW CELL
