//
//  CityRow.swift
//  SwiftUIMVVMDemo
//
//  Created by syamily.mt on 10/01/25.
//

import SwiftUI

struct CityRow: View {
    
    @StateObject var viewModel: CityItemViewModel

    var body: some View {
        VStack {
            Text(viewModel.cityName)
                .frame(maxWidth: .infinity, alignment: .leading) 

            Text("\(CityRowConstants.population) \(viewModel.population)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
            
            Text("\(CityRowConstants.latitude) \(viewModel.latitude)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)

            Text("\(CityRowConstants.longitude) \(viewModel.longitude)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)

        }.accessibilityElement(children: .combine)
    }
}
