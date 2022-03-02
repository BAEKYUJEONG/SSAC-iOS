//
//  LoginViewControllerTests.swift
//  SeSACWeek23Tests
//
//  Created by 백유정 on 2022/03/02.
//

import XCTest
@testable import SeSACWeek23

class LoginViewControllerTests: XCTestCase {
    
    // system under test
    var sut: LoginViewController!

    override func setUpWithError() throws {
        sut = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
/*
    // BDD (Behavior Driven Development) : Given, When, Then
    // TDD (Test Driven Development) : AAA
    func testLoginViewController_ValidID_ReturnTrue() throws {
        
        //Given, Arrange
        sut.idTextField.text = "jack@jack.com"
        //When, Act
        let valid = sut.isValidID()
        //Then, Assert
        XCTAssertTrue(valid, "@가 없거나 6글자 미만이라서 안될 수 있음")
    }

    func testLoginViewController_inValidPassword_ReturnFalse() throws {
        
        sut.passwordTextField.text = "1234"
        
        let valid = sut.isValidPassword()
        
        XCTAssertFalse(valid, "패스워드 6자리 이상 10자리 미만임. 로직 확인.")
    }
*/
    func testLoginViewController_idTextField_ReturnNil() throws {
        
        sut.idTextField = nil
        
        let value = sut.idTextField
        
        XCTAssertNil(value)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
