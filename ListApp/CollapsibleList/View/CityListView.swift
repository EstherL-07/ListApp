//
//  CityListView.swift
//  ListApp
//
//  Created by apple on 27/01/25.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel = CityListViewModel()
    @State private var expandedStates: Set<String> = []

    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundColor(.red).padding()
                }

                List {
                    ForEach(viewModel.citiesByState.keys.sorted(by: viewModel.isDescending ? (>) : (<)), id: \.self) { state in
                        Section(header: headerView(for: state)) {
                            if expandedStates.contains(state) {
                                ForEach(viewModel.citiesByState[state]!) { city in
                                    Text(city.city)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .refreshable {
                    viewModel.refreshCities()
                }

            }
        }
        //.navigationTitle("\(Constants.appTitle)").font(.system(size: 24))
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Great Cities")
                    .font(.headline) // Customize the font
                    .foregroundColor(.primary) // Optional color
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.toggleOrder) {
                    Image(systemName: "arrow.up.arrow.down") 
                        .font(.subheadline)
                }
            }
        }
    }

    private func headerView(for state: String) -> some View {
        HStack {
            Text(state)
                .font(.headline)
            Spacer()
            Image(systemName: expandedStates.contains(state) ? "chevron.up" : "chevron.down")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if expandedStates.contains(state) {
                expandedStates.remove(state)
            } else {
                expandedStates.insert(state)
            }
        }
    }
}

#Preview {
    CityListView()
}
