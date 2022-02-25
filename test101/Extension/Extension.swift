//
//  Extension.swift
//  test101
//
//  Created by Jonathan Chi on 8/1/21.
//

import Foundation
import UIKit

enum table_identifier{
    case popular_majors
    case highest_earning_majors
    
    var converted : String{
        switch self{
            case .popular_majors : return "popular_major"
        case .highest_earning_majors : return "highest_earning_major"
        }
    }
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height + 1
    }
}

extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) -> Bool {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}

extension UIImageView{
    //we are able to extend properties in UIimageView class
    public func downloaded(from url : URL, contentMode mode : ContentMode){
        URLSession.shared.dataTask(with: url){
            (data, res, err) in
            guard let httpURLResponse = res as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = res?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, err == nil,
                  let image_data = UIImage(data : data)
            else {print("fails"); return}
            
            //async or await (delay stuff)
            DispatchQueue.main.async(){
                [self] in
                image = image_data
            }
        }.resume()
    }
    
    public func downloaded(from link : String, contentMode mode : ContentMode){
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: mode)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


