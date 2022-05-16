import UIKit


public var college_list = [College]()
public var college_pathway = [College_Pathway]()

 
class College_VC : UIViewController {
    
        //MARK: GLOBAL ARRAY FOR THE 1097 COLLEGES
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
            //MARK: STORES ALL OF THE COLLEGE DATA IN A LARGE ARRAY VARIABLE
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            Swift.print()
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
        }
    }

    func get_pathway(file_path : String){
        
        guard let path = Bundle.main.path(forResource : file_path, ofType: "json") else {return}
        
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            parse_pathway(json: data)
        }
    }
    
    func parse_pathway(json: Data) {
        let decoder = JSONDecoder()
        do {
            let jsonColleges = try decoder.decode([College_Pathway].self, from: json)
            college_pathway = jsonColleges
            //MARK: STORES ALL OF THE COLLEGE PATHWAYS IN A LARGE ARRAY VARIABLE
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            Swift.print()
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
        }
    }

    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    let college_search = UINavigationController(rootViewController: College_Search_VC())
    let top_thirty = College_Home_VC()
    let bookmark = UINavigationController(rootViewController: College_Bookmarked_VC())
    let college_map = College_Map_VC()
    let about_us = About_US_VC()

    
    func setup_child_vc() {
        
        // add all children viewcontrollers to the main container
        addChild(college_search)
        addChild(top_thirty)
        addChild(bookmark)
        addChild(college_map)
        addChild(about_us)
        
        let college_search_view = college_search.view
        college_search_view!.translatesAutoresizingMaskIntoConstraints = false

        let top_thirty_view = top_thirty.view
        top_thirty_view!.translatesAutoresizingMaskIntoConstraints = false
        
        let bookmark_view = bookmark.view
        bookmark_view!.translatesAutoresizingMaskIntoConstraints = false
        
        let college_map_view = college_map.view
        college_map_view!.translatesAutoresizingMaskIntoConstraints = false
        
        let about_us_view = about_us.view
        about_us_view!.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.view.addSubview(college_search_view!)
        self.view.addSubview(top_thirty_view!)
        self.view.addSubview(bookmark_view!)
        self.view.addSubview(about_us_view!)
        self.view.addSubview(college_map_view!)
        
        
        college_search_view!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        college_search_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        college_search_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        college_search_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -90).isActive = true
        
        top_thirty_view!.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        top_thirty_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        top_thirty_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        top_thirty_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        bookmark_view!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        bookmark_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        bookmark_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        bookmark_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        college_map_view!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        college_map_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        college_map_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        college_map_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        about_us_view!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0).isActive = true
        about_us_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        about_us_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        about_us_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        
        college_search.didMove(toParent: self)
        top_thirty.didMove(toParent: self)
        bookmark.didMove(toParent: self)
        about_us.didMove(toParent: self)
        college_map.didMove(toParent: self)
        
        
        // setup the initial viewcontroller to display
        college_search.view.isHidden = true
        top_thirty.view.isHidden = false
        bookmark.view.isHidden = true
        college_map.view.isHidden = true
        about_us.view.isHidden = true
    }
    
    
    //MARK: SETUP TASKBAR
    
    lazy var map : UIButton = {
        let map = UIButton()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.layer.cornerRadius = 10
        return map
    } ()
    
    lazy var search : UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        return search
    } ()
    
    lazy var bookmark_BT : UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        return search
    } ()
    
    lazy var home : UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        search.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        return search
    } ()
    
    lazy var student : UIButton = {
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        return search
    } ()
    
    
    lazy var Bottom_Taskbar_View : UIView = {
        let iv = UIView()
        
        
        //MARK: handle map
        
        iv.addSubview(map)
        
        map.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
        map.heightAnchor.constraint(equalToConstant: 50).isActive = true
        map.widthAnchor.constraint(equalToConstant: 50).isActive = true
        map.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: -10).isActive = true
        
        let mapimage = UIImage(named: "map")
        let mapimageView = UIImageView(image: mapimage!)
        mapimageView.translatesAutoresizingMaskIntoConstraints = false
        map.addSubview(mapimageView)
        mapimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mapimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        mapimageView.centerYAnchor.constraint(equalTo: map.centerYAnchor, constant: 0).isActive = true
        mapimageView.centerXAnchor.constraint(equalTo: map.centerXAnchor, constant: 0).isActive = true
        map.addTarget(self, action: #selector(bring_up_map_page(sender:)), for: .touchUpInside)
        
        //MARK: handle search
        
        iv.addSubview(search)
        //search.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        search.trailingAnchor.constraint(equalTo: map.leadingAnchor, constant: -25).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        search.widthAnchor.constraint(equalToConstant: 50).isActive = true
        search.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: -10).isActive = true
        
        let searchimage = UIImage(named: "white_search")
        let searchimageView = UIImageView(image: searchimage!)
        searchimageView.translatesAutoresizingMaskIntoConstraints = false
        search.addSubview(searchimageView)
        searchimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        searchimageView.centerYAnchor.constraint(equalTo: search.centerYAnchor, constant: 0).isActive = true
        searchimageView.centerXAnchor.constraint(equalTo: search.centerXAnchor, constant: 0).isActive = true
        
        search.addTarget(self, action: #selector(bring_up_search_page(sender:)), for: .touchUpInside)
        
        //MARK: handle bookmark
       
        iv.addSubview(bookmark_BT)
        
        //bookmark.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        bookmark_BT.leadingAnchor.constraint(equalTo: map.trailingAnchor, constant: 25).isActive = true
        bookmark_BT.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark_BT.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark_BT.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: -10).isActive = true

        let bookmarkimage = UIImage(named: "white_bookmark")
        let bookmarkimageView = UIImageView(image: bookmarkimage!)
        bookmarkimageView.translatesAutoresizingMaskIntoConstraints = false
        bookmark_BT.addSubview(bookmarkimageView)
        bookmarkimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkimageView.centerYAnchor.constraint(equalTo: bookmark_BT.centerYAnchor, constant: 0).isActive = true
        bookmarkimageView.centerXAnchor.constraint(equalTo: bookmark_BT.centerXAnchor, constant: 0).isActive = true
        bookmark_BT.addTarget(self, action: #selector(bring_up_bookmark_page(sender:)), for: .touchUpInside)

        
        //MARK: handle home
        iv.addSubview(home)
        //home.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        home.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: -10).isActive = true
        home.trailingAnchor.constraint(equalTo: search.leadingAnchor, constant: -25).isActive = true
        home.heightAnchor.constraint(equalToConstant: 50).isActive = true
        home.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let homeimage = UIImage(named: "white_home")
        let homeimageView = UIImageView(image: homeimage!)
        homeimageView.translatesAutoresizingMaskIntoConstraints = false
        home.addSubview(homeimageView)
        homeimageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeimageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        homeimageView.centerYAnchor.constraint(equalTo: home.centerYAnchor, constant: 0).isActive = true
        homeimageView.centerXAnchor.constraint(equalTo: home.centerXAnchor, constant: 0).isActive = true
        home.addTarget(self, action: #selector(bring_up_top_thirty_page(sender:)), for: .touchUpInside)
        
        
        //MARK: handle student
        iv.addSubview(student)
        //student.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        student.leadingAnchor.constraint(equalTo: bookmark_BT.trailingAnchor, constant: 25).isActive = true
        student.heightAnchor.constraint(equalToConstant: 50).isActive = true
        student.widthAnchor.constraint(equalToConstant: 50).isActive = true
        student.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: -10).isActive = true
        
        let studentimage = UIImage(named: "graduation_cap")
        let studentimageView = UIImageView(image: studentimage!)
        studentimageView.translatesAutoresizingMaskIntoConstraints = false
        student.addSubview(studentimageView)
        studentimageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        studentimageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        studentimageView.centerYAnchor.constraint(equalTo: student.centerYAnchor, constant: 0).isActive = true
        studentimageView.centerXAnchor.constraint(equalTo: student.centerXAnchor, constant: 0).isActive = true
        student.addTarget(self, action: #selector(bring_up_student_page(sender:)), for: .touchUpInside)
        
        
        
        iv.backgroundColor = UIColor.black
        iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
    }()
    
    //MARK: view controller changes function
      
    @objc func bring_up_top_thirty_page(sender: UIButton){
        top_thirty.view.isHidden = false
        college_search.view.isHidden = true
        bookmark.view.isHidden = true
        college_map.view.isHidden = true
        about_us.view.isHidden = true
        map.backgroundColor = .clear
        student.backgroundColor = .clear
        bookmark_BT.backgroundColor = .clear
        home.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        search.backgroundColor = .clear
      }

    @objc func bring_up_search_page (sender: UIButton){
        top_thirty.view.isHidden = true
        college_search.view.isHidden = false
        bookmark.view.isHidden = true
        college_map.view.isHidden = true
        about_us.view.isHidden = true
        map.backgroundColor = .clear
        student.backgroundColor = .clear
        bookmark_BT.backgroundColor = .clear
        home.backgroundColor = .clear
        search.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
    }

    @objc func bring_up_bookmark_page (sender: UIButton){
        top_thirty.view.isHidden = true
        college_search.view.isHidden = true
        bookmark.view.isHidden = false
        college_map.view.isHidden = true
        about_us.view.isHidden = true
        map.backgroundColor = .clear
        student.backgroundColor = .clear
        bookmark_BT.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        home.backgroundColor = .clear
        search.backgroundColor = .clear
    }
    
    @objc func bring_up_student_page (sender: UIButton){
        top_thirty.view.isHidden = true
        about_us.view.isHidden = false
        college_search.view.isHidden = true
        bookmark.view.isHidden = true
        college_map.view.isHidden = true
        map.backgroundColor = .clear
        student.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        bookmark_BT.backgroundColor = .clear
        home.backgroundColor = .clear
        search.backgroundColor = .clear
    }
    
    @objc func bring_up_map_page (sender: UIButton){
        top_thirty.view.isHidden = true
        about_us.view.isHidden = true
        college_search.view.isHidden = true
        bookmark.view.isHidden = true
        college_map.view.isHidden = false
        map.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        student.backgroundColor = .clear
        bookmark_BT.backgroundColor = .clear
        home.backgroundColor = .clear
        search.backgroundColor = .clear
    }
    
    
    
    //MARK: Setup bottom taskbar
    public func setup_Bottom_Taskbar(){
        view.addSubview(Bottom_Taskbar_View)
        Bottom_Taskbar_View.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        Bottom_Taskbar_View.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
    }
    
    
    
//MARK: VIEW SETUP
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        get_Data(file_path: "data")
        get_pathway(file_path: "College Pathways")
        setup_child_vc()
        setup_Bottom_Taskbar()
        
        
        print(college_pathway)
        
    }
    
    
}
 
