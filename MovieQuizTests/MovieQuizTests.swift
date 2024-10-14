//
//  MovieQuizTests.swift
//  MovieQuiz
//
//  Created by Руслан Камалов on 13.10.2024.
//

import XCTest

struct ArithmeticOperationsSyncTests {
    func addition(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    func deduct(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    func multiply(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}

struct ArithmeticOperationsAsyncTests {
    
    func addition(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 + num2)
        }
    }
    
    func deduct(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 - num2)
        }
    }
    
    func multiply(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            handler(num1 * num2)
        }
    }
}


final class MovieQuizTests: XCTestCase {
    
    func testAddition() throws {
        //Given
        let arithmeticOperations = ArithmeticOperationsSyncTests()
        let num1 = 1
        let num2 = 2
        
        //When
        let result = arithmeticOperations.addition(num1: num1, num2: num2)
        
        //Then
        XCTAssertEqual(result, 3)
    }
    
    func testAdditionAsync() throws {
        //Given
        let arithmeticOperations = ArithmeticOperationsAsyncTests()
        let num1 = 1
        let num2 = 2
        
        //When
        let expectation = expectation(description: "Addition function expectation")
        arithmeticOperations.addition(num1: num1, num2: num2) { result in
            //Then
            XCTAssertEqual(result, 3)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
}
