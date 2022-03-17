//
//  Home_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/23/21.
//

import Foundation
import UIKit

class Home_VC : UIViewController {
    

    
    // MARK: Scholarship Button
    lazy var Scholar_BT : UIButton  = {
       
        let bt = UIButton(frame: .zero)
        bt.translatesAutoresizingMaskIntoConstraints = false //have to assign false
        bt.setTitle("Scholarship Information", for: .normal)
        bt.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 20)
        bt.layer.borderWidth=4
        bt.layer.cornerRadius=10
        // yellow is #ffd800 or 255 216 0
        bt.layer.borderColor = UIColor(red: 255/255, green: 216/255, blue: 0/255, alpha: 1.0).cgColor
        bt.setTitleColor(UIColor(red: 255/255, green: 216/255, blue: 0/255, alpha: 1.0), for: .normal)
        let image = UIImage(named: "yellowScholarship.png")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //autolayer for image
        
        bt.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: bt.bottomAnchor, constant: -5).isActive = true;
        imageView.trailingAnchor.constraint(equalTo: bt.trailingAnchor, constant: -5).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: bt.heightAnchor, multiplier: 0.35).isActive = true
        imageView.widthAnchor.constraint(equalTo: bt.widthAnchor, multiplier: 0.2).isActive = true
        
        bt.addTarget(self, action: #selector(handle_scholarship_VC_transformation(sender:)), for: .touchUpInside)//calls function below to switch new view
        
        return bt
    

    }()
    
    
    
    // MARK: College Button
    lazy var College_BT : UIButton = {
        let bt = UIButton(frame: .zero)
        bt.translatesAutoresizingMaskIntoConstraints = false //have to assign false
        
        let title1 = "College Information"
        bt.setTitle("College Information", for: .normal)
        bt.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 20)
        bt.layer.borderWidth=4
        bt.layer.cornerRadius=10
        bt.layer.borderColor = UIColor.systemBlue.cgColor
        bt.setTitleColor(UIColor.systemBlue, for: .normal)
        
        //image
        let image = UIImage(named: "blueSchool")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        bt.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: bt.bottomAnchor, constant: -5).isActive = true;
        imageView.trailingAnchor.constraint(equalTo: bt.trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalTo: bt.heightAnchor, multiplier: 0.35).isActive = true
        imageView.widthAnchor.constraint(equalTo: bt.widthAnchor, multiplier: 0.2).isActive = true
        
        bt.addTarget(self, action: #selector(handle_College_Top_Thirty_transfromation(sender:)), for: .touchUpInside)
        
        
        return bt
    }()
    
    
    
    
    
    //MARK: setup auto layout
    func setup_auto_layout (){
        view.addSubview(College_BT)
        
        let half_height = view.frame.height/4
        print(half_height)
        
        College_BT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -half_height).isActive = true
        College_BT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true//trailing is the right side    leading is left side
        College_BT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        College_BT.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
        
        
        view.addSubview(Scholar_BT)
        Scholar_BT.topAnchor.constraint(equalTo: view.topAnchor, constant: half_height).isActive = true
        Scholar_BT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true//trailing is the right side    leading is left side
        Scholar_BT.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        Scholar_BT.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setup_auto_layout()
        
            }
    
}


//MARK: extension
extension Home_VC {
    //let us create a objective c method to handle the view transformation
    
    @objc func handle_scholarship_VC_transformation (sender : UIButton){
        //let us create an instance (object_) or scholarship_vc
        let scholar = Scholarship_VC()
        //let us reate a present method to transport the current view to scholarship_vc
        self.present(scholar, animated: true, completion: nil)
        //first arguement defines the destination view
        //completion is a lamda expression in java, and it is similar to block in C++
        
    }
    
    @objc func handle_College_Top_Thirty_transfromation (sender: UIButton){

        let college = College_VC()
        //self targets Home_VC
        
        
        
        college.modalPresentationStyle = .fullScreen
        self.present(college, animated: true)
    }
        
}
