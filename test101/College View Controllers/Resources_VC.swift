
//
//  College_Home.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit
import MapKit
import SafariServices



class Resources_VC: UIViewController{
    
   
    lazy var resource_collection: UICollectionView = {
       
        //declare an object of layout
        let layout = UICollectionViewFlowLayout()
        //declare the collection
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)//.zero is the 0,0 left corner
        cl.delegate = self
        cl.dataSource = self
        //MARK: CHANGE WHEN MADE CUSTOM
        cl.register(resource_collection_cell.self, forCellWithReuseIdentifier: "resources")
        cl.backgroundColor = .red
        return cl
        
    }()
    
    let college_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Resources"
        bt.font = Style.myApp.font(for: .title)
        if language == .ES {
            bt.text = "Recursos"
            bt.font = UIFont(name: "Georgia-Bold", size: 23)
        } else if language == .ZH {
            bt.text = "资源"
        }
        bt.textColor = .white
                    
            return bt
    }()
    
    
    public func setup_title (){
        view.addSubview(college_title)
        college_title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        
    }
    
    public func setup_UI () {
        
        view.addSubview(resource_collection)
        resource_collection.backgroundColor = .black
        resource_collection.translatesAutoresizingMaskIntoConstraints = false
        resource_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        resource_collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        resource_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        resource_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
       
    }
    
    
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setup_title()
        setup_UI()
        
    }
}


extension Resources_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //creates the dimensions for each cell in the UICollection View
        let item_size = CGSize(width: view.frame.width/1.1, height: view.frame.width/1.3)
        return item_size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //creates boundaries between rows
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //create boundaries between items
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return college_resources.count//nubers of cells in one section
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //define the content in each cell
        let cell = resource_collection.dequeueReusableCell(withReuseIdentifier: "resources", for: indexPath) as! resource_collection_cell //deque is a method in queue data structure          as adds a subclass
        cell.backgroundColor = .black
        cell.c_image.downloaded(from: college_resources[indexPath.row].Image, contentMode: .scaleAspectFit)
        cell.c_name.text = college_resources[indexPath.row].Title
        cell.c_description.text = college_resources[indexPath.row].Description
        if language == .ES {
            cell.c_description.text = college_resources[indexPath.row].Spanish
            
        } else if language == .ZH {
            cell.c_description.text = college_resources[indexPath.row].Chinese
        }
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        var url = URL(string: college_resources[indexPath.row].Link)
        
        let vc = SFSafariViewController(url: url!)
        self.present(vc, animated: true, completion: nil)
        

    }
}

//MARK: Resource VIEW CELL CLASS
class resource_collection_cell : UICollectionViewCell {
    
    lazy var c_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor.systemGray
        iv.clipsToBounds = true
        iv.layer.cornerRadius  = 10
        return iv
    }()

    
    lazy var c_name : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        lb.textAlignment = .center
        lb.textColor = .white
        lb.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
        lb.numberOfLines = 0
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 10
        
        return lb
    }()
    
    lazy var c_description : UILabel = {
       let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        
        lb.textAlignment = .left
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.font = Style.myApp.font(for: .subsubtitle)
        
        lb.clipsToBounds = true
        lb.layer.cornerRadius = 10
        return lb
    }()
    

    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(c_image) //cells' content
        contentView.addSubview(c_name)
        contentView.addSubview(c_description)
        
        
        
        c_image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        c_image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        c_image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        
        c_name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        c_name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        c_description.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:20).isActive = true
        c_description.topAnchor.constraint(equalTo: c_name.bottomAnchor, constant: 7).isActive = true
        c_description.trailingAnchor.constraint(equalTo: c_image.leadingAnchor, constant: -10).isActive = true
        
        c_image.topAnchor.constraint(equalTo: c_description.topAnchor, constant: 0).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
