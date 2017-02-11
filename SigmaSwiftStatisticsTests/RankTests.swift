//
//  RanksTest.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 21/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//
import XCTest
import SigmaSwiftStatistics

class RankTests: XCTestCase {
  
  func testRank() {
    let result = Sigma.rank([2, 3, 6, 5, 3])
    XCTAssertEqual([1, 2.5, 5, 4, 2.5], result)
  }
  
  func testRank_decimals() {
    let data = [0.98, 1.11, 1.27, 1.32, 1.44, 1.56, 1.56, 1.76, 2.56, 3.07,
                0.37, 0.38, 0.61, 0.78, 0.83, 0.86, 0.9, 0.95, 1.63, 1.97]
    
    let result = Sigma.rank(data)
    
    let expected: [Double] = [9, 10, 11, 12, 13, 14.5, 14.5, 17, 19, 20,
                              1, 2, 3, 4, 5, 6, 7, 8, 16, 18]
    
    XCTAssertEqual(expected, result)
  }
  
  func testRank_singleValue() {
    let result = Sigma.rank([50])
    XCTAssertEqual([1.0], result)
  }
  
  func testRank_empty() {
    let result = Sigma.rank([])
    XCTAssertEqual([], result)
  }
  
  // MARK: ties
  
  func testRank_tiesMean() {
    let result = Sigma.rank([100, 100, 100, 100], ties: .average)
    
    XCTAssertEqual([2.5, 2.5, 2.5, 2.5], result)
  }
  
  func testRanksTiesMin() {
    let result = Sigma.rank([100, 100, 100, 100], ties: .min)
    
    XCTAssertEqual([1, 1, 1, 1], result)
  }
  
  func testRanksTiesMax() {
    let result = Sigma.rank([100, 100, 100, 100], ties: .max)
    
    XCTAssertEqual([4, 4, 4, 4], result)
  }
  
  func testRank_tiesFirst() {
    let result = Sigma.rank([100, 100, 100, 100], ties: .first)
    
    XCTAssertEqual([1, 2, 3, 4], result)
  }
  
  func testRank_tiesLast() {
    let result = Sigma.rank([100, 100, 100, 100], ties: .last)
    
    XCTAssertEqual([4, 3, 2, 1], result)
  }
}
