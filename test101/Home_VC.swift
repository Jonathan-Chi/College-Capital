//
//  Home_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/23/21.
//

import Foundation
import UIKit

var language: Language = .EN

class Home_VC : UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait

        }
    }
    
    var selected_button = 1
    
    lazy var app_logo : UIImageView = {
        let image = UIImage(named: "app_logo")
//        let bt = UIImageView(image: image!)
        let bt = UIImageView()
        bt.image = image
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    let EN_BT : UIButton = {
            let bt = UIButton(frame: .zero)
            bt.translatesAutoresizingMaskIntoConstraints = false
            
            bt.tag = 1
            
            let title = "EN"
            bt.setTitle(title, for: .normal)
            bt.setTitleColor(UIColor.white, for: .normal)
            bt.layer.cornerRadius=10
            
            bt.addTarget(self, action: #selector(handle_EN(sender:)), for: .touchUpInside)
            
            return bt
        }()
        
        let ES_BT : UIButton = {
            let bt = UIButton(frame: .zero)
            bt.translatesAutoresizingMaskIntoConstraints = false
            
            bt.tag = 2
            
            let title = "ES"
            bt.setTitle(title, for: .normal)
            bt.setTitleColor(UIColor.white, for: .normal)
            bt.layer.cornerRadius=10
            
            bt.addTarget(self, action: #selector(handle_ES(sender:)), for: .touchUpInside)
            
            return bt
        }()
        
        let ZH_BT : UIButton = {
            let bt = UIButton(frame: .zero)
            bt.translatesAutoresizingMaskIntoConstraints = false
            
            bt.tag = 3
            
            let title = "中"
            bt.setTitle(title, for: .normal)
            bt.setTitleColor(UIColor.white, for: .normal)
            bt.layer.cornerRadius=10
            
            bt.addTarget(self, action: #selector(handle_ZH(sender:)), for: .touchUpInside)
            
            return bt
        }()
    
    override func viewDidLoad() {
        
        let tenth = view.frame.width / 10
        
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(app_logo)
        app_logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        app_logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        app_logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        app_logo.heightAnchor.constraint(equalTo: app_logo.widthAnchor).isActive = true
        
        
        view.addSubview(ZH_BT)
        ZH_BT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        ZH_BT.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        ZH_BT.heightAnchor.constraint(equalToConstant: tenth).isActive = true
        ZH_BT.widthAnchor.constraint(equalToConstant: tenth).isActive = true
        
        view.addSubview(ES_BT)
        ES_BT.bottomAnchor.constraint(equalTo: ZH_BT.bottomAnchor).isActive = true
        ES_BT.trailingAnchor.constraint(equalTo: ZH_BT.leadingAnchor, constant: -5).isActive = true
        ES_BT.heightAnchor.constraint(equalToConstant: tenth).isActive = true
        ES_BT.widthAnchor.constraint(equalToConstant: tenth).isActive = true
        
        view.addSubview(EN_BT)
        EN_BT.bottomAnchor.constraint(equalTo: ZH_BT.bottomAnchor).isActive = true
        EN_BT.trailingAnchor.constraint(equalTo: ES_BT.leadingAnchor, constant: -5).isActive = true
        EN_BT.heightAnchor.constraint(equalToConstant: tenth).isActive = true
        EN_BT.widthAnchor.constraint(equalToConstant: tenth).isActive = true
        
        
        
    }
    
    func transition() {
        app_logo.rotate360Degrees()
        let seconds  = 1.9
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
            let temp = College_VC()
            temp.modalPresentationStyle = .fullScreen
            temp.modalTransitionStyle = .crossDissolve
            self.present(temp, animated: true, completion: nil)
        }
    }
    
    @objc func handle_EN (sender: UIButton) {
            language = .EN
            selected_button = sender.tag
            highlight_BT()
        }
        
        @objc func handle_ES (sender: UIButton) {
            language = .ES
            selected_button = sender.tag
            highlight_BT()
        }
        
        @objc func handle_ZH (sender: UIButton) {
            language = .ZH
            selected_button = sender.tag
            highlight_BT()
        }
    
    func highlight_BT() {
            if EN_BT.tag == selected_button {
                EN_BT.backgroundColor = .systemBlue
                language = .EN
            } else {
                EN_BT.backgroundColor = .clear
            }
            
            if ES_BT.tag == selected_button {
                ES_BT.backgroundColor = .systemBlue
                language = .ES
            } else {
                ES_BT.backgroundColor = .clear
            }
            
            if ZH_BT.tag == selected_button {
                ZH_BT.backgroundColor = .systemBlue
                language = .ZH
            } else {
                ZH_BT.backgroundColor = .clear
            }
            transition()
        }
    
//    @objc func presentNew (){
//        var temp = College_VC()
//        temp.modalPresentationStyle = .fullScreen
//        temp.modalTransitionStyle = .crossDissolve
//        self.present(temp, animated: true, completion: nil)
//    }
    
    
    
}

extension UIView {
    func rotate180Degrees(_ duration: CFTimeInterval = 1.2, completionDelegate: CAAnimationDelegate? = nil) {
            
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotateAnimation.fromValue = 0.0
            rotateAnimation.toValue = CGFloat(Double.pi * 1.0)
            rotateAnimation.duration = duration
            
            if let delegate: CAAnimationDelegate = completionDelegate {
                rotateAnimation.delegate = delegate
            }
            self.layer.add(rotateAnimation, forKey: nil)
        }
        func rotate360Degrees(_ duration: CFTimeInterval = 2.0, completionDelegate: CAAnimationDelegate? = nil) {
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotateAnimation.fromValue = 0.0
            rotateAnimation.toValue = CGFloat(Double.pi * 4.0)
            rotateAnimation.duration = duration
            
            if let delegate: CAAnimationDelegate = completionDelegate {
                rotateAnimation.delegate = delegate
            }
            self.layer.add(rotateAnimation, forKey: nil)
        }

}
