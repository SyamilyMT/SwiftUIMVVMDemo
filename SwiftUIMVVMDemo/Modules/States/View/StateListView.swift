//
//  StateListView.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 10/01/25.
//

import SwiftUI

struct StateListView: View {
    
    @StateObject var viewModel = StateListViewModel()
    
    var body: some View {
        NavigationStack {
            List($viewModel.stateItemsViewModel) { $stateItemVM in
                Section(stateItemVM.name, isExpanded: $stateItemVM.isExpanded) {
                    ForEach(stateItemVM.citiesViewModel) { cityItemVM in
                        CityRow(viewModel: cityItemVM)
                    }
                }.accessibilityAddTraits(.isHeader)
            }.listStyle(.sidebar)
                .task {
                    viewModel.fetchData()
                }
                .navigationTitle(StateListViewConstants.title)
                .toolbar {
                    Button(StateListViewConstants.reverseList, systemImage: StateListViewConstants.revereseOrderImage) {
                        viewModel.revereseOrderList()
                    }.accessibilityLabel(StateListViewConstants.reverseList)
                }
        }
    }
}
           

#Preview {
    StateListView()
}
