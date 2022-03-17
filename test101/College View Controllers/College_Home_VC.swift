
//
//  College_Home.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit
import MapKit



class College_Home : UIViewController{
    
    
    //MARK: INDICES
    
    let top_thirty_indices = [493, 360, 515, 367, 114, 978, 190, 743, 36, 333, 211, 590, 482, 769, 835, 867, 466, 517, 247, 51, 153, 48, 120, 401, 709, 931, 86, 535, 377, 54]
    let business = [743, 367, 48, 401, 535, 881, 709, 517, 241, 608]
    let bio = [360, 367, 978, 48, 53, 333, 517, 947, 51, 401]
    let poli_science = [978, 360, 493, 48, 401, 114, 367, 515, 53, 590]
    let engineering = [367, 978, 48, 36, 155, 709, 197, 401, 517, 979]
    let psych =  [978, 48, 360, 51, 401, 114, 197, 367, 493, 419]
    let comp_science = [709, 367, 978, 48, 517, 155, 197, 36, 493, 51]
    let nursing = [743, 590, 947, 153, 401, 608, 535, 749, 634, 661]
    
    
    //MARK: Title UI
    let college_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "College Capital"
        bt.font = UIFont(name: "OpenSansRoman-SemiBold", size: 23)
        bt.textColor = .white
        return bt
    }()
    
    lazy var scroll_view : UIScrollView = {
        let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true // dismiss the indicator by assigning false
        sc.showsHorizontalScrollIndicator = false
        sc.bounces = true
        sc.translatesAutoresizingMaskIntoConstraints = false
        // sc.frame = view.frame//this is all good, no need for auto layout
        sc.backgroundColor = .black
        
        return sc
    }()
    
    lazy var scroll_content_view : UIView = {
       let v = UIView()
        v.backgroundColor = .black
        return v
    }()
    
    
    
    
    //MARK: Collection Views
    let college_identifier = "college"
    
    
    //MARK: TOP THIRTY
    lazy var top_thirty_CV: UIButton = {
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
    }()
    
    lazy var top_thirty_image : UIImageView = {
        let image = UIImage(named: "top_thirty")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var top_thirty_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "National University Rankings"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    lazy var top_thirty_description : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Displays the Top 30 US News Ranked Undergradaute Programs"
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "Muestra los 30 mejores programas de pregrado clasificados por US News"
            
        } else if language == .ZH {
            bt.text = "显示美国新闻排名前 30 的本科课程"
        }
        bt.textColor = .white
        return bt
    }()
    //dumb
    
    
    
    lazy var top_thirty_rank_weighting : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Ranking are calculated by multiple measures of graduation and retention, social mobility, faculty resources, expert opinion, financial resources, student selectivity, and undergraduate reputation."
        bt.numberOfLines = 0
        bt.font = Style.myApp.font(for: .subsubtitle)
    
        if language == .ES {
            bt.text = "La clasificación se calcula mediante múltiples medidas de graduación y retención, movilidad social, recursos de la facultad, opinión de expertos, recursos financieros, selectividad de los estudiantes y reputación de los estudiantes."
            
        } else if language == .ZH {
            bt.text = "排名由毕业和保留、社会流动性、教师资源、专家意见、财政资源、学生选择性和本科声誉等多项指标计算得出"
        }
        bt.textColor = .white
        return bt
    }()
    
    
    //MARK: BUSINESS
    lazy var business_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var business_image : UIImageView = {
        let image = UIImage(named: "business")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var business_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Business Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    //MARK: BIOLOGY
    lazy var bio_CV: UIButton = {

        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
        

    }()
    
    lazy var bio_image : UIImageView = {
        let image = UIImage(named: "bio")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var bio_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Biology Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()

    //MARK: POLI SCIENCE
    lazy var poli_science_CV: UIButton = {

        //declare an object of layout
        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv
    }()

    lazy var poli_science_image : UIImageView = {
        let image = UIImage(named: "poli_science")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var poli_science_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Political Science Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    //MARK: ENGINEERING
    lazy var engineering_CV: UIButton = {

        let iv = UIButton()
        iv.backgroundColor = UIColor(red: 2/255, green: 81/255, blue: 173/255, alpha: 1.0)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.addTarget(self, action: #selector(present_College_Subject_VC), for: .touchUpInside)
        return iv

    }()
    
    lazy var engineering_image : UIImageView = {
        let image = UIImage(named: "engineering")
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var engineering_title : UILabel = {
        let bt = UILabel()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.text = "Engineering Pathway"
        bt.font = UIFont(name: "OpenSansRoman-Bold", size: 16)
    
        if language == .ES {
            bt.text = "Ranking Nacional de Universidades"
            
        } else if language == .ZH {
            bt.text = "全国大学排名"
        }
        bt.textColor = .white
        return bt
    }()
    
    //MARK: UI SETUP
    
    public func setup_UI () {
        view.backgroundColor = .black
        setup_college_label()
        
        scroll_view.translatesAutoresizingMaskIntoConstraints = false
        scroll_content_view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scroll_view)
        scroll_view.addSubview(scroll_content_view)
               
        scroll_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scroll_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scroll_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scroll_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scroll_content_view.centerXAnchor.constraint(equalTo: scroll_view.centerXAnchor).isActive = true
        scroll_content_view.widthAnchor.constraint(equalTo: scroll_view.widthAnchor).isActive = true
        scroll_content_view.topAnchor.constraint(equalTo: scroll_view.topAnchor).isActive = true
        scroll_content_view.bottomAnchor.constraint(equalTo: scroll_view.bottomAnchor).isActive = true
        

        setup_top_thirty()
        setup_business()
        setup_bio()
        setup_poli_science()
        setup_engineering()
    }
    
    public func setup_college_label (){
        view.addSubview(college_title)
        college_title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 53).isActive = true
    }
    
    //MARK: SETUP TOP THIRTY
    public func setup_top_thirty(){
        scroll_content_view.addSubview(top_thirty_CV)
        
        
        top_thirty_CV.topAnchor.constraint(equalTo: scroll_content_view.topAnchor, constant: 0).isActive = true
        top_thirty_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9/10).isActive = true
        top_thirty_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        
        
        top_thirty_CV.addSubview(top_thirty_image)
        top_thirty_image.topAnchor.constraint(equalTo: top_thirty_CV.topAnchor, constant: 10).isActive = true
        top_thirty_image.trailingAnchor.constraint(equalTo: top_thirty_CV.trailingAnchor, constant: -10).isActive = true
        top_thirty_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        top_thirty_image.heightAnchor.constraint(equalTo: top_thirty_image.widthAnchor).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_title)
        top_thirty_title.topAnchor.constraint(equalTo: top_thirty_CV.topAnchor, constant: 20).isActive = true
        top_thirty_title.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_description)
        top_thirty_description.topAnchor.constraint(equalTo: top_thirty_title.bottomAnchor, constant: 7).isActive = true
        top_thirty_description.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        top_thirty_description.trailingAnchor.constraint(equalTo: top_thirty_image.leadingAnchor, constant: -5).isActive = true
        
        top_thirty_CV.addSubview(top_thirty_rank_weighting)
        top_thirty_rank_weighting.topAnchor.constraint(equalTo: top_thirty_image.bottomAnchor, constant: 7).isActive = true
        top_thirty_rank_weighting.leadingAnchor.constraint(equalTo: top_thirty_CV.leadingAnchor, constant: 20).isActive = true
        top_thirty_rank_weighting.trailingAnchor.constraint(equalTo: top_thirty_CV.trailingAnchor, constant: -20).isActive = true
        top_thirty_CV.bottomAnchor.constraint(equalTo: top_thirty_rank_weighting.bottomAnchor, constant: 20).isActive = true
        
    }
    //MARK: SETUP BUSINESS
    public func setup_business(){
        scroll_content_view.addSubview(business_CV)
        
        business_CV.topAnchor.constraint(equalTo: top_thirty_CV.bottomAnchor, constant: 25).isActive = true
        business_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9/10).isActive = true
        business_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        business_CV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        business_CV.addSubview(business_image)
        business_image.topAnchor.constraint(equalTo: business_CV.topAnchor, constant: 10).isActive = true
        business_image.trailingAnchor.constraint(equalTo: business_CV.trailingAnchor, constant: -10).isActive = true
        business_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        business_image.heightAnchor.constraint(equalTo: business_image.widthAnchor).isActive = true
        
        business_CV.addSubview(business_title)
        business_title.topAnchor.constraint(equalTo: business_CV.topAnchor, constant: 20).isActive = true
        business_title.leadingAnchor.constraint(equalTo: business_CV.leadingAnchor, constant: 20).isActive = true

    }
    //MARK: SETUP BIO
    public func setup_bio(){
        scroll_content_view.addSubview(bio_CV)
        
        bio_CV.topAnchor.constraint(equalTo: business_CV.bottomAnchor, constant: 25).isActive = true
        bio_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9/10).isActive = true
        bio_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        bio_CV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        bio_CV.addSubview(bio_image)
        bio_image.topAnchor.constraint(equalTo: bio_CV.topAnchor, constant: 10).isActive = true
        bio_image.trailingAnchor.constraint(equalTo: bio_CV.trailingAnchor, constant: -10).isActive = true
        bio_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        bio_image.heightAnchor.constraint(equalTo: business_image.widthAnchor).isActive = true
        
        bio_CV.addSubview(bio_title)
        bio_title.topAnchor.constraint(equalTo: bio_CV.topAnchor, constant: 20).isActive = true
        bio_title.leadingAnchor.constraint(equalTo: bio_CV.leadingAnchor, constant: 20).isActive = true

    }
    //MARK: SETUP POLI SCIENCE
    public func setup_poli_science(){
        scroll_content_view.addSubview(poli_science_CV)
        
        poli_science_CV.topAnchor.constraint(equalTo: bio_CV.bottomAnchor, constant: 25).isActive = true
        poli_science_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9/10).isActive = true
        poli_science_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        poli_science_CV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        
        poli_science_CV.addSubview(poli_science_image)
        poli_science_image.topAnchor.constraint(equalTo: poli_science_CV.topAnchor, constant: 10).isActive = true
        poli_science_image.trailingAnchor.constraint(equalTo: poli_science_CV.trailingAnchor, constant: -10).isActive = true
        poli_science_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        poli_science_image.heightAnchor.constraint(equalTo: poli_science_image.widthAnchor).isActive = true
        
        poli_science_CV.addSubview(poli_science_title)
        poli_science_title.topAnchor.constraint(equalTo: poli_science_CV.topAnchor, constant: 20).isActive = true
        poli_science_title.leadingAnchor.constraint(equalTo: poli_science_CV.leadingAnchor, constant: 20).isActive = true
    }
    
    //MARK: SETUP ENGINEERING
    public func setup_engineering(){
        scroll_content_view.addSubview(engineering_CV)
        
        //MARK: THE VERY LAST ELEMENT OF A SCROLL VIEW NEEDS A SCROLL_CONTENT_VIEW.BOTTOM ANCHOR
        engineering_CV.topAnchor.constraint(equalTo: poli_science_CV.bottomAnchor, constant: 25).isActive = true
        engineering_CV.widthAnchor.constraint(equalTo: scroll_content_view.widthAnchor, multiplier: 9/10).isActive = true
        engineering_CV.centerXAnchor.constraint(equalTo: scroll_content_view.centerXAnchor).isActive = true
        engineering_CV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3).isActive = true
        engineering_CV.bottomAnchor.constraint(equalTo: scroll_content_view.bottomAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_image)
        engineering_image.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 10).isActive = true
        engineering_image.trailingAnchor.constraint(equalTo: engineering_CV.trailingAnchor, constant: -10).isActive = true
        engineering_image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5.5).isActive = true
        engineering_image.heightAnchor.constraint(equalTo: engineering_image.widthAnchor).isActive = true
        
        engineering_CV.addSubview(engineering_title)
        engineering_title.topAnchor.constraint(equalTo: engineering_CV.topAnchor, constant: 20).isActive = true
        engineering_title.leadingAnchor.constraint(equalTo: engineering_CV.leadingAnchor, constant: 20).isActive = true
    }

    //MARK: OBJC C PRESENT SUBJECT VIEW
    
    @objc func present_College_Subject_VC () {
        self.present(College_Subject(), animated: true, completion: nil)
    }
    
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        setup_UI()
    }
}




