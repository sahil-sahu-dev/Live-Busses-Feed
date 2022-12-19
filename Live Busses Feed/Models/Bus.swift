//
//  Bus.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation

struct Bus: Codable {
    let ac: String
    let agency: String
    let id: String
    let lat, lng: Double
    let location: Location
    let orientation, route: String
    let timestamp: Double
}



struct Location: Codable {
    let reqlType: String
    let coordinates: [Double]
    let type: String

    enum CodingKeys: String, CodingKey {
        case reqlType = "$reql_type$"
        case coordinates, type
    }
}
