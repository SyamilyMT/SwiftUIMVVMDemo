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
            List {
                ForEach(Array($viewModel.stateItemsViewModel.enumerated()), id: \.1.id) { (index, $stateItemVM) in
                    Section {
                        if index == viewModel.expandedSection {
                            ForEach(stateItemVM.citiesViewModel) { cityItemVM in
                                CityRowView(viewModel: cityItemVM)
                            }
                        }
                    } header: {
                        HStack {
                            Text(stateItemVM.name)
                            Spacer()
                            if index == viewModel.expandedSection {
                                Image(systemName: StateListViewConstants.chevronDownImage).foregroundStyle(.blue)
                                    .accessibilityLabel(StateListViewConstants.collapseCities)
                            } else {
                                Image(systemName: StateListViewConstants.chevronRightImage).foregroundStyle(.blue)
                                    .accessibilityLabel(StateListViewConstants.expandCities)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            let tappedIndex = viewModel.stateItemsViewModel.firstIndex(where: {stateItemVM.name == $0.name}) ?? -1
                            if viewModel.expandedSection == tappedIndex {
                                viewModel.expandedSection = -1
                            } else {
                                viewModel.expandedSection = tappedIndex
                            }
                        }
                        .accessibilityAddTraits(.isButton)
                        .accessibilityElement(children: .combine)
                    }
                }
            }.task {
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
