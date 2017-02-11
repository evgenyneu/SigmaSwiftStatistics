import XCTest
import SigmaSwiftStatistics

class FrequenciesTests: XCTestCase {
  func testFrequencies() {
    let result = Sigma.frequencies([1, 2, 3, 4, 5, 4, 4, 3, 5])
    XCTAssertEqual([2:1, 3:2, 4:3, 5:2, 1:1], result)
  }
  
  func testFrequencies_singleArray() {
    let result = Sigma.frequencies([-99.999])
    XCTAssertEqual([-99.999:1], result)
  }

  func testFrequencies_homogenousArray() {
    let result = Sigma.frequencies([-99.999, -99.999, -99.999, -99.999, -99.999, -99.999])
    XCTAssertEqual([-99.999:6], result)
  }
  
  func testFrequencies_emptyArray() {
    let result = Sigma.frequencies([])
    XCTAssertEqual([:], result)
  }
}
