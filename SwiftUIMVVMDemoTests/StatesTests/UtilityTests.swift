//
//  UtilityTests.swift
//  SwiftUIMVVMDemoTests
//
//  Created by syamily.mt on 14/01/25.
//

import XCTest
@testable import SwiftUIMVVMDemo

final class UtilityTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalJsonPathInvalid() throws {
        do {
            let _: [CityModel] = try Utility.loadJson("au_citie.json")
        } catch {
            XCTAssertEqual(error as! Utility.JsonParseError, Utility.JsonParseError.invalidPath, "Invalid Json path should be thrown")
        }
        
    }
    
    func testLocalJsonDataCorrupted() throws {
        do {
            let _: [CityModel] = try Utility.loadJson("au_cities_1.json")
        } catch {
            XCTAssertNotNil(error, "Json corrupted data should be thrown")
        }
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
