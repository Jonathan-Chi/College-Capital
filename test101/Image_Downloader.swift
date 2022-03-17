
//
//  Image_Downloader.swift
//  test101
//
//  Created by Jonathan Chi on 7/25/21.
//

import Foundation
import UIKit

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

extension UIView{
    
}
