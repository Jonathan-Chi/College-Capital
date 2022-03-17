import UIKit
 
 
class College_VC : UIViewController {
    
    
    let college_search = UINavigationController(rootViewController: College_Search())
   
    let top_thirty = College_Top_Thirty()
    let bookmark = UINavigationController(rootViewController: College_Bookmarked())
    

    
    func setup_child_vc() {
        
        // add all children viewcontrollers to the main container
        addChild(college_search)
        addChild(top_thirty)
        addChild(bookmark)
        
        
        let college_search_view = college_search.view
        college_search_view!.translatesAutoresizingMaskIntoConstraints = false

        let top_thirty_view = top_thirty.view
        top_thirty_view!.translatesAutoresizingMaskIntoConstraints = false
        
        let bookmark_view = bookmark.view
        bookmark_view!.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.view.addSubview(college_search_view!)
        self.view.addSubview(top_thirty_view!)
        self.view.addSubview(bookmark_view!)
        
        college_search_view!.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        college_search_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        college_search_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        college_search_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -90).isActive = true
        
        top_thirty_view!.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        top_thirty_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        top_thirty_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        top_thirty_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        bookmark_view!.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        bookmark_view!.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        bookmark_view!.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        bookmark_view!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        
        
        
        
        college_search.didMove(toParent: self)
        top_thirty.didMove(toParent: self)
        bookmark.didMove(toParent: self)
        
        
        // setup the initial viewcontroller to display
        college_search.view.isHidden = true
        
        top_thirty.view.isHidden = false
        bookmark.view.isHidden = true
    }
    
    
    //MARK: SETUP TASKBAR
    
    
    
    lazy var Bottom_Taskbar_View : UIView = {
        let iv = UIView()
        
        //MARK: handle search
        let search = UIButton()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 10
        iv.addSubview(search)
        search.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        search.leadingAnchor.constraint(equalTo: iv.leadingAnchor, constant: 70).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        search.widthAnchor.constraint(equalToConstant: 50).isActive = true
        search.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        
        let searchimage = UIImage(named: "white_search")
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
        home.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        home.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true
        home.centerXAnchor.constraint(equalTo: iv.centerXAnchor, constant: 0).isActive = true
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
        
        
        //MARK: handle bookmark
        let bookmark = UIButton()
        bookmark.translatesAutoresizingMaskIntoConstraints = false
        iv.addSubview(bookmark)
        bookmark.layer.cornerRadius = 10
        bookmark.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        
        bookmark.trailingAnchor.constraint(equalTo: iv.trailingAnchor, constant: -70).isActive = true
        bookmark.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bookmark.centerYAnchor.constraint(equalTo: iv.centerYAnchor, constant: 0).isActive = true

        let bookmarkimage = UIImage(named: "white_bookmark")
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
    
    //MARK: view controller changes function
      
    @objc func bring_up_top_thirty_page(sender: UIButton){
        top_thirty.view.isHidden = false
        college_search.view.isHidden = true
        bookmark.view.isHidden = true
        
      }

      @objc func bring_up_search_page (sender: UIButton){
        top_thirty.view.isHidden = true
        college_search.view.isHidden = false
        bookmark.view.isHidden = true
      }

      @objc func bring_up_bookmark_page (sender: UIButton){
        top_thirty.view.isHidden = true
        college_search.view.isHidden = true
        bookmark.view.isHidden = false
//        self.present(College_Bookmarked(), animated: true, completion: nil)
//
        
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
    public func setup_view (){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup_child_vc()
        setup_Bottom_Taskbar()
        
        
    }
    
    
}
 
