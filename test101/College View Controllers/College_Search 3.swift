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
    
    lazy var Bottom_Taskbar_View : UIView = {
            let iv = UIView()
            //MARK: handle search
            let search = UIButton()
            search.translatesAutoresizingMaskIntoConstraints = false
            search.layer.cornerRadius = 10
            iv.addSubview(search)
            search.backgroundColor = UIColor.systemBlue
            search.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 70).isActive = true
            search.heightAnchor.constraint(equalToConstant: 50).isActive = true
            search.widthAnchor.constraint(equalToConstant: 50).isActive = true
            search.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true

            let searchimage = UIImage(named: "search")
            let searchimageView = UIImageView(image: searchimage!)
            searchimageView.translatesAutoresizingMaskIntoConstraints = false
            search.addSubview(searchimageView)
            searchimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            searchimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            searchimageView.centerYAnchor.constraint(equalTo: search.centerYAnchor, constant: 0).isActive = true
            searchimageView.centerXAnchor.constraint(equalTo: search.centerXAnchor, constant: 0).isActive = true


            //MARK: handle home
            let home = UIButton()
            home.translatesAutoresizingMaskIntoConstraints = false
            home.layer.cornerRadius = 10
            iv.addSubview(home)
            home.backgroundColor = UIColor.systemBlue
            home.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
            home.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
            home.heightAnchor.constraint(equalToConstant: 50).isActive = true
            home.widthAnchor.constraint(equalToConstant: 50).isActive = true

            let homeimage = UIImage(named: "home")
            let homeimageView = UIImageView(image: homeimage!)
            homeimageView.translatesAutoresizingMaskIntoConstraints = false
            home.addSubview(homeimageView)
            homeimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            homeimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            homeimageView.centerYAnchor.constraint(equalTo: home.centerYAnchor, constant: 0).isActive = true
            homeimageView.centerXAnchor.constraint(equalTo: home.centerXAnchor, constant: 0).isActive = true
            home.addTarget(self, action: #selector(bring_up_home_page(sender:)), for: .touchUpInside)


            //MARK: handle bookmark
            let bookmark = UIButton()
            bookmark.translatesAutoresizingMaskIntoConstraints = false
            iv.addSubview(bookmark)
            bookmark.layer.cornerRadius = 10
            bookmark.backgroundColor = UIColor.systemBlue
            bookmark.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -70).isActive = true
            bookmark.heightAnchor.constraint(equalToConstant: 50).isActive = true
            bookmark.widthAnchor.constraint(equalToConstant: 50).isActive = true
            bookmark.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
            let bookmarkimage = UIImage(named: "bookmark")
            let bookmarkimageView = UIImageView(image: bookmarkimage!)
            bookmarkimageView.translatesAutoresizingMaskIntoConstraints = false
            bookmark.addSubview(bookmarkimageView)
            bookmarkimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            bookmarkimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            bookmarkimageView.centerYAnchor.constraint(equalTo: bookmark.centerYAnchor, constant: 0).isActive = true
            bookmarkimageView.centerXAnchor.constraint(equalTo: bookmark.centerXAnchor, constant: 0).isActive = true
            bookmark.addTarget(self, action: #selector(bring_up_bookmark_page(sender:)), for: .touchUpInside)

            iv.backgroundColor = UIColor.black
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
    }()
    
    @objc func bring_up_home_page (sender: UIButton){
        weak var temp = self.presentingViewController
        dismiss(animated: true, completion: {
            let home = College_VC()
            home.modalPresentationStyle = .fullScreen
            temp?.present(home, animated: true)
        })
    }
    @objc func bring_up_bookmark_page (sender: UIButton){
            weak var temp = self.presentingViewController
            dismiss(animated: true, completion: {
                let home = College_Search()
                home.modalPresentationStyle = .fullScreen
                temp?.present(home, animated: true)
            })

    //        present(College_Search(), animated: false)
        }

        //MARK: Setup Bottom Taskbar
        public func setup_Bottom_Taskbar(){
            view.addSubview(Bottom_Taskbar_View)
            Bottom_Taskbar_View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
            Bottom_Taskbar_View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
            Bottom_Taskbar_View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
            Bottom_Taskbar_View.topAnchor.constraint(equalTo: college_table_view.bottomAnchor, constant: 0).isActive = true
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
            let secondVC = College_Detailed_VC()
            
            secondVC.College_Data = college_list[indexPath.row]//added
            
            secondVC.modalPresentationStyle = .fullScreen
            present(secondVC, animated: true, completion: nil)
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
        college_table_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        college_table_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .black
        setup_table_view()
        get_Data(file_path: "test")
        setup_Bottom_Taskbar()
        configure_search_bar()
        search_controller = UISearchController(searchResultsController: nil)
    }
}


//MARK: CUSTOMIZED TABLEVIEW CELL
class search_customized_cell : UITableViewCell {

    lazy var logo : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 5
        iv.backgroundColor = UIColor.systemGray
        iv.clipsToBounds = true
        return iv
    }()

    //MARK: Customized UILabel
    lazy var name : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        lb.font = UIFont(name: "Georgia", size: 12)
        lb.clipsToBounds = true
        return lb
    }()

    lazy var bookmark_button : UIButton = {
       var bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "save")
        bt.setImage(image, for: .normal)
        bt.clipsToBounds = true
        return bt
    }()

    //MARK: Customized Format for Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "search_tableView_cell")
        contentView.addSubview(logo)
        contentView.addSubview(name)
        contentView.addSubview(bookmark_button)
        logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        logo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 1).isActive = true

        name.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 60).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        bookmark_button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        bookmark_button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bookmark_button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        bookmark_button.widthAnchor.constraint(equalTo: bookmark_button.heightAnchor).isActive = true


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

