import XCTest
import SigmaSwiftStatistics

class MedianTests: XCTestCase {
  
  // MARK: - Median
  
  func testMedian_oddNumberOfItems() {
    let result = Sigma.median([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedian_evenNumberOfItems() {
    let result = Sigma.median([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(5.5, result)
  }
  
  func testMedian_oneItem() {
    let result = Sigma.median([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedian_whenEmpty() {
    let result = Sigma.median([])
    XCTAssert(result == nil)
  }
  
  // MARK: - Median Low
  
  func testMedianLow_oddNumberOfItems() {
    let result = Sigma.medianLow([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianLow_evenNumberOfItems() {
    let result = Sigma.medianLow([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianLow_oneItem() {
    let result = Sigma.medianLow([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedianLow_whenEmpty() {
    let result = Sigma.medianLow([])
    XCTAssert(result == nil)
  }
  
  //MARK: - Median High
  
  func testMedianHigh_oddNumberOfItems() {
    let result = Sigma.medianHigh([1, 12, 19.5, 3, -5])!
    XCTAssertEqual(3, result)
  }
  
  func testMedianHigh_evenNumberOfItems() {
    let result = Sigma.medianHigh([1, 12, 19.5, 3, -5, 8])!
    XCTAssertEqual(8, result)
  }
  
  func testMedianHigh_oneItem() {
    let result = Sigma.medianHigh([2])!
    XCTAssertEqual(2, result)
  }
  
  func testMedianHigh_whenEmpty() {
    let result = Sigma.medianHigh([])
    XCTAssert(result == nil)
  }
}
