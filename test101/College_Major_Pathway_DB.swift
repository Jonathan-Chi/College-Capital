//
//  College_Major_Pathway.swift
//  test101
//
//  Created by Jonathan Chi on 3/26/22.
//

import Foundation
import UIKit


public struct College_Pathway : Codable {
    //initialize the let declration properties when we declare the instance
    let major : String
    let brief_description : String
    let total_degrees : String
    let percent_degrees : String
    let high_school_courses : [String]
    let jobs : [String]
}

