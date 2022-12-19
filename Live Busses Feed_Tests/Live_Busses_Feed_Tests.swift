//
//  Live_Busses_Feed_Tests.swift
//  Live Busses Feed_Tests
//
//  Created by Sahil Sahu on 19/12/22.
//

import XCTest
@testable import Live_Busses_Feed

class Live_Busses_Feed_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let latitude: Double = 28.543680
        let longitude: Double = 77.198692
        NetworkService.shared.fetchNearbyBusses(device_id: "test_user", lattitude: latitude, longitude: longitude) { res in
            switch res{
            case .success(let busses):
                print(busses)
                XCTAssertNotNil(busses)
            case .failure(let error):
                print(error)
                XCTAssertNotNil(nil)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
