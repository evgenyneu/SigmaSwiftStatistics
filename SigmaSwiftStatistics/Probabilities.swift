import Foundation

public extension Sigma {

    public static func gammln(xx: Double) -> Double? {
        let coeffs = [76.18009173, -86.50532033, 24.01409822, -1.231739516, 0.120858003e-2, -0.536382e-5]
        var x = xx - 1.0
        var tmp = x + 5.5
        tmp = tmp - (x + 0.5) * log(tmp)
        var ser = 1.0
        for coeff in coeffs {
            x = x + 1.0
            ser = ser + (coeff / x)
        }
        return -tmp + log(2.50662827465*ser)
    }


    
}

