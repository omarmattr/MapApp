//
//  Location.swift
//  MapApp
//
//  Created by OmarMattr on 06/10/2022.
//

import Foundation
import MapKit

struct Location : Identifiable,Equatable{

    
//    let name,cityName,description,link:String
//    let coordinates: CLLocationCoordinate2D
//    let imageNames : [String]
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
