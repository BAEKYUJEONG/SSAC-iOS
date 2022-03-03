//
//  APIServiceTests.swift
//  SeSACWeek23Tests
//
//  Created by 백유정 on 2022/03/03.
//

import XCTest
@testable import SeSACWeek23

class APIServiceTests: XCTestCase {
    
    var sut: APIService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    // CallRequest > number 1~45
    func testExample() throws {
        
        sut.number = 100
        
        sut.callRequest { number in
            XCTAssertLessThanOrEqual(self.sut.number, 45)
            XCTAssertGreaterThanOrEqual(self.sut.number, 1)
        }
    }

    // 비동기: expection, fullfill, wait
    // 네트워크: 아이폰 네트워크 응답 X, API 서버 점검, API 지연
    // => 테스트 더블: 테스트 코드와 상호작용을 할 수 있는 가짜 객체 생성 (ex. 스턴트맨)
    // => Dummy, Stub, Fake, Spy, Mock => 테스트가 가능한 객체 만듦
    // => Fast 속도 개선, 테스트 대상 격리, 예측 불가능한 상황 X
    func testExample2() throws {
        
        let promise = expectation(description: "Waiting Lotto Number, Completion Handler Invoked")
        
        sut.number = 30
        sut.callRequest { number in
            XCTAssertLessThanOrEqual(self.sut.number, 45)
            XCTAssertGreaterThanOrEqual(self.sut.number, 1)
            promise.fulfill() // expectation으로 정의한 테스트 조건을 충족한 시점에 호출
        }
        
        wait(for: [promise], timeout: 5) // timeout : 5초가 지나면 실패 간주
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
