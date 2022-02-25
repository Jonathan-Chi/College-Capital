//
//  Enums.swift
//  test101
//
//  Created by Alex Huang on 8/17/21.
//

import Foundation
import UIKit


enum Ownership: String {
    case Public = "Public"
    case PublicES = "Público"
    case PublicZH = "公立"
    case PrivateNonprofit = "Private\nNonprofit"
    case PrivateES = "Privado"
    case PrivateZH = "私立"
    case PrivateProfit = "Private\nProfit"
    case None = "No Data"
    case NoneES = "Sin Datos"
    case NoneZH = "没有数据"
}

enum Locale: String {
    case City = "City"
    case CityES = "Ciudad"
    case CityZH = "城市"
    case Suburb = "Suburb"
    case SuburbES = "Suburbio"
    case SuburbZH = "市郊"
    case Town = "Town"
    case TownES = "Pueblo"
    case TownZH = "镇"
    case Rural = "Rural"
    case RuralZH = "乡村"
    case None = "No Data"
    case NoneES = "Sin Datos"
    case NoneZH = "没有数据"
}

enum Size: String {
    case verySmall = "Very Small"
    case small = "Small"
    case smallES = "Pequeño"
    case smallZH = "小"
    case medium = "Medium"
    case mediumES = "Medio"
    case mediumZH = "中等"
    case large = "Large"
    case veryLarge = "Very Large"
    case largeES = "Grande"
    case largeZH = "大"
    case gradOnly = "Graduates Only"
    case gradES = "Solo Graduados"
    case gradZH = "仅限毕业生"
    case None = "N/A"
}

enum Language: String {
    case EN = "English"
    case ES = "Español"
    case ZH = "中"
}

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
