import XCTest
import SigmaSwiftStatistics

class SkewnessKurtosisTests: XCTestCase {
  
  // MARK: - testing normal array for skewness and then kurtosis
  
  func testSkewness_Norm() {
    let data_array = [0.52662978,  0.77362142,  0.57550701, 0.04158415,  0.03447811,
                      0.08848505,  0.5236469 ,  0.25523548,  0.89229563,  0.71272614,
                      0.17107995,  0.26764894,  0.27308645,  0.38404429,  0.12755542,
                      0.9856573 ,  0.91394384,  0.50584635,  0.31623642,  0.13751698,
                      0.68101821,  0.71853529,  0.66112074,  0.71656707,  0.35927775,
                      0.76151524,  0.94317209,  0.01808385,  0.36550638,  0.9901121 ,
                      0.60259119,  0.62285146,  0.61310069,  0.55510847,  0.15929895,
                      0.80369179,  0.26319102,  0.49952759,  0.34527164,  0.08919652,
                      0.61979169,  0.43286263,  0.42874006,  0.1784381 ,  0.51625026,
                      0.74231264,  0.34506245,  0.70310094,  0.09531878,  0.02909812]
    if let result = Sigma.skewness(data_array) {
      XCTAssertEqualWithAccuracy(0.06416668605866518, result, accuracy: 0.000000000000001)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testKurtosis_Norm() {
    let data_array = [0.52662978,  0.77362142,  0.57550701, 0.04158415,  0.03447811,
                      0.08848505,  0.5236469 ,  0.25523548,  0.89229563,  0.71272614,
                      0.17107995,  0.26764894,  0.27308645,  0.38404429,  0.12755542,
                      0.9856573 ,  0.91394384,  0.50584635,  0.31623642,  0.13751698,
                      0.68101821,  0.71853529,  0.66112074,  0.71656707,  0.35927775,
                      0.76151524,  0.94317209,  0.01808385,  0.36550638,  0.9901121 ,
                      0.60259119,  0.62285146,  0.61310069,  0.55510847,  0.15929895,
                      0.80369179,  0.26319102,  0.49952759,  0.34527164,  0.08919652,
                      0.61979169,  0.43286263,  0.42874006,  0.1784381 ,  0.51625026,
                      0.74231264,  0.34506245,  0.70310094,  0.09531878,  0.02909812]
    if let result = Sigma.kurtosis(data_array) {
      XCTAssertEqualWithAccuracy(1.9473776246052905, result, accuracy: 0.00001)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  // MARK: - testing empty array for skewness and then kurtosis
  
  func testSkewness_Empty() {
    let data_array: [Double] = []
    if let _ = Sigma.skewness(data_array) {
      XCTFail()
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testKurtosis_Empty() {
    let data_array: [Double] = []
    if let _ = Sigma.kurtosis(data_array) {
      XCTFail()
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  // MARK: - testing array with single element for skewness and then kurtosis
  
  func testSkewness_Single() {
    let data_array = [-99.999]
    if let result = Sigma.skewness(data_array) {
      XCTAssertEqual(0.0, result)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testKurtosis_Single() {
    let data_array = [-99.999]
    if let result = Sigma.kurtosis(data_array) {
      XCTAssertEqual(0.0, result)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  

}
