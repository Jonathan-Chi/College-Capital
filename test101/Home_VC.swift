//
//  Home_VC.swift
//  test101
//
//  Created by Jonathan Chi on 6/23/21.
//

import Foundation
import UIKit

class Home_VC : UIViewController {
    
    
    lazy var app_logo : UIButton = {
        let image = UIImage(named: "app_logo")
//        let bt = UIImageView(image: image!)
        let bt = UIButton()
        bt.setImage(image, for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(app_logo)
        app_logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        app_logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        app_logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        app_logo.heightAnchor.constraint(equalTo: app_logo.widthAnchor).isActive = true
        app_logo.rotate360Degrees()
        
        let seconds  = 1.9
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){
            var temp = College_VC()
            temp.modalPresentationStyle = .fullScreen
            temp.modalTransitionStyle = .crossDissolve
            self.present(temp, animated: true, completion: nil)
        }
        
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
