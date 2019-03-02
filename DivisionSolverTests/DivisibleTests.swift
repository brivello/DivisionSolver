//
//  DivisibleTests.swift
//  DivisionSolverTests
//
//  Created by Developer on 3/2/19.
//  Copyright © 2019 Suitable. All rights reserved.
//

import Foundation
import XCTest
@testable import DivisionSolver

class DivisibleTests: XCTestCase {

    let randomMin            = -1000000.0
    let randomMax            =  1000000.0
    let randomTestLength     =  100
    
    func testIsUsefull() {
        let problem: [Any] = [16.0, [20.0, 4.0], 22.0]
        XCTAssertTrue((16.0 / (20.0 / 4.0) / 22.0) != (16.0 / 20.0 / 4.0 / 22.0))
        XCTAssertTrue(problem.divide() == 16.0 / (20.0 / 4.0) / 22.0)
        XCTAssertTrue(problem.divide() != 16.0 / 20.0 / 4.0 / 22.0)
    }
    
    func testDivideZero () {
        let problem = [4.0, 0.0]
        XCTAssertTrue(problem.divide() == (4.0 / 0.0))
        XCTAssertTrue(problem.divide().isInfinite)
    }
    
    func testInvalidArray () {
        let problem:[Any] = [19.0, ["String", Data.init(), -4 ], true]
        XCTAssertTrue(problem.divide().isNaN)
    }
    
    func testExtraArrays () {
        let problem = [[[4.0, 2.3]]]
        XCTAssertTrue(problem.divide() == (4.0 / 2.3))
    }
    
    func testSampleProblem() {
        XCTAssertTrue([[16.0, [8.0,2.0],4.0],2.0,80.0].divide() ==   ((16 / (8 / 2) / 4) / 2 / 80)   )
    }
    
    func testDivideDoubles () {
        for _ in 0...randomTestLength {
            let dbl1 = Double.random(in: randomMin..<randomMax)
            let dbl2 = Double.random(in: randomMin..<randomMax)
            XCTAssertTrue([dbl1, dbl2].divide() == (dbl1 / dbl2))
        }
    }
    
    func testDivideArrays() {
        for _ in 0...randomTestLength {
            let dbl1 = Double.random(in: randomMin..<randomMax)
            let dbl2 = Double.random(in: randomMin..<randomMax)
            let dbl3 = Double.random(in: randomMin..<randomMax)
            let dbl4 = Double.random(in: randomMin..<randomMax)
            let solution = [[dbl1, dbl2], [dbl3, dbl4]].divide()
            XCTAssertTrue(solution == (dbl1 / dbl2) / (dbl3 / dbl4))
        }
    }
    
    func testDivideUnbalancedArrays() {
        for _ in 0...randomTestLength {
            let dbl1 = Double.random(in: randomMin..<randomMax)
            let dbl2 = Double.random(in: randomMin..<randomMax)
            let dbl3 = Double.random(in: randomMin..<randomMax)
            let dbl4 = Double.random(in: randomMin..<randomMax)
            let dbl5 = Double.random(in: randomMin..<randomMax)
            let dbl6 = Double.random(in: randomMin..<randomMax)
            let dbl7 = Double.random(in: randomMin..<randomMax)
            let dbl8 = Double.random(in: randomMin..<randomMax)
            let solution = [dbl1, [dbl2, dbl3], dbl4, [dbl5, dbl6, dbl7], dbl8].divide()
            XCTAssertTrue(solution == dbl1 / (dbl2 / dbl3) / dbl4 / (dbl5 / dbl6 / dbl7) / dbl8)
        }
    }
    
    func testDivideNestedUnbalancedArrays() {
        for _ in 0...randomTestLength {
            let dbl1  = Double.random(in: randomMin..<randomMax)
            let dbl2  = Double.random(in: randomMin..<randomMax)
            let dbl3  = Double.random(in: randomMin..<randomMax)
            let dbl4  = Double.random(in: randomMin..<randomMax)
            let dbl5  = Double.random(in: randomMin..<randomMax)
            let dbl6  = Double.random(in: randomMin..<randomMax)
            let dbl7  = Double.random(in: randomMin..<randomMax)
            let dbl8  = Double.random(in: randomMin..<randomMax)
            let dbl9  = Double.random(in: randomMin..<randomMax)
            let dbl10 = Double.random(in: randomMin..<randomMax)
            let dbl11 = Double.random(in: randomMin..<randomMax)
            let dbl12 = Double.random(in: randomMin..<randomMax)
            let solution = [dbl1, [dbl2, [dbl3, dbl4], [dbl5, [dbl6, dbl7], dbl8, dbl9], dbl10, dbl11], dbl12].divide()
            XCTAssertTrue(solution == dbl1 / (dbl2 / (dbl3 / dbl4) / (dbl5 / (dbl6 / dbl7) / dbl8 / dbl9) / dbl10 / dbl11) / dbl12)
        }
    }
}
