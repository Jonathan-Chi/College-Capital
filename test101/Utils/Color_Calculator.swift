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
    static func calculate_text_color(r: Double, g: Double, b: Double) -> Self {
        var d: Self
//        let r: Double = 255
//        let b: Double = 255
//        let g: Double = 51
        
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

