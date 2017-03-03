import XCTest
import SigmaSwiftStatistics

class univariateANOVATests: XCTestCase {
    // MARK: - Sample variance

    let testAccuracy = 0.0000000001
    
    func testUnivariateANOVABetween() {
        let data = [[18.2, 20.1, 17.6, 16.8, 18.8, 19.7, 19.1],
                    [17.4, 18.7, 19.1, 16.4, 15.9, 18.4, 17.7],
                    [15.2, 18.8, 17.7, 16.5, 15.9, 17.1, 16.7]]
        let result = Sigma.univariateANOVA(data: data, modelType: "between")!
        print(result["probability"])
        let fratio = result["Fratio"]!
        XCTAssertEqualWithAccuracy(3.9682957537, fratio, accuracy: testAccuracy)
    }
    
    func testUnivariateANOVAWithin() {
        let data: [[Double]] = [[30.0,14.0,24.0,38,26],[28,18,20,34,28],
                    [16,10,18,20,14],[34,22,30,44,30]]
        let result = Sigma.univariateANOVA(data: data, modelType: "within")!
        print(result["probability"])
        let fratio = result["Fratio"]!
        XCTAssertEqualWithAccuracy(24.758865248226989, fratio, accuracy: testAccuracy)
    }
    


}
