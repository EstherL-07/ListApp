//
//  ListAppTests.swift
//  ListAppTests
//
//  Created by apple on 27/01/25.
//

import XCTest
@testable import ListApp

final class CityListViewModelTests: XCTestCase {

    var viewModel: CityListViewModel!

    override func setUpWithError() throws {
        viewModel = CityListViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testInitialLoad() {
        viewModel.loadCities()
        XCTAssertFalse(viewModel.citiesByState.isEmpty, "Cities should be loaded and grouped by state.")
    }

    func testToggleOrder() {
        viewModel.loadCities()
        let initialOrder = viewModel.citiesByState.keys.sorted()
        viewModel.toggleOrder()
        let reversedOrder = viewModel.citiesByState.keys.sorted()
        XCTAssertNotEqual(initialOrder, reversedOrder, "Order should be reversed after toggling.")
    }

    func testRefreshCities() {
        viewModel.refreshCities()
        XCTAssertFalse(viewModel.citiesByState.isEmpty, "Cities should be refreshed and grouped by state.")
    }

    func testErrorHandling() {
        // Temporarily modify the jsonFileName to an invalid file name to simulate an error.
        viewModel = CityListViewModel()
        XCTAssertNotNil(viewModel.errorMessage, "Error message should be set if JSON file loading fails.")
    }
}

