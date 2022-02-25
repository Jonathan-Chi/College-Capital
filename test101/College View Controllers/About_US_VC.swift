
//
//  College_Home.swift
//  test101
//
//  Created by Jonathan Chi on 6/26/21.
//

import UIKit
import MapKit



class About_US_VC: UIViewController{
    
    

    
    let college_title : UILabel = {
            let bt = UILabel()
            bt.translatesAutoresizingMaskIntoConstraints = false
            bt.text = "About Us"
            bt.font = Style.myApp.font(for: .title)
            if language == .ES {
                bt.text = "Las 30 mejores universidades de US"
                bt.font = UIFont(name: "Georgia", size: 17)
            } else if language == .ZH {
                bt.text = "美国新闻大学排名"
            }
            bt.textColor = .white
                    
            return bt
        }()
    
    lazy var app_logo : UIButton = {
        let bt = UIButton()
        let image = UIImage(named: "app_logo")
        bt.setImage(image, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    
    
    lazy var Base_View_1 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .systemBlue
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var Who_We_Are_Label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = return_text(en: "Who We Are", es: "Matrícula", zh: "学费")

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    //As high schoolers ourselves, we understand the stress and anxiety you are feeling. This plethora of life-changing decisions is difficult to process and you may feel like you are simply not good enough. But  remember..... no matter what colleges you apply to, what majors you choose, or what decisions you make, everyone (including us) is proud of you. Even if life doesn't meet your expectations, remember that your life is not based on your accolades, but instead your experiences along the way. If you have any problems or recommedations, please reach out us at college.capital.info@gmail.com. We are there for you! -The Developers :)

    
    public func setup_label (){
        view.addSubview(college_title)
        
        college_title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        college_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
    }
    
    public func setup_UI () {
        view.addSubview(Base_View_1)
        Base_View_1.topAnchor.constraint(equalTo: app_logo.bottomAnchor, constant: 15).isActive = true
        Base_View_1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        Base_View_1.addSubview(Who_We_Are_Label)
        Who_We_Are_Label.topAnchor.constraint(equalTo: Base_View_1.topAnchor, constant: 20).isActive = true
        Who_We_Are_Label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
    }
    
    
    
    //MARK: View Did Load
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setup_label()
        
    }
}


