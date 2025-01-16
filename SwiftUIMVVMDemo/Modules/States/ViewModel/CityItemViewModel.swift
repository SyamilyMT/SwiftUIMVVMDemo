//
//  CityItemViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 10/01/25.
//

import Foundation

class CityItemViewModel: ObservableObject, Identifiable {
    private var cityModel: CityModel
    
    init(cityModel: CityModel) {
        self.cityModel = cityModel
    }
    
    var cityName: String {
        return cityModel.city
    }
    
    var population: String {
        return cityModel.population
    }
    
    var latitude: String {
        return cityModel.latitude
    }
    
    var longitude: String {
        return cityModel.longitude
    }

}
