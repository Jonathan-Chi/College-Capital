//
//  ViewController.swift
//  test101
//
//  Created by Jonathan Chi on 6/23/21.
//

import UIKit
 
class ViewController: UIViewController {
 
    // creating a button to change the back color
    let logo_label : UIButton = {
       let bt = UIButton()
        bt.frame = CGRect(x: 150, y: 300, width: 100, height: 50)
        bt.backgroundColor = UIColor.red
        bt.setTitle("Supreme", for: UIControl.State.normal)
        bt.titleLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        bt.layer.cornerRadius = 15
        
        bt.addTarget(self, action: #selector(handle_button_action(sender:)), for: .touchUpInside)
        return bt
    }()
    
    // input box by using UItextView
    
    lazy var user_age_input : UITextView = {
       let tx = UITextView()
        tx.layer.cornerRadius = 15
        tx.frame = CGRect(x: 150, y: 100, width: 100, height: 50)
        tx.backgroundColor = .white
        tx.layer.borderWidth = 2
        tx.layer.borderColor = UIColor.systemBlue.cgColor
        return tx
    }()
    
    // suppose we want to assign a certain action (functionality) to the supreme button
    // condition: if the title text is Supreme, then we change the background color of the button to green
    
    @objc func handle_button_action(sender : UIButton) {
        
        print(user_age_input.text)
        
        if user_age_input.text == "17" {
            sender.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        }
        
        if sender.titleLabel?.text == "Supreme" {
            sender.setTitle("Gucci", for: UIControl.State.normal)
            sender.backgroundColor = UIColor.green
            view.backgroundColor = UIColor.black
        } else {
            sender.setTitle("Supreme", for: UIControl.State.normal)
            sender.backgroundColor = UIColor.red
            view.backgroundColor = UIColor.gray
        }
    }
 
    func setup_element() {
        view.addSubview(logo_label)
        view.addSubview(user_age_input)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup_element()
        // Do any additional setup after loading the view.
    }
    
 
 
}

