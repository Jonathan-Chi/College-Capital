//
//  College_Subject_VC.swift
//  test101
//
//  Created by Jonathan Chi on 2/12/22.
//

import Foundation
import UIKit

class College_Subject_VC : UIViewController {
    
    var college_indices = [Int]()
    
    lazy var subject_title : UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        label.font = UIFont(name:"Georgia-Bold", size: 23)
        
        return label
    }()
    
    
    
    
    lazy var college_collection: UICollectionView = {
       
        //declare an object of layout
        let layout = UICollectionViewFlowLayout()
        //declare the collection
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)//.zero is the 0,0 left corner
        cl.delegate = self
        cl.dataSource = self
        
        cl.register(Customized_collection_view_cell.self, forCellWithReuseIdentifier: "college_identifier")
        
        return cl
        
    }()
    
    public func setup_subject_CV(){
        
    
        
        college_collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(college_collection)
        college_collection.backgroundColor = .black
        college_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        college_collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        college_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        college_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    public func setup_title(){
        view.addSubview(subject_title)
        subject_title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subject_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        view.backgroundColor = .black
        setup_title()
        setup_subject_CV()
        
        if subject_title.text == "Ranking Nacional de Universidades"{
            subject_title.font = UIFont(name:"Georgia-Bold", size: 18)
        }
    }
    
    
    
}




extension College_Subject_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //creates the dimensions for each cell in the UICollection View
        let item_size = CGSize(width: view.frame.width/1.1, height: view.frame.width/1.1)
        return item_size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //creates boundaries between rows
        
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //create boundaries between items
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return college_indices.count//nubers of cells in one section
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //define the content in each cell
        let cell = college_collection.dequeueReusableCell(withReuseIdentifier: "college_identifier", for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
        cell.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        cell.c_image.image = UIImage(named: college_list[college_indices[indexPath.row]].college_name)
        
        // in order to fetch and read element from the array, first we want to use index path and then access row
        cell.c_name.text = college_list[college_indices[indexPath.row]].college_name
        
        if language == .ES {
            cell.c_name.text = college_list[college_indices[indexPath.row]].college_nameES
        } else if language == .ZH {
            cell.c_name.text = college_list[college_indices[indexPath.row]].college_nameZH
            cell.c_name.font = UIFont(name: "OpenSansRoman-Bold", size: 11)
        }
        
        
        cell.layer.cornerRadius = 10
        if cell.c_name.text!.count > 30 {
            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -40).isActive = true
        } else {
            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant:-30).isActive = true
        }
        
        
        cell.c_name.text = cell.c_name.text! + " #" + String(indexPath.row+1)//indexPath starts at 0, adds the ranking
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let destination = College_Detailed_VC()//sets next UIView
        destination.College_Data = college_list[college_indices[indexPath.row]]
        
        
        destination.modalPresentationStyle = .fullScreen
        
        self.present(destination, animated: true)
        
        print(indexPath)
    }
}



//MARK: CUSTOMIZED VIEW CELL CLASS
class Customized_collection_view_cell : UICollectionViewCell {
    //MARK: Customized Image View
    lazy var c_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor.systemGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius  = 10
        return iv
    }()
    
    //MARK: Customized UILabel
    lazy var c_name : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.layer.cornerRadius = 10
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = UIFont(name: "Georgia-Bold", size: 9)
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 10
        return lb
    }()
    
    //MARK: Customized Format for Cell
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(c_image) //cells' content
        contentView.addSubview(c_name)
        //MARK: Image Format
        let c_image_constraint = [
            c_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_image.topAnchor.constraint(equalTo: contentView.topAnchor,constant:10), c_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(c_image_constraint)
        //MARK: Label Format
        let c_name_constraint = [
            c_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_name.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant:-30), c_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(c_name_constraint)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
