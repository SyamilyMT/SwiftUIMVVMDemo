//
//  CityModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 16/01/25.
//

import Foundation

struct CityModel: Codable, Identifiable, Hashable {
    var id = UUID()
    let city: String
    let country: String
    let iso2: String
    let state: String
    let capital: String
    let population: String
    let population_proper: String
    let latitude: String
    let longitude: String
    
    enum CodingKeys: String, CodingKey {
        case state = "admin_name"
        case latitude = "lat"
        case longitude = "lng"
        case city, country, iso2, capital, population, population_proper
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        latitude = try container.decode(String.self, forKey: .latitude)
        longitude = try container.decode(String.self, forKey: .longitude)
        country = try container.decode(String.self, forKey: .country)
        iso2 = try container.decode(String.self, forKey: .iso2)
        state = try container.decode(String.self, forKey: .state)
        capital = try container.decode(String.self, forKey: .capital)
        population = try container.decode(String.self, forKey: .population)
        population_proper = try container.decode(String.self, forKey: .population_proper)
    }
    
}
