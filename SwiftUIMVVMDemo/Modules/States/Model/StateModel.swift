//
//  StateModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 16/01/25.
//

import Foundation

struct StateModel: Identifiable {
    let id = UUID()
    let name: String
    let cities: [CityModel]
}
