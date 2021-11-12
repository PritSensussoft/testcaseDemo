import XCTest
@testable import ImplementTestCase

class ImplementTestCaseTests: XCTestCase {
    
    var vc = ViewController()
    
    //MARK:- TestCase Implement
    
    func testemailEmpty(){
        let  result = vc.validLoginInput(email: "abc@gmail.com", passord: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailInvalid(){
        let  result = vc.validLoginInput(email: "abc", passord: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailWithoutDot(){
        let  result = vc.validLoginInput(email: "abc@gmail", passord: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailwithoutUsername(){
        let  result = vc.validLoginInput(email: "@gmail.com", passord: "Aa@12345")
        XCTAssertFalse(result)
    }
    
    func testemailValidSubDomain(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", passord: "Aaaa@12345")
        XCTAssertTrue(result)
    }
    
    func testpasswordEmpty(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", passord: "")
        XCTAssertFalse(result)
    }
    
    func testpasswordLengthOrCharInvlid(){
        let  result = vc.validLoginInput(email: "abc@gmail.co.uk", passord: "123456")
        XCTAssertFalse(result)
    }
    
    func testLoginValid(){
        let  result = vc.validLoginInput(email: "abc@gmail.com", passord: "Aaaa@123")
        XCTAssertTrue(result)
    }
}



//
//  ImplementTestCaseTests.swift
//  ImplementTestCaseTests
//
//  Created by iMac on 27/10/21.
//
