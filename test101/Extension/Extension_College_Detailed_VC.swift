//
//  Extension_College_Detailed_VC.swift
//  test101
//
//  Created by Jonathan Chi on 8/1/21.
//

import Foundation
import UIKit

extension College_Detailed_VC : UITableViewDelegate, UITableViewDataSource{
    
    func calculate_colors() -> Void {
        if let r = College_Data?.red {
            let g = (College_Data?.green)!
            let b = (College_Data?.blue)!
            background_color = UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
            text_mode = colorDetect.calculate_text_color(r: Double(r), g: Double(g), b: Double(b))
        } else {
            text_mode = colorDetect.dark
            background_color = .lightGray
        }
        
    }
    
    func set_headers() {
        popular_majors = College_Data?.popular_majors
        highest_earning_majors = College_Data?.top_salaries
        if let popular = popular_majors {
            var name = NO_DATA_CONSTANT
            var level = ""
            for major in popular {
                if let m = major {
                    if let title = m["title"] {
                        name = title ?? NO_DATA_CONSTANT
                        if name != NO_DATA_CONSTANT {
                            level = m["credential"]! ?? ""
                            popular_majors_data_array.append(ExpandableArray(isExpanded: false, category: [name + " - " + level]))
//                            print(name + " - " + level)
                        }
                    }
                }
            }
        }
        if let highest = highest_earning_majors {
            var name = NO_DATA_CONSTANT
            var level = ""
            for major in highest {
                if let m = major {
                    if let title = m["title"] {
                        name = title ?? NO_DATA_CONSTANT
                        if name != NO_DATA_CONSTANT {
                            level = m["credential"]! ?? ""
                            highest_earning_majors_data_array.append(ExpandableArray(isExpanded: false, category: [name + " - " + level]))
                        }
                    }
                }
            }
        }
    }
    func set_arrays() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        popular_majors = College_Data?.popular_majors
        highest_earning_majors = College_Data?.top_salaries
        if let popular = popular_majors {
            for i in 0..<popular.count {
                var earnings: String = NO_DATA_CONSTANT
                var grads: String = NO_DATA_CONSTANT
                if let m = popular[i] {
                    if let earn = m["earnings"] {
                        earnings = earn ?? NO_DATA_CONSTANT
                    }
                    if earnings != NO_DATA_CONSTANT {
                        let received = Double(earnings)
                        let formatted = numberFormatter.string(from: NSNumber(floatLiteral: received!))!
                        earnings = "$" + formatted
                    }
                    if let count = m["counts"] {
                        grads = count ?? NO_DATA_CONSTANT
                    }
                    if grads != NO_DATA_CONSTANT {
                        let received = Double(grads)
                        let formatted = numberFormatter.string(from: NSNumber(floatLiteral: received!))!
                        grads = formatted
                    }
//                    if m["counts"]
                }
                popular_majors_data_array[i].category.append(grads)
                popular_majors_subarray.append(ExpandableArray(isExpanded: false, category: ["Median Earnings: " + earnings, "Graduates: " + grads]))
                
//                if earnings != nil {
//                    let converted_earnings = Double(earnings!)
//                    let formattedSalary = numberFormatter.string(from: NSNumber(floatLiteral: converted_earnings!))!
//                    print(formattedSalary)
//                    popular_majors_data_array.append(ExpandableArray(isExpanded: false, category: ["Median Earnings: " + formattedSalary, "41", "127410"]))
//                }
            }
        }
        highest_earning_majors = College_Data?.top_salaries
        if let highest = highest_earning_majors {
            for i in 0..<highest.count {
                var earnings: String = NO_DATA_CONSTANT
                var grads: String = NO_DATA_CONSTANT
                if let m = highest[i] {
                    if let earn = m["earnings"] {
                        earnings = earn ?? NO_DATA_CONSTANT
                    }
                    if earnings != NO_DATA_CONSTANT {
                        let received = Double(earnings)
                        let formatted = numberFormatter.string(from: NSNumber(floatLiteral: received!))!
                        earnings = "$" + formatted
                    }
                    if let count = m["counts"] {
                        grads = count ?? NO_DATA_CONSTANT
                    }
                    if grads != NO_DATA_CONSTANT {
                        let received = Double(grads)
                        let formatted = numberFormatter.string(from: NSNumber(floatLiteral: received!))!
                        grads = formatted
                    }
//                    if m["counts"]
                }
                 highest_earning_majors_data_array[i].category.append(earnings)
                highest_earning_majors_subarray.append(ExpandableArray(isExpanded: false, category: ["Median Earnings: " + earnings, "Graduates: " + grads]))
                 // popular_majors_subarray.append(ExpandableArray(isExpanded: false, category: ["Median Earnings: " + earnings, "Graduates: " + grads]))
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//defines height for each row
//        return popular_majors_data_array[indexPath.section].category[0].heightWithConstrainedWidth(width: popular_majors_tableview.bounds.width, font: Style.myApp.font(for: .subsubtitle))
         return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//defines number of rows
        if tableView == popular_majors_tableview{
            if !popular_majors_subarray[section].isExpanded {
                //code to be executed
                return 0
            }
            return popular_majors_subarray[section].category.count
        }
        
        if tableView == highest_earning_majors_tableview{
            if !highest_earning_majors_subarray[section].isExpanded {
                //code to be executed
                return 0
            }
            return highest_earning_majors_subarray[section].category.count
        }
        
        return 2
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//defines properties of each row (cell)
        
        if tableView == popular_majors_tableview {
           let cell = popular_majors_tableview.dequeueReusableCell(withIdentifier: "popular_majors", for: indexPath) as! college_detailed_tableview_cell
            
            //creating a new customized tableview cell because we want to add buttons and other structures
            
            let major_element = popular_majors_subarray[indexPath.section].category[indexPath.row]//row is for tableview,
            
            
            cell.detailed_text.text = major_element
            cell.icon_image.image = UIImage(named: expansion_image_array[indexPath.row])
            cell.selectionStyle = .none

            return cell
    }
        
        if tableView == highest_earning_majors_tableview {
            let cell = highest_earning_majors_tableview.dequeueReusableCell(withIdentifier: "highest_earning_majors", for: indexPath) as! college_detailed_tableview_cell

            //creating a new customized tableview cell because we want to add buttons and other structures

            let major_element = highest_earning_majors_subarray[indexPath.section].category[indexPath.row]//row is for tableview,


            cell.detailed_text.text = major_element
            cell.icon_image.image = UIImage(named: expansion_image_array[indexPath.row])
            cell.selectionStyle = .none

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
//        var medEarnings : String = ""
//        if tableView == popular_majors_tableview{
//            medEarnings = popular_majors_data_array[section].category[1]
//        }
//        if tableView == highest_earning_majors_tableview{
//            medEarnings = highest_earning_majors_data_array[section].category[0]
//        }
        var graduates : String = ""
        if tableView == popular_majors_tableview{
            graduates = popular_majors_data_array[section].category[1]
        }
        if tableView == highest_earning_majors_tableview{
            graduates = highest_earning_majors_data_array[section].category[1]
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
            if major_name.count > 40 {
                major_title.font = Style.myApp.font(for: .information)
            }
            major_title.translatesAutoresizingMaskIntoConstraints = false
            major_title.numberOfLines = 0
            major_title.contentMode = .scaleAspectFill


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
            major_title.widthAnchor.constraint(equalToConstant: popular_majors_tableview.bounds.width * 0.58).isActive = true
//            major_title.trailingAnchor.constraint(equalTo: graduates_label.leadingAnchor, constant: 5).isActive = true
            major_title.heightAnchor.constraint(equalToConstant: major_name.heightWithConstrainedWidth(width: popular_majors_tableview.bounds.width * 0.58, font: major_title.font)).isActive = true
            
            graduate_number.centerYAnchor.constraint(equalTo: drop_down_button.centerYAnchor, constant: -2).isActive = true
            
            if tableView == popular_majors_tableview {
                graduate_number.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -75).isActive = true
            } else {
                graduate_number.trailingAnchor.constraint(equalTo: drop_down_button.leadingAnchor, constant: -20).isActive = true
            }
            
//            if tableView == highest_earning_majors_tableview {
//                graduate
//            }
            
//            major_title.trailingAnchor.constraint(equalTo: graduate_number.leadingAnchor, constant: 5).isActive = true
//            major_title.heightAnchor.constraint(equalToConstant: major_name.heightWithConstrainedWidth(width: major_title.bounds.width, font: major_title.font)).isActive = true


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
        return 55
    }
    
    
    //MARK: EXPANSION FUNCTIONS
    @objc func handle_popular_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in popular_majors_subarray[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = popular_majors_subarray[section].isExpanded
        popular_majors_subarray[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            popular_majors_tableview.deleteRows(at: indexPaths, with: .fade)
            sender.setImage(UIImage(named: "drop_down"), for: .normal)
        }else{
            popular_majors_tableview.insertRows(at: indexPaths, with: .fade)
            sender.setImage(UIImage(named: "drop_down")?.rotate(radians: .pi), for: .normal)
        }
        
    }
    
    @objc func handle_highest_earning_expansion(sender : UIButton){
        let section = sender.tag
        var indexPaths = [IndexPath]()
        
        //iteration
        for row in highest_earning_majors_subarray[section].category.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        //selection
        let isExpanded = highest_earning_majors_subarray[section].isExpanded
        highest_earning_majors_subarray[section].isExpanded = !isExpanded
        
        //ternary operator --> fancy way of if else statement in swift it is single ?
//        sender.setTitle(isExpanded ? "Up" : "Down", for: .normal)
        
        if isExpanded{
            highest_earning_majors_tableview.deleteRows(at: indexPaths, with: .fade)
            sender.setImage(UIImage(named: "drop_down"), for: .normal)
        }else{
            highest_earning_majors_tableview.insertRows(at: indexPaths, with: .fade)
            sender.setImage(UIImage(named: "drop_down")?.rotate(radians: .pi), for: .normal)
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
    var category : [String]//stores the credentials, awards, and salary of each major
}
