import XCTest
import SigmaSwiftStatistics

class CovarianceTests: XCTestCase {
  
  // MARK: - Sample covariance
  
  func testSampleCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Sigma.covarianceSample(x: x, y: y)!
    
    XCTAssertEqual(5.03, Helpers.round10(result))
  }
  
  func testSampleCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 4]
    let result = Sigma.covarianceSample(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_whenGivenSingleSetOfValues() {
    let x = [1.2]
    let y = [0.5]
    let result = Sigma.covarianceSample(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testSampleCovariance_samplesAreEmpty() {
    let result = Sigma.covarianceSample(x: [], y: [])
    
    XCTAssert(result == nil)
  }
  
  // MARK: - Population covariance
  
  func testPopulationCovariance() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5, 1, 2.1, 3.4, 3.4, 4]
    let result = Sigma.covariancePopulation(x: x, y: y)!
    
    XCTAssertEqual(4.1916666667, Helpers.round10(result))
  }
  
  func testPopulationCovariance_unequalSamples() {
    let x = [1, 2, 3.5, 3.7, 8, 12]
    let y = [0.5]
    let result = Sigma.covariancePopulation(x: x, y: y)
    
    XCTAssert(result == nil)
  }
  
  func testPopulationCovariance_emptySamples() {
    let result = Sigma.covariancePopulation(x: [], y: [])
    
    XCTAssert(result == nil)
  }
}
