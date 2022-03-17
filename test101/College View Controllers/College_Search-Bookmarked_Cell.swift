//
//  College_Search-Bookmarked_Cell.swift
//  test101
//
//  Created by Jonathan Chi on 8/30/21.
//

import Foundation
import UIKit

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

    //MARK: Customized Format for Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "search_tableView_cell")
        contentView.addSubview(logo)
        contentView.addSubview(name)
        logo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        logo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        logo.widthAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 1).isActive = true

        name.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 60).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


