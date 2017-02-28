//
//  File.swift
//  mapZ
//
//  Created by Jeroen de Bie on 27/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import MapKit

class FestivalMapAnnotation : NSObject, MKAnnotation {
    
    var festival: Festival
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(festival: Festival) { //a)
        
    self.festival = festival //b)
    self.title = festival.title //c)
        
    if let latString = festival.location?.latitude,
            let longString = festival.location?.longitude { //d
            //need to remove the comma
            //e)
    let newlatString = latString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
    let newlongString = longString.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
            
            //f)
    let lat = Double(newlatString)
    let long = Double(newlongString)
            //g)
    self.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        } else {
    self.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        self.subtitle = festival.details?.en?.shortdescription
     
    super.init()
        
    }

}


    
