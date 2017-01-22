//
//  ModeTests.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 19/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import XCTest
import SigmaSwiftStatistics

class ModeTests: XCTestCase {
  
  func testMode_normalList() {
    if let result = Sigma.mode([1, 12, 9.5, 3, -5, 12]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (12, [1,5])
      XCTAssertEqual(12, mode_value)
      XCTAssertEqual([1,5], mode_indices)
    }
    else {
      XCTFail()
    }
  }
  
  func testMode_negativeList() {
    if let result = Sigma.mode([-0.000001, -4, -5, -10, -1.43242, -0.0001]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (-0.000001, [0])
      XCTAssertEqual(-0.000001, mode_value)
      XCTAssertEqual([0], mode_indices)
    }
    else {
      XCTFail()
    }
  }
  
  func testMode_singleItemList() {
    if let result = Sigma.mode([1]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (1, [0])
      XCTAssertEqual(1, mode_value)
      XCTAssertEqual([0], mode_indices)
    }
    else {
      XCTFail()
    }
  }
  
  func testMode_singleZeroItem() {
    if let result = Sigma.mode([0]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (0, [0])
      XCTAssertEqual(0, mode_value)
      XCTAssertEqual([0], mode_indices)
    }
    else {
      XCTFail()
    }
  }
  
  func testMode_emptyList() {
    let test_data: [Double] = []
    if let _ = Sigma.mode(test_data) {
      XCTFail()
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testMode_positiveNegativeList() {
    if let result = Sigma.mode([-1, 12, -9.5, 3, -5, -12]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (12, [1])
      XCTAssertEqual(12, mode_value)
      XCTAssertEqual([1], mode_indices)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testMode_allModes() {
    if let result = Sigma.mode([12, 12, 12, 12, 12, 12, 12, 12, 12]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (12, [0,1,2,3,4,5,6,7,8])
      XCTAssertEqual(12, mode_value)
      XCTAssertEqual([0,1,2,3,4,5,6,7,8], mode_indices)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testMode_allZeroModes() {
    if let result = Sigma.mode([0, 0, 0, 0, 0, 0, 0, 0]) {
      var mode_value: Double
      var mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (0, [0,0,0,0,0,0,0,0])
      XCTAssertEqual(0, mode_value)
      XCTAssertEqual([0,1,2,3,4,5,6,7], mode_indices)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testMode_slightDifference() {
    if let result = Sigma.mode([4, 7.7777777, 5, 6, -33, 7.777777, 0, 7.7777777]) {
      let mode_value: Double
      let mode_indices: [Int]
      (mode_value, mode_indices) = result
      // (7.7777777, [1,7])
      XCTAssertEqual(7.7777777, mode_value)
      XCTAssertEqual([1,7], mode_indices)
    }
    else {
      XCTAssertNil(nil)
    }
  }
}
