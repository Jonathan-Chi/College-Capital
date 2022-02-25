//
//  College_Subject_VC.swift
//  test101
//
//  Created by Jonathan Chi on 2/12/22.
//

import Foundation
import UIKit

class College_Subject : UIViewController {
    
    //    lazy var engineering_CV: UICollectionView = {
    //
    //        //declare an object of layout
    //        let layout = UICollectionViewFlowLayout()
    //        layout.scrollDirection = .horizontal
    //        //declare the collection
    //        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)//.zero is the 0,0 left corner
    //        cl.delegate = self
    //        cl.dataSource = self
    //
    //        cl.register(Customized_collection_view_cell.self, forCellWithReuseIdentifier: college_identifier)
    //        cl.showsHorizontalScrollIndicator = false
    //        return cl
    //
    //    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
    
}


//extension College_Subject : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
//
//
//    //MARK: Set up COLLECTION VIEW
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //creates the dimensions for each cell in the UICollection View
//        let item_size = CGSize(width: view.frame.width/2.5, height: view.frame.width/2.5)
//        return item_size
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        //creates boundaries between columns
//        return 25
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        //creates boundaries between rows
//        let sectionInsets = UIEdgeInsets(
//          top: 20.0,
//          left: 20.0,
//          bottom: 20.0,
//          right: 20.0)
//        return sectionInsets
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if collectionView == self.top_thirty_CV{
//            return top_thirty_indices.count//nubers of cells in one section
//        }
//
//
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        //define the content in each cell
//
//        lazy var cell = top_thirty_CV.dequeueReusableCell(withReuseIdentifier: college_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
//        lazy var temp = top_thirty_indices
//
//        if collectionView == self.business_CV{
//            cell = business_CV.dequeueReusableCell(withReuseIdentifier: college_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
//            temp = business
//        }
//        if collectionView == self.bio_CV{
//            cell = bio_CV.dequeueReusableCell(withReuseIdentifier: college_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
//            temp = bio
//        }
//        if collectionView == self.poli_science_CV{
//            cell = poli_science_CV.dequeueReusableCell(withReuseIdentifier: college_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
//            temp = poli_science
//        }
//
//
//
//
//
//        cell.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
//        cell.c_image.image = UIImage(named: college_list[temp[indexPath.row]].college_name)
//
//        // in order to fetch and read element from the array, first we want to use index path and then access row
//        cell.c_name.text = college_list[temp[indexPath.row]].college_name
//        if language == .ES {
//            cell.c_name.text = college_list[temp[indexPath.row]].college_nameES
//        } else if language == .ZH {
//            cell.c_name.text = college_list[temp[indexPath.row]].college_nameZH
//            cell.c_name.font = UIFont(name: "OpenSansRoman-Bold", size: 11)
//        }
//
//
//        cell.layer.cornerRadius = 10
//        if cell.c_name.text!.count > 30 {
//            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -40).isActive = true
//        } else {
//            cell.c_name.topAnchor.constraint(equalTo: cell.contentView.bottomAnchor,constant:-30).isActive = true
//        }
////        cell.c_image.clipsToBounds = true //used for rounded corner for image
//        return cell
//
//    }
//
//
//    //MARK: Handle each collection view cell's actions
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//
//
//        let destination = College_Detailed_VC()//sets next UIView
//
//        if collectionView == self.top_thirty_CV{
//                destination.College_Data = college_list[top_thirty_indices[indexPath.row]]
//        }
//        if collectionView == self.business_CV{
//                destination.College_Data = college_list[business[indexPath.row]]
//        }
//        if collectionView == self.bio_CV{
//                destination.College_Data = college_list[bio[indexPath.row]]
//        }
//        if collectionView == self.poli_science_CV{
//                destination.College_Data = college_list[poli_science[indexPath.row]]
//        }
//
//        destination.modalPresentationStyle = .fullScreen
//        self.present(destination, animated: true)
//
//    }
//}
//
//
//
////MARK: SET UP CELLS
//class Customized_collection_view_cell : UICollectionViewCell {
//    //MARK: Customized Image View
//    lazy var c_image : UIImageView = {
//       let iv = UIImageView()
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.layer.cornerRadius = 15
//        iv.backgroundColor = UIColor.systemGray
//        iv.clipsToBounds = true
//        iv.layer.cornerRadius  = 10
//        return iv
//    }()
//
//    //MARK: Customized UILabel
//    lazy var c_name : UILabel = {
//       let lb = UILabel()
//        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.layer.cornerRadius = 10
//        lb.textAlignment = .center
//        lb.textColor = .white
//        lb.font = UIFont(name: "OpenSansRoman-Bold", size: 9)
//        lb.backgroundColor = UIColor.black.withAlphaComponent(0.50)
//        lb.clipsToBounds = true
//        lb.numberOfLines = 0
//        lb.layer.cornerRadius = 10
//        return lb
//    }()
//
//    //MARK: Customized Format for Cell
//    override init(frame: CGRect){
//        super.init(frame: frame)
//        contentView.addSubview(c_image) //cells' content
//        contentView.addSubview(c_name)
//        //image
//        let c_image_constraint = [
//            c_image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), c_image.topAnchor.constraint(equalTo: contentView.topAnchor,constant:0), c_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0), c_image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
//        ]
//        NSLayoutConstraint.activate(c_image_constraint)
//        //name
//        let c_name_constraint = [
//            c_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10), c_name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10), c_name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
//        ]
//        NSLayoutConstraint.activate(c_name_constraint)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}
