//
//  CollegeStyling.swift
//  test101
//
//  Created by Jonathan Chi on 7/31/21.
//

import Foundation
import UIKit

extension Style {
    static var myApp: Style {
        return Style(
            backgroundColor: .black,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.myAppAttributes }
        )
    }
}

private extension Style.TextStyle {
    var myAppAttributes: Style.TextAttributes {
        switch self {
        case .title:
            return Style.TextAttributes(font: .myAppTitle, color: .black)
        case .lightTitle:
            return Style.TextAttributes(font: .myAppTitle, color: .white)
        case .subtitle:
            return Style.TextAttributes(font: .myAppSubtitle, color: .black)
        case .lightSubtitle:
            return Style.TextAttributes(font: .myAppSubSubtitle, color: .white)
        case .subsubtitle:
            return Style.TextAttributes(font: .myAppSubSubtitle, color: .black)
        case .lightSubsubtitle:
            return Style.TextAttributes(font: .myAppSubSubtitle, color: .white)
        case .information:
            return Style.TextAttributes(font: .myAppInformation, color: .black)
        }
    }
}


//Family: Open Sans Font names: ["OpenSans-Regular", "OpenSansRoman-Light", "OpenSansRoman-SemiBold", "OpenSansRoman-Bold", "OpenSansRoman-ExtraBold", "OpenSansRoman-CondensedRegular", "OpenSansRoman-CondensedLight", "OpenSansRoman-CondensedSemiBold", "OpenSa
extension UIFont {
    static var myAppTitle: UIFont {
        return UIFont(name: "Georgia-Bold", size: 28)!
    }
    static var myAppSubtitle: UIFont {
        return UIFont(name: "Georgia", size: 20)!
    }
    
    static var myAppSubSubtitle: UIFont {
        return UIFont(name: "Georgia", size: 14)!
    }
    
    static var myAppInformation: UIFont {
        return UIFont(name: "Georgia", size: 12)!
    }
}

