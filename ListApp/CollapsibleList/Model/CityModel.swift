//
//  CityModel.swift
//  ListApp
//
//  Created by apple on 27/01/25.
//

import SwiftUI

struct City: Identifiable, Codable {
    let id = UUID()
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let adminName: String
    let capital: String
    let population: String
    let populationProper: String

    enum CodingKeys: String, CodingKey {
        case city, lat, lng, country, iso2, adminName = "admin_name", capital, population, populationProper = "population_proper"
    }
}
