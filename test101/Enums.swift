//
//  Enums.swift
//  test101
//
//  Created by Alex Huang on 8/17/21.
//

import Foundation


enum Ownership: String {
    case Public = "Public"
    case PrivateNonprofit = "Private\nNonprofit"
    case PrivateProfit = "Private\nProfit"
    case None = "No Data"
}

enum Locale: String {
    case City = "City"
    case Suburb = "Suburb"
    case Town = "Town"
    case Rural = "Rural"
    case None = "No Data"
}

enum Size: String {
    case verySmall = "Very Small"
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case veryLarge = "Very Large"
    case none = "Not Classified"
    case gradOnly = "Graduates Only"
    case None = "N/A"
}
