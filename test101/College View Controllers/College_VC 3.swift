//
//  College_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit


class College_VC : UIViewController{
    
    var college_list = [College]() // MARK: array with all colleges
    
    //MARK: GET DATA FROM JSON FILE, 1022 colleges (degree-granting US colleges larger than 1000 students)
    
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
            print(college_list.count)
            print(college_list[10])
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
    
    
    //MARK: College Array
    let top_thirty = ["Princeton University", "Harvard University", "Columbia University", "Massachusetts Institute of Technology", "Yale University", "Stanford University", "University of Chicago", "University of Pennsylvania", "California Institute of Technology", "Johns Hopkins University", "Northwestern University", "Duke University", "Dartmouth College", "Brown University", "Vanderbilt University", "Rice University", "Washington University in St. Louis", "Cornell University", "University of Notre Dame", "University of California - Los Angeles", "Emory University", "University of California - Berkeley", "Georgetown University", "University of Michigan", "University of Southern California", "Carnegie Mellon University", "New York University", "Tufts University", "University of California - Santa Barbara", "University of Florida"]
    
    let top_thirty_indices = [493, 360, 515, 367, 114, 978, 190, 743, 36, 333, 211, 590, 482, 769, 835, 867, 466, 517, 247, 51, 153, 48, 120, 401, 86, 709, 535, 377, 54, 135]
    
    //MARK: Top 30 COLLEGES TITLE
    
    let college_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "US News: Top 30 US Universities"
        bt.font = Style.myApp.font(for: .subtitle)
        bt.textColor = .white
                
        return bt
    }()
    
    lazy var dismiss_button : UIButton = {
        let bt = UIButton()
        let image = UIImage(named: "back")
        bt.setImage(image, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    
    //MARK: DECLRATION OF THE COLLECTIONVIEW
    let college_collection_identifier = "college"
    
    
    lazy var college_collection: UICollectionView = {
       
        //declare an object of layout
        let layout = UICollectionViewFlowLayout()
        //declare the collection
        let cl = UICollectionView(frame: .zero, collectionViewLayout: layout)//.zero is the 0,0 left corner
        cl.delegate = self
        cl.dataSource = self
        
        cl.register(Customized_collection_view_cell.self, forCellWithReuseIdentifier: college_collection_identifier)
        
        return cl
        
    }()
    
    
    
    //MARK: Button Task Bar Object
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
        
        search.addTarget(self, action: #selector(bring_up_search_page(sender:)), for: .touchUpInside)
        
        
        
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
    
    
    //MARK: Setup
    public func setup_Bottom_Taskbar(){
        view.addSubview(Bottom_Taskbar_View)
        Bottom_Taskbar_View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.topAnchor.constraint(equalTo: college_collection.bottomAnchor, constant: 0).isActive = true
    }
    
    public func set_up_college_label (){
        view.addSubview(dismiss_button)
        dismiss_button.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        dismiss_button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        dismiss_button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.07).isActive = true
        dismiss_button.heightAnchor.constraint(equalTo: dismiss_button.widthAnchor).isActive = true
        dismiss_button.addTarget(self, action: #selector(bring_up_home_page), for: .touchUpInside)
        view.addSubview(college_title)
        college_title.leadingAnchor.constraint(equalTo: dismiss_button.trailingAnchor, constant: 30).isActive = true
        college_title.centerYAnchor.constraint(equalTo: dismiss_button.centerYAnchor).isActive = true
        
    }
    
    //MARK: HANDLE VIEW TRANSITIONS
      
      @objc func bring_up_home_page (){
          dismiss(animated: true, completion: nil)
      }

      @objc func bring_up_search_page (sender: UIButton){
          weak var temp = self.presentingViewController
          let nav = UINavigationController(rootViewController: College_Search())
          nav.modalPresentationStyle = .fullScreen
          dismiss(animated: true, completion: {
              temp?.present(nav, animated: true)
          })
  //        var x = College_Search()
  //        x.modalPresentationStyle = .fullScreen
  //        present(x, animated: false)
      }

      @objc func bring_up_bookmark_page (sender: UIButton){
          weak var temp = self.presentingViewController
          dismiss(animated: true, completion: {
              let bookmark = College_VC()
              bookmark.modalPresentationStyle = .fullScreen
              temp?.present(bookmark, animated: false)
          })
      }

    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.black

        get_Data(file_path: "data")
        setup_collectionview()
        setup_Bottom_Taskbar()
        set_up_college_label()
        //getData(file_path: "college_data")
        
    }
}



extension College_VC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{//extensions cannot declare variables but can declare methods
    //MARK: Set up COLLECTION VIEW
    public func setup_collectionview(){
        
        college_collection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(college_collection)
        college_collection.backgroundColor = .clear
        college_collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        college_collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        college_collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        college_collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //creates the dimensions for each cell in the UICollection View
        let item_size = CGSize(width: view.frame.width/2.3, height: view.frame.width/2.3)
        return item_size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //creates boundaries between rows
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return top_thirty.count//nubers of cells in one section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //define the content in each cell
        let cell = college_collection.dequeueReusableCell(withReuseIdentifier: college_collection_identifier, for: indexPath) as! Customized_collection_view_cell//deque is a method in queue data structure          as adds a subclass
        cell.backgroundColor = .systemBlue
        cell.c_image.image = UIImage(named: top_thirty[indexPath.row])
        
        // in order to fetch and read element from the array, first we want to use index path and then access row
        cell.c_name.text = top_thirty[indexPath.row]
        
        cell.layer.cornerRadius = 10
//        cell.c_image.clipsToBounds = true //used for rounded corner for image
        return cell
    }
    
    
    //MARK: Handle each collection view cell's actions
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let destination = College_Detailed_VC()//sets next UIView
        
        
        destination.received_string = top_thirty[indexPath.row]
        destination.received_image_string = top_thirty[indexPath.row]
        destination.College_Data = college_list[top_thirty_indices[indexPath.row]]
        destination.modalPresentationStyle = .fullScreen
        
        self.present(destination, animated: true)
    }
}



//MARK: SET UP CELLS
class Customized_collection_view_cell : UICollectionViewCell {
    //MARK: Customized Image View
    lazy var c_image : UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 15
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
