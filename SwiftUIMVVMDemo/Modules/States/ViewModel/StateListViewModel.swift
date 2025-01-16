//
//  StateListViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 10/01/25.
//

import Foundation

class StateListViewModel: ObservableObject {
    
    @Published var stateItemsViewModel: [StateItemViewModel] = []
    
    func fetchData() {
        do {
            let cities: [City] = try Utility.loadJson(AppConstants.fileName)
            
            // Grouping and mapping parsed json to array of state objects
            let stateslist: [StateModel] = Dictionary(grouping: cities, by: { $0.state }).map({ state -> StateModel in
                StateModel(name: state.key, cities: state.value)}).sorted(by: {$0.name < $1.name})
            
            // Mapping array of state objects to array of StateItemViewModel to support MVVM
            stateItemsViewModel = stateslist.map({StateItemViewModel(state: $0)})
        } catch {
            print("Error while fetching and parsing Json :\(error)")
        }
    }
    
    func revereseOrderList() {
        stateItemsViewModel = stateItemsViewModel.reversed()
    }
    
}
