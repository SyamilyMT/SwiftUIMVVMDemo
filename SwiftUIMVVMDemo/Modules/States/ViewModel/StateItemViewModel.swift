//
//  StateItemViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 12/01/25.
//

import Foundation

class StateItemViewModel: ObservableObject, Identifiable {
    private var state: StateModel
    
    init(state: StateModel) {
        self.state = state
    }
    
    var name: String {
        return state.name
    }
    
    var isExpanded: Bool = false {
        didSet {
            
        }
    }
    
    var citiesViewModel: [CityItemViewModel] {
        return state.cities.map({CityItemViewModel(city: $0)})
    }

}
