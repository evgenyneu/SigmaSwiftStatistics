//
//  RanksTest.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import XCTest
import SigmaSwiftStatistics

class RanksTests: XCTestCase {
  
  // MARK: - ranking data
  
  func testRanksEmpty() {
    let result = Sigma.rank([])
    XCTAssertNil(result)
  }
  
  func testRanksSingle() {
    let data = [50.0]
    let result = Sigma.rank(data)!
    XCTAssertEqual([1.0], result)
  }
  
  func testRanksTiesMean() {
    let data = [100.0, 100.0, 100.0, 100.0]
    let result = Sigma.rank(data, ties: "mean")!
    XCTAssertEqual([2.5, 2.5, 2.5, 2.5], result)
  }
  
  func testRanksTiesMin() {
    let data = [100.0, 100.0, 100.0, 100.0]
    let result = Sigma.rank(data, ties: "min")!
    XCTAssertEqual([1.0, 1.0, 1.0, 1.0], result)
  }
  
  func testRanksTiesMax() {
    let data = [100.0, 100.0, 100.0, 100.0]
    let result = Sigma.rank(data, ties: "max")!
    XCTAssertEqual([4.0, 4.0, 4.0, 4.0], result)
  }
  
  func testRanksTiesFirst() {
    let data = [100.0, 100.0, 100.0, 100.0]
    let result = Sigma.rank(data, ties: "first")!
    XCTAssertEqual([1.0, 2.0, 3.0, 4.0], result)
  }
  
  func testRanksTiesLast() {
    let data = [100.0, 100.0, 100.0, 100.0]
    let result = Sigma.rank(data, ties: "last")!
    XCTAssertEqual([4.0, 3.0, 2.0, 1.0], result)
  }
  
  func testRanksBlank() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0])!
    XCTAssertEqual([1.5, 10.5, 4.0, 6.5, 4.0, 1.5, 4.0, 6.5, 8.5, 10.5, 8.5], result)
  }
  
  func testRanksStart() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: 100)!
    XCTAssertEqual([100.5, 109.5, 103.0, 105.5, 103.0, 100.5, 103.0, 105.5, 107.5, 109.5, 107.5], result)
  }
  
  func testRanksMean() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], ties: "mean")!
    XCTAssertEqual([1.5, 10.5, 4.0, 6.5, 4.0, 1.5, 4.0, 6.5, 8.5, 10.5, 8.5], result)
  }
  
  func testRanksStartMean() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: 50, ties: "mean")!
    XCTAssertEqual([50.5, 59.5, 53.0, 55.5, 53.0, 50.5, 53.0, 55.5, 57.5, 59.5, 57.5], result)
  }
  
  func testRanksStartTiesMin() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: 25, ties: "min")!
    XCTAssertEqual([25.0, 34.0, 27.0, 30.0, 27.0, 25.0, 27.0, 30.0, 32.0, 34.0, 32.0], result)
  }
  
  func testRanksStartTiesMax() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: -99, ties: "max")!
    XCTAssertEqual([-98.0, -89.0, -95.0, -93.0, -95.0, -98.0, -95.0, -93.0, -91.0, -89.0, -91.0], result)
  }
  
  func testRanksStartTiesFirst() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: 0, ties: "first")!
    XCTAssertEqual([0.0, 9.0, 2.0, 5.0, 3.0, 1.0, 4.0, 6.0, 7.0, 10.0, 8.0], result)
  }
  
  func testRanksStartTiesLast() {
    let result = Sigma.rank([1.0 ,6.0, 2.0 ,3.0 ,2.0 ,1.0 ,2.0 ,3.0 ,5.0 ,6.0 ,5.0], start: 2500, ties: "last")!
    XCTAssertEqual([2501.0, 2510.0, 2504.0, 2506.0, 2503.0, 2500.0, 2502.0, 2505.0, 2508.0, 2509.0, 2507.0], result)
  }
  
}
