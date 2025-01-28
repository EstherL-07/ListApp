//
//  CityListViewModel.swift
//  ListApp
//
//  Created by apple on 27/01/25.
//

import SwiftUI
import Combine

class CityListViewModel: ObservableObject {
    @Published var citiesByState: [String: [City]] = [:]
    @Published var isDescending: Bool = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadCities()
    }

    func loadCities() {
        if let cachedData = UserDefaults.standard.data(forKey: Constants.cacheKey),
           let cachedCities = try? JSONDecoder().decode([City].self, from: cachedData) {
            self.groupCitiesByState(cachedCities)
        } else {
            refreshCities()
        }
    }

    func refreshCities() {
        guard let url = Bundle.main.url(forResource: Constants.jsonFileName, withExtension: Constants.jsonFileExtension) else {
            errorMessage = "\(ErrorMessages.failedToLocateFile)"
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let cities = try JSONDecoder().decode([City].self, from: data)
            UserDefaults.standard.set(data, forKey: Constants.cacheKey)
            groupCitiesByState(cities)
        } catch {
            errorMessage = "\(ErrorMessages.dataLoadFailed) \(error.localizedDescription)"
        }
    }

    private func groupCitiesByState(_ cities: [City]) {
        let grouped = Dictionary(grouping: cities, by: { $0.adminName })
        citiesByState = grouped
    }

    func toggleOrder() {
        isDescending.toggle()
        let orderedKeys = citiesByState.keys.sorted(by: isDescending ? (>) : (<))
        citiesByState = Dictionary(uniqueKeysWithValues: orderedKeys.map { ($0, citiesByState[$0]!) })
    }
}
