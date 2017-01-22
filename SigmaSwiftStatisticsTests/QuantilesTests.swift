import XCTest
import SigmaSwiftStatistics

class QuantilesTests: XCTestCase {  
  // MARK: - method1
  
  func testQuantiles_method1() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method1_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(3, result)
  }
  
  func testQuantiles_method1_probablityCloseToZero1() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.166)
    XCTAssertEqual(-5, Helpers.round10(result!))
  }
  
  func testQuantiles_method1_probablityCloseToZero2() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.167)
    XCTAssertEqual(1, Helpers.round10(result!))
  }
  
  func testQuantiles_method1_probablityZero() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method1_probablityCloseToOne1() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.833)
    XCTAssertEqual(12, Helpers.round10(result!))
  }
  
  func testQuantiles_method1_probablityCloseToOne2() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 0.834)
    XCTAssertEqual(19.5, Helpers.round10(result!))
  }
  
  func testQuantiles_method1_probablityOne() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method1_oneValue() {
    let result = Sigma.quantiles.method1([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method1_empty() {
    let result = Sigma.quantiles.method1([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method1_probabilityNegative() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method1_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method1([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  // MARK: - method2
  
  func testQuantiles_method2() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method2_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method2_probablityCloseToZero1() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.166)
    XCTAssertEqual(-5, Helpers.round10(result!))
  }
  
  func testQuantiles_method2_probablityCloseToZero2() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.167)
    XCTAssertEqual(1, Helpers.round10(result!))
  }
  
  func testQuantiles_method2_probablityZero() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method2_probablityCloseToOne1() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.833)
    XCTAssertEqual(12, Helpers.round10(result!))
  }
  
  func testQuantiles_method2_probablityCloseToOne2() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 0.834)
    XCTAssertEqual(19.5, Helpers.round10(result!))
  }
  
  func testQuantiles_method2_probablityOne() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method2_oneValue() {
    let result = Sigma.quantiles.method2([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method2_empty() {
    let result = Sigma.quantiles.method2([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method2_probabilityNegative() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method2_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method2([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  
  // MARK: - method3
  
  func testQuantiles_method3() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method3_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(3, result)
  }
  
  func testQuantiles_method3_probablityCloseToZero() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.25)
    XCTAssertEqual(1, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_probablityZero() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method3_Rtest1() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.416)
    XCTAssertEqual(1, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_Rtest2() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.417)
    XCTAssertEqual(3, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_Rtest3() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.583)
    XCTAssertEqual(3, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_Rtest4() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.584)
    XCTAssertEqual(8, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_probablityCloseToOne() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 0.91)
    XCTAssertEqual(12, Helpers.round10(result!))
  }
  
  func testQuantiles_method3_probablityOne() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method3_oneValue() {
    let result = Sigma.quantiles.method3([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method3_empty() {
    let result = Sigma.quantiles.method3([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method3_probabilityNegative() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method3_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method3([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  // MARK: - method4
  
  func testQuantiles_method4() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method4_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(3, result)
  }
  
  func testQuantiles_method4_probablityCloseToZero() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 0.17)
    XCTAssertEqual(-4.88, Helpers.round10(result!))
  }
  
  func testQuantiles_method4_probablityZero() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method4_probablityCloseToOne() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 0.999)
    XCTAssertEqual(19.455, Helpers.round10(result!))
  }
  
  func testQuantiles_method4_probablityOne() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method4_oneValue() {
    let result = Sigma.quantiles.method4([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method4_empty() {
    let result = Sigma.quantiles.method4([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method4_probabilityNegative() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method4_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method4([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  // MARK: - method5
  
  func testQuantiles_method5() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-3.5, result)
  }
  
  func testQuantiles_method5_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method5_probablityCloseToZero() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 0.11)
    XCTAssertEqual(-4.04, Helpers.round10(result!))
  }
  
  func testQuantiles_method5_probablityZero() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method5_probablityCloseToOne() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 0.91)
    XCTAssertEqual(19.2, Helpers.round10(result!))
  }
  
  func testQuantiles_method5_probablityOne() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method5_oneValue() {
    let result = Sigma.quantiles.method5([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method5_empty() {
    let result = Sigma.quantiles.method5([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method5_probabilityNegative() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method5_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method5([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  
  // MARK: - method6
  
  func testQuantiles_method6() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method6_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method6_probablityCloseToZero() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 0.1999)
    XCTAssertEqual(-2.6042, Helpers.round10(result!))
  }
  
  func testQuantiles_method6_probablityZero() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method6_probablityCloseToOne() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 0.849)
    XCTAssertEqual(19.0725, Helpers.round10(result!))
  }
  
  func testQuantiles_method6_probablityOne() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method6_oneValue() {
    let result = Sigma.quantiles.method6([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method6_empty() {
    let result = Sigma.quantiles.method6([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method6_probabilityNegative() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method6_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method6([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  
  // MARK: - method7
  
  func testQuantiles_method7() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-1.25, result)
  }
  
  func testQuantiles_method7_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method7_probablityCloseToZero() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 0.00001)
    XCTAssertEqual(-4.9997, Helpers.round10(result!))
  }
  
  func testQuantiles_method7_probablityZero() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method7_probablityCloseToOne() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 0.9999)
    XCTAssertEqual(19.49625, Helpers.round10(result!))
  }
  
  func testQuantiles_method7_probablityOne() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method7_oneValue() {
    let result = Sigma.quantiles.method7([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method7_empty() {
    let result = Sigma.quantiles.method7([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method7_probabilityNegative() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method7_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method7([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  // MARK: - method8
  
  func testQuantiles_method8() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-4.25, result)
  }
  
  func testQuantiles_method8_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method8_probablityCloseToZero() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 0.11)
    XCTAssertEqual(-4.82, Helpers.round10(result!))
  }
  
  func testQuantiles_method8_probablityZero() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method8_probablityCloseToOne() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 0.89)
    XCTAssertEqual(19.275, result)
  }
  
  func testQuantiles_method8_probablityOne() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method8_oneValue() {
    let result = Sigma.quantiles.method8([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
 
  func testQuantiles_method8_empty() {
    let result = Sigma.quantiles.method8([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method8_probabilityNegative() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method8_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method8([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
  
  // MARK: - method9
  
  func testQuantiles_method9() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 0.125)
    XCTAssertEqual(-4.0625, result)
  }
  
  func testQuantiles_method9_probabilityFiftyPercent() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 0.5)
    XCTAssertEqual(5.5, result)
  }
  
  func testQuantiles_method9_probablityCloseToZero() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 0.10001)
    XCTAssertEqual(-4.999625, Helpers.round10(result!))
  }
  
  func testQuantiles_method9_probablityZero() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 0)
    XCTAssertEqual(-5, result)
  }
  
  func testQuantiles_method9_probablityCloseToOne() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 0.89)
    XCTAssertEqual(19.03125, result)
  }
  
  func testQuantiles_method9_probablityOne() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 1)
    XCTAssertEqual(19.5, result)
  }
  
  func testQuantiles_method9_oneValue() {
    let result = Sigma.quantiles.method9([1.234], alpha: 0.44)
    XCTAssertEqual(1.234, result)
  }
  
  func testQuantiles_method9_empty() {
    let result = Sigma.quantiles.method9([], alpha: 0.125)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method9_probabilityNegative() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: -0.1)
    XCTAssertNil(result)
  }
  
  func testQuantiles_method9_probabilityGreaterThanOne() {
    let result = Sigma.quantiles.method9([1, 12, 19.5, -5, 3, 8], alpha: 1.1)
    XCTAssertNil(result)
  }
}
