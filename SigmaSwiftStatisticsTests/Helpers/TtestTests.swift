import XCTest
import SigmaSwiftStatistics

class TtestsTests: XCTestCase {
    // MARK: - Sample variance
    
    let testAccuracy = 0.001
    
    func testtTest_one() {
        let data: [Double] = [62.0, 92, 75, 68, 83, 95]
        let hyp_mean = 70.0
        let result = Sigma.tTest_one(data, userMean: hyp_mean)
        // t = 1.7053, df = 5, p-value = 0.1489 (from R)
        
        // test 't'
        if let t = result?["t"] {
            XCTAssertEqualWithAccuracy(1.7053, t, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'probability'
        if let probability = result?["probability"] {
            XCTAssertEqualWithAccuracy(0.1489, probability, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'df'
        if let df = result?["df"] {
            XCTAssertEqualWithAccuracy(5, df, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
    }
 
    func testtTest_Unpaired_Unequal() {
        let data1: [Double] = [30.02, 29.99, 30.11, 29.97, 30.01, 29.99]
        let data2: [Double] = [29.89, 29.93, 29.72, 29.98, 30.02, 29.98]
        var result = Sigma.tTest(data1, data2, testType: 3)
        // t = 1.959, df = 7.0306, p-value = 0.09077 (unequal variances from Wikipedia)

        // Test 't'
        if let t = (result?["t"]) {
            XCTAssertEqualWithAccuracy(1.959, t, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'probability'
        if let probability = result?["probability"] {
            XCTAssertEqualWithAccuracy(0.09077, probability, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'df'
        if let df = result?["df"] {
            XCTAssertEqualWithAccuracy(7.0306, df, accuracy: testAccuracy) // 7.4018
        }
        else {
            XCTFail()
        }
    }

    func testtTest_Unpaired_Equal() {
        let data1: [Double] = [30.02, 29.99, 30.11, 29.97, 30.01, 29.99]
        let data2: [Double] = [29.89, 29.93, 29.72, 29.98, 30.02, 29.98]
        var result = Sigma.tTest(data1, data2, testType: 2)
        // t = 1.959, df = 10, p-value = 0.07857 (equal variances, from R)

        // test 't'
        if let t = result?["t"] {
            XCTAssertEqualWithAccuracy(1.959, t, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'probability'
        if let probability = result?["probability"] {
            XCTAssertEqualWithAccuracy(0.07857, probability, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'df'
        if let df = result?["df"] {
            XCTAssertEqualWithAccuracy(10.0, df, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
    }
    
    func testtTest_Paired() {
        let data1: [Double] = [ 3, 3, 3,12,15,16,17,19,23,24,32]
        let data2: [Double] = [20,13,13,20,29,32,23,20,25,15,30]
        let result = Sigma.tTest(data1, data2, testType: 1)
        // t = -2.7373, df = 10, p-value = 0.02093 (from R)
        
        // test 't'
        if let t = result?["t"] {
            XCTAssertEqualWithAccuracy(-2.7373, t, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }
        
        // test 'probability'
        if let probability = result?["probability"] {
            XCTAssertEqualWithAccuracy(0.02093, probability, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }

        // test 'df'
        if let df = result?["df"] {
            XCTAssertEqualWithAccuracy(10, df, accuracy: testAccuracy)
        }
        else {
            XCTFail()
        }

    }
    
    
    
}
