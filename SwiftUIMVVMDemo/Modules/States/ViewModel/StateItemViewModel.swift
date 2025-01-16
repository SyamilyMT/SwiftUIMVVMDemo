//
//  StateItemViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 12/01/25.
//

import Foundation

class StateItemViewModel: ObservableObject, Identifiable {
    private var stateModel: StateModel
    
    init(stateModel: StateModel) {
        self.stateModel = stateModel
    }
    
    var name: String {
        return stateModel.name
    }
    
    var isExpanded: Bool = false
    
    var citiesViewModel: [CityItemViewModel] {
        return stateModel.cities.map({CityItemViewModel(cityModel: $0)})
    }

}
