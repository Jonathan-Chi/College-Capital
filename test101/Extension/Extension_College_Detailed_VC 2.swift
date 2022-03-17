//
//  Extension_College_Detailed_VC.swift
//  test101
//
//  Created by Jonathan Chi on 8/1/21.
//

import Foundation
import UIKit

extension College_Detailed_VC : UITableViewDelegate, UITableViewDataSource{
    
    func set_arrays() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        popular_majors = College_Data?.popular_majors
        highest_earning_majors = College_Data?.top_salaries
        if let popular = popular_majors {
            for major in popular {
//                guard let earnings = major["earnings"] else {
//                    continue
//                }
//                var earnings: String
//                var grads: Int
//                if let m = major {
//                    if m["earnings"] == nil {
//                        earnings = "No Data"
//                    } else {
//                        let received = Double(m["earnings"]!!)
//                        let formatted = numberFormatter.string(from: NSNumber(floatLiteral: received!))!
//                        earnings = formatted
//                        print(earnings)
//                    }
////                    if m["counts"]
//                }
//                if earnings != nil {
//                    let converted_earnings = Double(earnings!)
//                    let formattedSalary = numberFormatter.string(from: NSNumber(floatLiteral: converted_earnings!))!
//                    print(formattedSalary)
//                    popular_majors_data_array.append(ExpandableArray(isExpanded: false, category: ["Median Earnings: " + formattedSalary, "41", "127410"]))
//                }
            }
        }
        highest_earning_majors = College_Data?.top_salaries
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//defines height for each row
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//defines number of rows
        if tableView == popular_majors_tableview{
            if !popular_majors_data_array[section].isExpanded {
                //code to be executed
                return 0
            }
            return popular_majors_data_array[section].category.count
        }
        
        if tableView == highest_earning_majors_tableview{
            if !highest_earning_majors_data_array[section].isExpanded {
                //code to be executed
                return 0
            }
            return highest_earning_majors_data_array[section].category.count
        }
        
        return 2
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//defines properties of each row (cell)
        
        if tableView == popular_majors_tableview {
           let cell = popular_majors_tableview.dequeueReusableCell(withIdentifier: "popular_majors", for: indexPath) as! college_detailed_tableview_cell
            
            //creating a new customized tableview cell because we want to add buttons and other structures
            
            let major_element = popular_majors_data_array[indexPath.section].category[indexPath.row]//row is for tableview,
            
            
            cell.detailed_text.text = major_element

            return cell
    }
        
        if tableView == highest_earning_majors_tableview {
            let cell = highest_earning_majors_tableview.dequeueReusableCell(withIdentifier: "highest_earning_majors", for: indexPath) as! college_detailed_tableview_cell

            //creating a new customized tableview cell because we want to add buttons and other structures

            let major_element = highest_earning_majors_data_array[indexPath.section].category[indexPath.row]//row is for tableview,


            cell.detailed_text.text = major_element

            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == popular_majors_tableview {
            return popular_majors_data_array.count
        }
        if tableView == highest_earning_majors_tableview {
            return highest_earning_majors_data_array.count
        }
        return 10
    }
    
    //MARK: DROPDOWN HEADERS
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //use section to iterate
        //indexPath. modify major title and graduates title
        var major_name : String = ""
        if tableView == popular_majors_tableview{
            major_name = popular_majors_data_array[section].category[0]
        }
        if tableView == highest_earning_majors_tableview{
            major_name = highest_earning_majors_data_array[section].category[0]
        }
        var graduates : String = ""
        if tableView == popular_majors_tableview{
            graduates = popular_majors_data_array[section].category[2]
        }
        if tableView == highest_earning_majors_tableview{
            graduates = highest_earning_majors_data_array[section].category[2]
        }
        
        //return base view
        
        //if data base is finalized please try to insert data to this expandable tableview
        //change two dimensional data array
        let drop_down_button = UIButton()
        drop_down_button.translatesAutoresizingMaskIntoConstraints = false
        drop_down_button.tag = section
        drop_down_button.setImage(UIImage(named: "drop_down"), for: .normal)

        let container : UIView = {
            let iv = UIView()
            iv.backgroundColor = .white

            let major_title = UILabel()
            major_title.text = major_name
            major_title.textColor = Style.myApp.color(for: .subsubtitle)
            major_title.font = Style.myApp.font(for: .subsubtitle)
            major_title.translatesAutoresizingMaskIntoConstraints = false


            let graduate_number = UILabel()
            graduate_number.text = graduates
            graduate_number.textColor = Style.myApp.color(for: .subsubtitle)
            graduate_number.font = Style.myApp.font(for: .subsubtitle)
            graduate_number.translatesAutoresizingMaskIntoConstraints = false


            iv.addSubview(drop_down_button)
            iv.addSubview(graduate_number)
            iv.addSubview(major_title)

            major_title.centerYAnchor.constraint(equalTo: iv.centerYAnchor).isActive = true
            major_title.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 15).isActive = true

            graduate_number.centerYAnchor.constraint(equalTo: iv.centerYAnchor).isActive = true
            graduate_number.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -75).isActive = true


            drop_down_button.centerYAnchor.constraint(equalTo: major_title.centerYAnchor).isActive = true
            drop_down_button.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -15).isActive = true
            drop_down_button.heightAnchor.constraint(equalTo: iv.heightAnchor, multiplier: 0.45).isActive = true
            drop_down_button.widthAnchor.constraint(equalTo: drop_down_button.heightAnchor).isActive = true


            return iv
        }()
        if tableView == popular_majors_tableview{
            drop_down_button.addTarget(self, action: #selector(handle_popular_expansion), for: .touchUpInside)
        }
        if tableView == highest_earning_majors_tableview{
            drop_down_button.addTarget(self, action: #selector(handle_highest_earning_expansion), for: .touchUpInside)
        }
        
        return container
        
    }
    //MARK: HEADER HEIGHT
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    
    //MARK: EXPANSION FUNCTIONS
    @objc func handle_popular_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in popular_majors_data_array[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = popular_majors_data_array[section].isExpanded
        popular_majors_data_array[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            popular_majors_tableview.deleteRows(at: indexPaths, with: .fade)
        }else{
            popular_majors_tableview.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    @objc func handle_highest_earning_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in highest_earning_majors_data_array[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = highest_earning_majors_data_array[section].isExpanded
        highest_earning_majors_data_array[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            highest_earning_majors_tableview.deleteRows(at: indexPaths, with: .fade)
        }else{
            highest_earning_majors_tableview.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    
    
}


//MARK: EACH CELLS FORMAT
class college_detailed_tableview_cell : UITableViewCell{
    
    let icon_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let detailed_text : UITextView = {
       let tx = UITextView()
        tx.isUserInteractionEnabled = false
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "popular_major")
        contentView.addSubview(icon_image)
        contentView.addSubview(detailed_text)
        
        //icon layout
        icon_image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        icon_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        icon_image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        icon_image.heightAnchor.constraint(equalToConstant: 60).isActive = true
        icon_image.widthAnchor.constraint(equalTo: icon_image.heightAnchor, multiplier: 1).isActive = true
              
        detailed_text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        detailed_text.leadingAnchor.constraint(equalTo: icon_image.trailingAnchor, constant: 10).isActive = true
        detailed_text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        detailed_text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




struct ExpandableArray{
    var isExpanded : Bool
    let category : [String]//stores the credentials, awards, and salary of each major
}
