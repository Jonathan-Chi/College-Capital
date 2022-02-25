import Foundation
import UIKit
import Charts
 
class College_Detailed_VC : UIViewController{
    
    var received_string : String?
    var received_image_string : String?
    
    var College_Data : College?
    
    var popular_majors: [[String: String?]?]?
    var highest_earning_majors: [[String: String?]?]?
    
    
    var popular_majors_data_array = [//for the popular majors table, import dictionary from json file
    
        ExpandableArray(isExpanded: false, category: ["econ", "41", "127410"]),
        ExpandableArray(isExpanded: false, category: ["cs", "12", "41981"]),
        ExpandableArray(isExpanded: false, category: ["biology", "98", "89120"]),
        ExpandableArray(isExpanded: false, category: ["econ", "41", "127410"]),
        ExpandableArray(isExpanded: false, category: ["cs", "12", "41981"]),
        ExpandableArray(isExpanded: false, category: ["biology", "98", "89120"]),
        ExpandableArray(isExpanded: false, category: ["econ", "41", "127410"]),
        ExpandableArray(isExpanded: false, category: ["cs", "12", "41981"]),
        ExpandableArray(isExpanded: false, category: ["biology", "98", "89120"]),
        
    ]
    
    var highest_earning_majors_data_array = [
    
        ExpandableArray(isExpanded: false, category: ["a", "b", "c"]),
        ExpandableArray(isExpanded: false, category: ["d", "e", "f"]),
        ExpandableArray(isExpanded: false, category: ["g", "h", "i"])
    ]
    
    lazy var dismiss_button : UIButton = {
            let bt = UIButton()
            let image = UIImage(named: "back")
            bt.setImage(image, for: .normal)
            bt.translatesAutoresizingMaskIntoConstraints = false
            return bt
        }()

        @objc func dismiss_detailed_view (){
            dismiss(animated: true, completion: nil)
        }

        lazy var college_info_title : UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "College Information"

            label.textColor = .white
            label.font = Style.myApp.font(for: .subtitle)
            return label
        }()
    
//    func matches(for regex: String, in text: String) -> [String] {
//
//        do {
//            let regex = try NSRegularExpression(pattern: regex)
//            let results = regex.matches(in: text,
//                                        range: NSRange(text.startIndex..., in: text))
//            return results.map {
//                String(text[Range($0.range, in: text)!])
//            }
//        } catch let error {
//            print("invalid regex: \(error.localizedDescription)")
//            return []
//        }
//    }
    
    
    //MARK: BASE VIEW 1 LABELS
    lazy var Base_View_1 : UIView = {
        let iv = UIView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    lazy var college_logo : UIImageView = {
        let domain = (College_Data?.domain)!
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .darkGray
        iv.layer.cornerRadius = 15
        iv.downloaded(from: "https://logo.clearbit.com/\(domain)", contentMode: .scaleToFill)
        iv.clipsToBounds = true
        
        return iv
    }()
    
    lazy var college_name : UITextView = {
       let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = (College_Data?.college_name)!
        label.isUserInteractionEnabled = false

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var undergraduate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var undergrad_size = College_Data?.undergrad_size {
            label.text = String(undergrad_size) + " undergraduates"
        } else {
            label.text = "No Undergraduate Data"
        }

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
   
    lazy var location_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var city = College_Data?.city {
            label.text = city + ", " + (College_Data?.state)!
        } else {
            label.text = "No Location Data"
        }

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var domain_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var domain = College_Data?.domain {
            domain = domain.lowercased()
//            let matched = matches(for: ".+\\.(com|edu).*", in: domain)
            label.text = domain
        } else {
            label.text = "No Website Found"
        }

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    
    
    lazy var setting_label : UILabel = {
        var setting: Locale
        if let locale = College_Data?.locale {
            switch locale {
            case 11...13:
                setting = .City
            case 21...23:
                setting = .Suburb
            case 31...33:
                setting = .Town
            case 41...43:
                setting = .Rural
            default:
                setting = .None
            }
        } else {
            setting = .None
        }
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = setting.rawValue

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var funded_label : UILabel = {
        var funding: Ownership
        if let ownership = College_Data?.ownership {
            switch ownership {
            case 1:
                funding = .Public
            case 2:
                funding = .PrivateNonprofit
            case 3:
                funding = .PrivateProfit
            default:
                funding = .None
            }
        } else {
            funding = .None
        }
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = funding.rawValue
        label.numberOfLines = 0
        label.textAlignment = .center

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var size_label : UILabel = {
        var size: Size
        if let sz = College_Data?.carnegie_size_setting {
            switch sz {
            case 1, (6...8):
                size = .verySmall
            case 2, (9...11):
                size = .small
            case 3, (12...14):
                size = .medium
            case 4, (15...17):
                size = .large
            case 5:
                size = .veryLarge
            case 18:
                size = .gradOnly
            default:
                size = .None
            }
        } else {
            size = .None
        }
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = size.rawValue

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    //MARK: BASE VIEW 1
    
    func setup_Base_View_1 (){
        view.addSubview(dismiss_button)
        dismiss_button.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        dismiss_button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        dismiss_button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.07).isActive = true
        dismiss_button.heightAnchor.constraint(equalTo: dismiss_button.widthAnchor).isActive = true
        dismiss_button.addTarget(self, action: #selector(dismiss_detailed_view), for: .touchUpInside)

        view.addSubview(college_info_title)
        college_info_title.centerYAnchor.constraint(equalTo: dismiss_button.centerYAnchor).isActive = true
        college_info_title.leadingAnchor.constraint(equalTo: dismiss_button.trailingAnchor, constant: 30).isActive = true



        view.addSubview(scroll_view)
        
//        college_name.setNeedsLayout()
//        college_name.layoutIfNeeded()
        
        scroll_view.addSubview(Base_View_1)
        Base_View_1.topAnchor.constraint(equalTo: scroll_view.topAnchor, constant: 5).isActive = true
//        Base_View_1.leadingAnchor.constraint(equalTo: scroll_view.leadingAnchor, constant: 10).isActive = true
        Base_View_1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Base_View_1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        
        Base_View_1.addSubview(college_name)
        college_name.topAnchor.constraint(equalTo: Base_View_1.topAnchor, constant:20).isActive = true
        college_name.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 20).isActive = true
        college_name.heightAnchor.constraint(equalToConstant: 60).isActive = true
        college_name.widthAnchor.constraint(equalTo: college_name.heightAnchor, multiplier: 4).isActive = true
        

        Base_View_1.addSubview(college_logo)
//        college_logo.centerYAnchor.constraint(equalTo: Base_View_1.centerYAnchor).isActive = true
        college_logo.topAnchor.constraint(equalTo: college_name.bottomAnchor, constant: 0).isActive = true
        college_logo.trailingAnchor.constraint(equalTo:Base_View_1.trailingAnchor, constant: -5).isActive = true
        college_logo.heightAnchor.constraint(equalTo:Base_View_1.widthAnchor, multiplier: 0.40).isActive = true
        college_logo.widthAnchor.constraint(equalTo: college_logo.heightAnchor, multiplier: 1).isActive = true
        
        Base_View_1.addSubview(undergraduate_label)
        undergraduate_label.topAnchor.constraint(equalTo: college_name.bottomAnchor, constant:10).isActive = true
        undergraduate_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 45).isActive = true
        
        let undergraduates_image = UIImage(named: "undergraduates")
        let undergraduates_image_view = UIImageView(image: undergraduates_image!)
        undergraduates_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(undergraduates_image_view)
        undergraduates_image_view.topAnchor.constraint(equalTo: college_name.bottomAnchor, constant:10).isActive = true
        undergraduates_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        undergraduates_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        undergraduates_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        Base_View_1.addSubview(location_label)
        location_label.topAnchor.constraint(equalTo: undergraduate_label.bottomAnchor, constant:10).isActive = true
        location_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 45).isActive = true
        
        let location_image = UIImage(named: "location")
        let location_image_view = UIImageView(image: location_image!)
        location_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(location_image_view)
        location_image_view.topAnchor.constraint(equalTo: undergraduate_label.bottomAnchor, constant:10).isActive = true
        location_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        location_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        location_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        Base_View_1.addSubview(domain_label)
        domain_label.topAnchor.constraint(equalTo: location_label.bottomAnchor, constant:10).isActive = true
        domain_label.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor,constant: 20).isActive = true
        
        let domain_image = UIImage(named: "domain")
        let domain_image_view = UIImageView(image: domain_image!)
        domain_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(domain_image_view)
        domain_image_view.topAnchor.constraint(equalTo: location_label.bottomAnchor, constant:12).isActive = true
        domain_image_view.leadingAnchor.constraint(equalTo: domain_label.trailingAnchor, constant: 5).isActive = true
        domain_image_view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        domain_image_view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        
        let setting_image = UIImage(named: "setting")
        let setting_image_view = UIImageView(image: setting_image!)
        setting_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(setting_image_view)
        setting_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        setting_image_view.leadingAnchor.constraint(equalTo: Base_View_1.leadingAnchor, constant: 20).isActive = true
        setting_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        setting_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(setting_label)
        setting_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        setting_label.centerXAnchor.constraint(equalTo: setting_image_view.centerXAnchor).isActive = true
        
        let funded_image = UIImage(named: "funded")
        let funded_image_view = UIImageView(image: funded_image!)
        funded_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(funded_image_view)
        funded_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        funded_image_view.leadingAnchor.constraint(equalTo: setting_image_view.trailingAnchor, constant: 25).isActive = true
        funded_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        funded_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(funded_label)
        funded_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        funded_label.centerXAnchor.constraint(equalTo: funded_image_view.centerXAnchor).isActive = true
        
        let size_image = UIImage(named: "size")
        let size_image_view = UIImageView(image: size_image!)
        size_image_view.translatesAutoresizingMaskIntoConstraints = false
        Base_View_1.addSubview(size_image_view)
        size_image_view.topAnchor.constraint(equalTo: domain_label.bottomAnchor, constant:28).isActive = true
        size_image_view.leadingAnchor.constraint(equalTo: funded_image_view.trailingAnchor, constant: 25).isActive = true
        size_image_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        size_image_view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        Base_View_1.addSubview(size_label)
        size_label.topAnchor.constraint(equalTo: setting_image_view.bottomAnchor, constant:0).isActive = true
        size_label.centerXAnchor.constraint(equalTo: size_image_view.centerXAnchor).isActive = true
    }
    
    //MARK: ---------------------
    
    
    
    //MARK: BASE VIEW 2 LABELS
    
    lazy var Base_View_2 : UIView = {
        let iv = UIView()
        iv.backgroundColor = UIColor(red: CGFloat((College_Data?.red)!) / 255, green: CGFloat((College_Data?.green)!) / 255, blue: CGFloat((College_Data?.blue)!) / 255, alpha: 1)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var overview_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Overview"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var acceptance_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acceptance Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var acceptance_rate_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var acc_rate = College_Data?.admission_rate {
            acc_rate *= 100
            label.text = String(acc_rate.rounded(toPlaces: 2)) + "%"
        } else {
            label.text = "No Data"
        }
        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var graduation_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Graduation Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var graduation_rate_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var grad_rate = College_Data?.graduation_rate {
            label.text = String(grad_rate) + "%"
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var retention_rate_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Retention Rate:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var retention_rate_number_label : UILabel = {
        let iv = UIView()
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var ret_rate = College_Data?.retention_rate {
            ret_rate *= 100
            label.text = String(ret_rate.rounded(toPlaces: 2)) + "%"
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    // MARK: Pie chart code
    
    let pieChartView = PieChartView()
    
    func setupChart(dataPoints: [String], values: [Double]) {
        pieChartView.frame = CGRect(x: 120, y: 25, width: 245, height: 245)
//        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntry1.y = values[i]
          dataEntries.append(dataEntry1)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries)
        pieChartDataSet.colors = ChartColorTemplates.material()
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.holeRadiusPercent = 0
        pieChartView.transparentCircleColor = UIColor.clear
        pieChartView.legend.enabled = false
      }
    
    
    //MARK: TEST SCORE LABELS
    
    lazy var sat_range_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Range:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var sat_range_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var sat_reading_25 = College_Data?.sat_reading_25 {
            let total_25 = String(sat_reading_25 + (College_Data?.sat_math_25)!)
            let total_75 = String((College_Data?.sat_reading_75)! + (College_Data?.sat_math_75)!)
            label.text = total_25 + "-" + total_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var sat_reading_writing_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Reading/Writing"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var sat_reading_writing_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var sat_reading_25 = College_Data?.sat_reading_25 {
            let sat_reading_75 = String((College_Data?.sat_reading_75)!)
            label.text = String(sat_reading_25) + "-" + sat_reading_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var sat_math_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SAT Math"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var sat_math_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var sat_math_25 = College_Data?.sat_math_25 {
            let sat_math_75 = String((College_Data?.sat_math_75)!)
            label.text = String(sat_math_25) + "-" + sat_math_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    
    lazy var act_range_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ACT Range:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var act_range_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var act_25 = College_Data?.ACT_25_Percentile {
            let act_75 = String((College_Data?.ACT_75_Percentile)!)
            label.text = String(act_25) + "-" + act_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var act_reading_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ACT Reading:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var act_reading_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var act_reading_25 = College_Data?.act_english_25 {
            let act_reading_75 = String((College_Data?.act_english_75)!)
            label.text = String(act_reading_25) + "-" + act_reading_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var act_math_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ACT Math:"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var act_math_number_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if var act_math_25 = College_Data?.act_math_25 {
            let act_math_75 = String((College_Data?.act_math_75)!)
            label.text = String(act_math_25) + "-" + act_math_75
        } else {
            label.text = "No Data"
        }

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    
    
    //MARK: SET UP BASE VIEW 2
    
    //bewteen each rate (acceptance number --> graduation rate label)there is 15 gap
    //within each rate (graduation label to graduation number) there is a 3 gap
    //between rates ---> test scores there is a 25 gap
    
    
    func setup_Base_View_2 (){
        scroll_view.addSubview(Base_View_2)
        Base_View_2.topAnchor.constraint(equalTo: Base_View_1.bottomAnchor, constant: 15).isActive = true
        Base_View_2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Base_View_2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.66).isActive = true
        
        Base_View_2.addSubview(overview_label)
        overview_label.topAnchor.constraint(equalTo: Base_View_2.topAnchor, constant: 20).isActive = true
        overview_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        //PERCENTAGE SETUP
        Base_View_2.addSubview(acceptance_rate_label)
        acceptance_rate_label.topAnchor.constraint(equalTo: overview_label.bottomAnchor, constant: 5).isActive = true
        acceptance_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(acceptance_rate_number_label)
        acceptance_rate_number_label.topAnchor.constraint(equalTo: acceptance_rate_label.bottomAnchor, constant: 3).isActive = true
        acceptance_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        Base_View_2.addSubview(graduation_rate_label)
        graduation_rate_label.topAnchor.constraint(equalTo: acceptance_rate_number_label.bottomAnchor, constant: 15).isActive = true
        graduation_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(graduation_rate_number_label)
        graduation_rate_number_label.topAnchor.constraint(equalTo: graduation_rate_label.bottomAnchor, constant: 3).isActive = true
        graduation_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        Base_View_2.addSubview(retention_rate_label)
        retention_rate_label.topAnchor.constraint(equalTo: graduation_rate_number_label.bottomAnchor, constant: 15).isActive = true
        retention_rate_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(retention_rate_number_label)
        retention_rate_number_label.topAnchor.constraint(equalTo: retention_rate_label.bottomAnchor, constant: 3).isActive = true
        retention_rate_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        // Pie chart setup
        Base_View_2.addSubview(pieChartView)
//        pieChartView.trailingAnchor.constraint(equalTo: Base_View_2.trailingAnchor, constant: -10).isActive = true
//        pieChartView.leadingAnchor.constraint(equalTo: overview_label.trailingAnchor, constant: 10).isActive = true
//        pieChartView.bottomAnchor.constraint(equalTo: act_range_label.topAnchor, constant: 5).isActive = true
        
        //SAT SETUP
        Base_View_2.addSubview(sat_range_label)
        sat_range_label.topAnchor.constraint(equalTo: retention_rate_number_label.bottomAnchor, constant: 25).isActive = true
        sat_range_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(sat_range_number_label)
        sat_range_number_label.topAnchor.constraint(equalTo: sat_range_label.bottomAnchor, constant: 3).isActive = true
        sat_range_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        Base_View_2.addSubview(sat_reading_writing_label)
        sat_reading_writing_label.topAnchor.constraint(equalTo: sat_range_number_label.bottomAnchor, constant: 15).isActive = true
        sat_reading_writing_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(sat_reading_writing_number_label)
        sat_reading_writing_number_label.topAnchor.constraint(equalTo: sat_reading_writing_label.bottomAnchor, constant: 3).isActive = true
        sat_reading_writing_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        Base_View_2.addSubview(sat_math_label)
        sat_math_label.topAnchor.constraint(equalTo: sat_reading_writing_number_label.bottomAnchor, constant: 15).isActive = true
        sat_math_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        Base_View_2.addSubview(sat_math_number_label)
        sat_math_number_label.topAnchor.constraint(equalTo: sat_math_label.bottomAnchor, constant: 3).isActive = true
        sat_math_number_label.leadingAnchor.constraint(equalTo: Base_View_2.leadingAnchor, constant: 20).isActive = true
        
        
        //ACT SETUP
        Base_View_2.addSubview(act_range_label)
        act_range_label.topAnchor.constraint(equalTo: retention_rate_number_label.bottomAnchor, constant: 25).isActive = true
        act_range_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
        Base_View_2.addSubview(act_range_number_label)
        act_range_number_label.topAnchor.constraint(equalTo: act_range_label.bottomAnchor, constant: 3).isActive = true
        act_range_number_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
        
        Base_View_2.addSubview(act_reading_label)
        act_reading_label.topAnchor.constraint(equalTo: act_range_number_label.bottomAnchor, constant: 15).isActive = true
        act_reading_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
        Base_View_2.addSubview(act_reading_number_label)
        act_reading_number_label.topAnchor.constraint(equalTo: act_reading_label.bottomAnchor, constant: 3).isActive = true
        act_reading_number_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
        
        Base_View_2.addSubview(act_math_label)
        act_math_label.topAnchor.constraint(equalTo: act_reading_number_label.bottomAnchor, constant: 15).isActive = true
        act_math_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
        Base_View_2.addSubview(act_math_number_label)
        act_math_number_label.topAnchor.constraint(equalTo: act_math_label.bottomAnchor, constant: 3).isActive = true
        act_math_number_label.leadingAnchor.constraint(equalTo: Base_View_2.centerXAnchor, constant: 35).isActive = true
    }
    
    
    
    //MARK: --------------------------
    
    
    
    //MARK: BASE VIEW 3 LABELS
    
    lazy var Base_View_3 : UIView = {
        let iv = UIView()
        iv.backgroundColor = UIColor(red: CGFloat((College_Data?.red)!) / 255, green: CGFloat((College_Data?.green)!) / 255, blue: CGFloat((College_Data?.blue)!) / 255, alpha: 1)
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var majors_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Majors"

        label.textColor = Style.myApp.color(for: .title)
        label.font = Style.myApp.font(for: .title)
        return label
    }()
    
    lazy var popular_majors_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Majors"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var major_label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Major"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var graduates_label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Graduates"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    
    lazy var popular_majors_tableview : UITableView = {
       let tb = UITableView()
        tb.register(college_detailed_tableview_cell.self, forCellReuseIdentifier: "popular_majors")
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.layer.cornerRadius = 6
        return tb
    }()
    
    lazy var highest_earning_majors_label : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Highest Earning Majors"

        label.textColor = Style.myApp.color(for: .subtitle)
        label.font = Style.myApp.font(for: .subtitle)
        return label
    }()
    
    lazy var he_major_label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Major"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var he_graduates_label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Graduates"

        label.textColor = Style.myApp.color(for: .subsubtitle)
        label.font = Style.myApp.font(for: .subsubtitle)
        return label
    }()
    
    lazy var highest_earning_majors_tableview : UITableView = {
       let tb = UITableView()
        tb.register(college_detailed_tableview_cell.self, forCellReuseIdentifier: "highest_earning_majors")
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.layer.cornerRadius = 6
        return tb
    }()
    
    //MARK: SETUP BASE VIEW 3
    
    func setup_Base_View_3 (){
        
        scroll_view.addSubview(Base_View_3)
        Base_View_3.topAnchor.constraint(equalTo: Base_View_2.bottomAnchor, constant: 15).isActive = true
        Base_View_3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        Base_View_3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Base_View_3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        
        Base_View_3.addSubview(majors_label)
        majors_label.topAnchor.constraint(equalTo: Base_View_3.topAnchor, constant: 20).isActive = true
        majors_label.leadingAnchor.constraint(equalTo: Base_View_3.leadingAnchor, constant: 20).isActive = true
        
        Base_View_3.addSubview(popular_majors_label)
        popular_majors_label.topAnchor.constraint(equalTo: majors_label.bottomAnchor, constant: 15).isActive = true
        popular_majors_label.leadingAnchor.constraint(equalTo: Base_View_3.leadingAnchor, constant: 20).isActive = true
        
        Base_View_3.addSubview(major_label)
        major_label.topAnchor.constraint(equalTo: popular_majors_label.bottomAnchor, constant: 10).isActive = true
        major_label.leadingAnchor.constraint(equalTo: Base_View_3.leadingAnchor, constant: 20).isActive = true
        
        Base_View_3.addSubview(graduates_label)
        graduates_label.topAnchor.constraint(equalTo: popular_majors_label.bottomAnchor, constant: 10).isActive = true
        graduates_label.trailingAnchor.constraint(equalTo: Base_View_3.trailingAnchor, constant: -80).isActive = true
        
        Base_View_3.addSubview(popular_majors_tableview)
        popular_majors_tableview.topAnchor.constraint(equalTo: major_label.bottomAnchor, constant: 6).isActive = true
        popular_majors_tableview.heightAnchor.constraint(equalTo: Base_View_3.heightAnchor, multiplier: 0.3).isActive = true
        popular_majors_tableview.centerXAnchor.constraint(equalTo: Base_View_3.centerXAnchor).isActive = true
        popular_majors_tableview.widthAnchor.constraint(equalTo: Base_View_3.widthAnchor, multiplier: 0.9).isActive = true
        
        
        Base_View_3.addSubview(highest_earning_majors_label)
        highest_earning_majors_label.topAnchor.constraint(equalTo: popular_majors_tableview.bottomAnchor, constant: 25).isActive = true
        highest_earning_majors_label.leadingAnchor.constraint(equalTo: Base_View_3.leadingAnchor, constant: 20).isActive = true
        
        Base_View_3.addSubview(he_major_label)
        he_major_label.topAnchor.constraint(equalTo: highest_earning_majors_label.bottomAnchor, constant: 10).isActive = true
        he_major_label.leadingAnchor.constraint(equalTo: Base_View_3.leadingAnchor, constant: 20).isActive = true
        
        Base_View_3.addSubview(he_graduates_label)
        he_graduates_label.topAnchor.constraint(equalTo: highest_earning_majors_label.bottomAnchor, constant: 10).isActive = true
        he_graduates_label.trailingAnchor.constraint(equalTo: Base_View_3.trailingAnchor, constant: -80).isActive = true
        
        Base_View_3.addSubview(highest_earning_majors_tableview)
        highest_earning_majors_tableview.topAnchor.constraint(equalTo: he_major_label.bottomAnchor, constant: 6).isActive = true
        highest_earning_majors_tableview.heightAnchor.constraint(equalTo: Base_View_3.heightAnchor, multiplier: 0.3).isActive = true
        highest_earning_majors_tableview.centerXAnchor.constraint(equalTo: Base_View_3.centerXAnchor).isActive = true
        highest_earning_majors_tableview.widthAnchor.constraint(equalTo: Base_View_3.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    
    
    
    
    
    
    //MARK: SCROLL VIEW
    lazy var scroll_view : UIScrollView = {
       let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = true // dismiss the indicator by assigning false
        sc.bounces = true
        sc.translatesAutoresizingMaskIntoConstraints = false
        // sc.frame = view.frame//this is all good, no need for auto layout
        sc.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1500)
        return sc
    }()
    
   
    
    private func setup_UI() {
        view.addSubview(scroll_view) // we will add everything on the scroll_view instead of view
        scroll_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        scroll_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
        scroll_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scroll_view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        set_arrays()
        setup_UI()
        setup_Base_View_1()
        setup_Base_View_2()
        var values = [(College_Data?.white)!, (College_Data?.black)!, (College_Data?.asian)!, (College_Data?.hispanic)!, (College_Data?.aian)! + (College_Data?.nhpi)!, (College_Data?.two_or_more)!, (College_Data?.non_resident_alien)!, (College_Data?.unknown)!]
        for i in 0..<values.count {
            values[i] *= 100
        }
        let labels = ["White", "Black", "Asian", "Hispanic", "Other", "Two or more", "Non-resident", "Unknown"]
        setupChart(dataPoints: labels, values: values)
        setup_Base_View_3()
    }
}




//MARK: STYLING FOR PAGE

class Style {
    enum TextStyle {
        
        case title
        case lightTitle
        case subtitle
        case subsubtitle
        case information
    }

    struct TextAttributes {
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?

        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }

    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
}
