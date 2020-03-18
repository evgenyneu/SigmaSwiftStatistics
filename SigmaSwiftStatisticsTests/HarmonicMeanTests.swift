import XCTest
import SigmaSwiftStatistics

class HarmonicMeanTests: XCTestCase {
  
  func testHarmonicMean_Normal() {
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
    if let result = Sigma.harmonicMean(data: data_array) {
      XCTAssertEqualWithAccuracy(0.17589575818127001, result, accuracy: 0.000000000000001)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testGeometricMean_EmptyArray() {
    let data_array: [Double] = []
    if let _ = Sigma.harmonicMean(data: data_array) {
      XCTFail()
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
  func testGeometricMean_SingleElement() {
    let data_array = [0.52662978]
    if let result = Sigma.harmonicMean(data: data_array) {
      XCTAssertEqualWithAccuracy(0.52662978000000005, result, accuracy: 0.000000000000001)
    }
    else {
      XCTAssertNil(nil)
    }
  }
  
}
