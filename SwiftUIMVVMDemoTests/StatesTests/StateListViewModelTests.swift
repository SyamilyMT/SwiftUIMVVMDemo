//
//  StateListViewModelTests.swift
//  SwiftUIMVVMDemoTests
//
//  Created by syamily.mt on 13/01/25.
//

import XCTest
@testable import SwiftUIMVVMDemo

final class StateListViewModelTests: XCTestCase {
    
    var stateListViewModel: StateListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stateListViewModel = StateListViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        stateListViewModel = nil
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testFetchDataFromLocalJson() throws {
        // When
        stateListViewModel.fetchData()
        
        let stateItemsVM = self.stateListViewModel.stateItemsViewModel
        XCTAssertFalse(stateItemsVM.isEmpty, "Fetching data from json file is failed")
    }
    
    func testRevereseOrderList() throws {
        
        stateListViewModel.fetchData()
        let stateItemsVM = self.stateListViewModel.stateItemsViewModel

        let firstState = stateItemsVM.first?.name
        
        stateListViewModel.revereseOrderList()
        
        XCTAssertEqual(firstState, self.stateListViewModel.stateItemsViewModel.last?.name, "Reversing list order failed")
        

    }


}
