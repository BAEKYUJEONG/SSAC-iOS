//
//  SeSACWeek23Tests.swift
//  SeSACWeek23Tests
//
//  Created by 백유정 on 2022/02/28.
//

import XCTest
@testable import SeSACWeek23

class SeSACWeek23Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        /*
        let array = [3,6,2,8]
        
        let sortArray = array.sorted()
        
        XCTAssertEqual(sortArray, [2,3,6,8])
        */
        
        //let vc = ViewController()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.loadViewIfNeeded()
        vc.firstTextField.text = "안녕하세욤"
        
        let result = vc.calculateTextFieldTextCount()
        
        XCTAssertEqual(result, 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
