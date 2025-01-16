//
//  CityItemViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 10/01/25.
//

import Foundation

class CityItemViewModel: ObservableObject, Identifiable {
    private var city: City
    
    init(city: City) {
        self.city = city
    }
    
    var cityName: String {
        return city.city
    }
    
    var population: String {
        return city.population
    }
    
    var latitude: String {
        return city.latitude
    }
    
    var longitude: String {
        return city.longitude
    }

}
