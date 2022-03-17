//
//  Color_Calculator.swift
//  test101
//
//  Created by Alex Huang on 8/21/21.
//

import Foundation
import UIKit

enum colorDetect {
    case bright, dark
    var converted: UIColor {
        switch self {
        case .bright:
            return .white
        case .dark:
            return .black
        }
    }
    func calculate_text_color() -> Self {
        var d: Self
//        let r = CGFloat((College_Data?.red)!) / 255
//        let g = CGFloat((College_Data?.green)!) / 255
//        let b = CGFloat((College_Data?.blue)!) / 255
        let r: Double = 255
        let b: Double = 255
        let g: Double = 51
        
        let rc = 0.299 * r
        let gc = 0.587 * g
        let bc = 0.114 * b
        
        // Counting the perceptive luminance - human eye favors green color...
        let luminance = (rc + gc + bc) / 255;

        if luminance > 0.5 {
            d = .dark
        } else {
            d = .bright
        }
        return d
    }
}
