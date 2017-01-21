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
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([1, 12, 9.5, 3, -5, 12])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (12, [1,5])
    XCTAssertEqual(12, mode_value)
    XCTAssertEqual([1,5], mode_indices)
  }
  
  func testMode_negativeList() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([-0.000001, -4, -5, -10, -1.43242, -0.0001])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (-0.000001, [0])
    XCTAssertEqual(-0.000001, mode_value)
    XCTAssertEqual([0], mode_indices)
  }
  
  func testMode_singleItemList() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([1])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (1, [0])
    XCTAssertEqual(1, mode_value)
    XCTAssertEqual([0], mode_indices)
  }
  
  func testMode_singleZeroItem() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([0])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (0, [0])
    XCTAssertEqual(0, mode_value)
    XCTAssertEqual([0], mode_indices)
  }
  
  func testMode_emptyList() {
    let test_data: [Double] = []
    var mode_value: Double // This is a dummy. Needed to catch a non-nil result
    var mode_indices: [Int] // This is a dummy. Needed to catch a non-nil result
    let result = Sigma.mode(test_data)
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (nil)
    XCTAssertNil(nil)
  }
  
  func testMode_positiveNegativeList() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([-1, 12, -9.5, 3, -5, -12])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (12, [1])
    XCTAssertEqual(12, mode_value)
    XCTAssertEqual([1], mode_indices)
  }
  
  func testMode_allModes() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([12, 12, 12, 12, 12, 12, 12, 12, 12])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (12, [0,1,2,3,4,5,6,7,8])
    XCTAssertEqual(12, mode_value)
    XCTAssertEqual([0,1,2,3,4,5,6,7,8], mode_indices)
  }
  
  func testMode_allZeroModes() {
    var mode_value: Double
    var mode_indices: [Int]
    let result = Sigma.mode([0, 0, 0, 0, 0, 0, 0, 0])
    if result != nil {
      (mode_value, mode_indices) = result!
    }
    else {
      mode_value = -99
      mode_indices = [-99]
    }
    // (0, [0,0,0,0,0,0,0,0])
    XCTAssertEqual(0, mode_value)
    XCTAssertEqual([0,1,2,3,4,5,6,7], mode_indices)
  }
  
  func testMode_slightDifference() {
    let mode_value: Double
    let mode_indices: [Int]
    (mode_value, mode_indices) = Sigma.mode([4, 7.7777777, 5, 6, -33, 7.777777, 0, 7.7777777])!
    // (7.7777777, [1,7])
    XCTAssertEqual(7.7777777, mode_value)
    XCTAssertEqual([1,7], mode_indices)
  }
}
