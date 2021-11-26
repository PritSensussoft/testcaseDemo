import XCTest
@testable import ImplementTestCase

class ImplementTestCaseTests: XCTestCase {
    
    var vc = ViewController()
    
    //MARK:- TestCase Implement
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    func testExample() throws {
        XCTAssert(true,"pass")
    }
    func testemailEmpty() throws{
        let  result = vc.validLoginInput(email: "abc@gmail.com.uk", password: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailInvalid() throws{
        let  result = vc.validLoginInput(email: "abc", password: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailWithoutDot(){
        let  result = vc.validLoginInput(email: "abc@gmail", password: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailwithoutUsername(){
        let  result = vc.validLoginInput(email: "@gmail.com", password: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailValidSubDomain(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", password: "Aaaa@12345")
        XCTAssertTrue(result)
    }
    
    func testpasswordEmpty(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", password: "")
        XCTAssertFalse(result)
    }
    
    func testpasswordLengthOrCharInvlid(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", password: "123456")
        XCTAssertFalse(result)
    }
    
    func testLoginValid(){
        let  result = vc.validLoginInput(email: "abc@gmail.com", password: "Aaaa@12345")
        XCTAssertTrue(result)
    }
}

//
//  ImplementTestCaseTests.swift
//  ImplementTestCaseTests
//
//  Created by iMac on 27/10/21.
//
