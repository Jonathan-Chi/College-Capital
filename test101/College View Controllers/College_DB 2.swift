//
//  College_DB.swift
//  test101
//
//  Created by Jonathan Chi on 7/21/21.
//

import Foundation
import UIKit


public struct College : Codable {
    //initialize the let declration properties when we declare the instance
    let college_name : String
    let address : String
    let city : String
    let state : String
    let domain : String?
    let graduation_rate : Int?
    let tuition : Int?
    let percent_financial_aid : Int?
    let ACT_25_Percentile : Int?
    let ACT_75_Percentile : Int?
    let application_total : Int?
    let total_enrollment : Int?
    let popular_majors: [[String: String?]?]?
    let top_salaries: [[String: String?]?]?
    let admission_rate: Double?
    let retention_rate: Double?
    let undergrad_size: Int?
    let act_english_25: Int?
    let act_english_75: Int?
    let act_math_25: Int?
    let act_math_75: Int?
    let sat_reading_25: Int?
    let sat_reading_75: Int?
    let sat_math_25: Int?
    let sat_math_75: Int?
    let men: Double?
    let women: Double?
    let white: Double?
    let black: Double?
    let hispanic: Double?
    let asian: Double?
    let aian: Double?
    let nhpi: Double?
    let two_or_more: Double?
    let non_resident_alien: Double?
    let unknown: Double?
    let avg_total_cost: Int?
    let in_state_tuition: Int?
    let out_of_state_tuition: Int?
    let net_tuition_revenue: Int?
    let instructional_expenditure: Int?
    let faculty_salary: Int?
    let pell_grant_rate: Double?
    let ownership: Int?
    let price_calculator_url: String?
    let locale: Int?
    let carnegie_size_setting: Int?
    let latitude: Double?
    let longitude: Double?
    let red: Int?
    let green: Int?
    let blue: Int?
}
