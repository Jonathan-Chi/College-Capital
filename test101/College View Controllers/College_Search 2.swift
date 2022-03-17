//
//  TableView_Sample.swift
//  test101
//
//  Created by Jonathan Chi on 7/21/21.
//

import Foundation
import UIKit

class College_Search : UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UINavigationControllerDelegate {
    var college_list = [College]()
    var searched_college_list = [College]()
    var in_search_mode : Bool = false

    deinit{
        print("viewcontroller is denitialized")
    }
    
    func get_Data(file_path : String){
        
        guard let path = Bundle.main.path(forResource : file_path, ofType: "json") else {return}
        
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            parse(json: data)
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        do {
            let jsonColleges = try decoder.decode([College].self, from: json)
            college_list = jsonColleges
            self.college_table_view.reloadData()
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
        }
    }

        //MARK: SEARCH
        
        var search_controller = UISearchController()
        var search_bar = UISearchBar()

        public func configure_search_bar(){
                //contains UITextField
                //similar to UIButton which contains UIImageView and UILabel
            search_bar.sizeToFit()
            search_bar.delegate = self
            search_bar.barStyle = .black
            search_bar.backgroundColor = .black
            search_bar.placeholder = "Search for Colleges"
            search_bar.autocapitalizationType = .none
            search_bar.barTintColor = .systemBlue
            search_bar.searchTextField.textColor = .systemBlue
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
            searched_college_list = college_list.filter({ raw_Data -> Bool in raw_Data.college_name.lowercased().contains(searchText.lowercased())
            })
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
                cell.name.text = searched_college_list[indexPath.row].college_name
                var url_link = "https://logo.clearbit.com/"
                url_link+=searched_college_list[indexPath.row].domain!

                cell.logo.downloaded(from: url_link, contentMode: .scaleAspectFit)
                cell.backgroundColor = .black
                return cell
            }
            else{
                cell.name.text = college_list[indexPath.row].college_name


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
        view.backgroundColor = .black
        setup_table_view()
        get_Data(file_path: "data")
        configure_search_bar()
        search_controller = UISearchController(searchResultsController: nil)
    }
}


//MARK: CUSTOMIZED TABLEVIEW CELL
