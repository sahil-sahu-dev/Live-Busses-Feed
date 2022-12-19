//
//  Bus.swift
//  Live Busses Feed
//
//  Created by Sahil Sahu on 19/12/22.
//

import Foundation

struct Bus: Codable {
    let ac: BusType
    let agency: BusAgency
    let id: String
    let lat, lng: Double
    let location: Location
    let orientation, route: String
    let timestamp: Double
}

enum BusType: String, Codable {
    case nac = "nac"
    case ac = "ac"
}

enum BusAgency: String, Codable {
    case dimts = "DIMTS"
    case dtc = "DTC"
}


struct Location: Codable {
    let reqlType: ReqlType
    let coordinates: [Double]
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case reqlType = "$reql_type$"
        case coordinates, type
    }
}

enum ReqlType: String, Codable {
    case geometry = "GEOMETRY"
}

enum TypeEnum: String, Codable {
    case point = "Point"
}
