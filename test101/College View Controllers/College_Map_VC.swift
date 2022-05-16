//
//  College_Map_VC.swift
//  test101
//
//  Created by Jonathan Chi on 12/27/21.
//

import Foundation
import MapKit
import UIKit


class College_Map_VC : UIViewController{
    
    
    
    var mapView : MKMapView?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.black
        
        self.mapView = MKMapView()
        self.view.addSubview(self.mapView!)
        mapView?.translatesAutoresizingMaskIntoConstraints = false
        mapView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        for College in college_list{
            let college_annotation = MKPointAnnotation()
            
            college_annotation.coordinate = CLLocationCoordinate2D(latitude: (College.latitude!), longitude: (College.longitude!))
            college_annotation.title = return_text(en: (College.college_name), es: (College.college_nameES!), zh: (College.college_nameZH!))
            mapView?.addAnnotation(college_annotation)
        }
        
    
    }
    
    
    
}
