//
//  Quantiles.swift
//
//  Created by Alan James Salmoni on 21/12/2016.
//  Copyright © 2016 Thought Into Design Ltd. All rights reserved.
//

import Foundation

func QDef(data: [Double], k: Int, alpha: Double) -> Double {
    /* Unsure if return is a double or an array? */
    let qdef = ((1.0 - alpha)*data[k-1])+(alpha*data[k])
    return qdef
}

func Q1(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int((alpha * Double(count)))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
        new_alpha = 0.0
    }
    let Q = QDef(data: data, k: k, alpha: new_alpha)
    return Q
}

func Q2(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let k = Int(alpha * Double(count))
    let g = (alpha * Double(count)) - Double(k)
    var new_alpha = 1.0
    if g == 0.0 {
        new_alpha = 0.5
    }
    let Q = QDef(data: data, k: k, alpha: new_alpha)
    return Q
}

func Q3(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = -0.5
    let k = Int((alpha * Double(count)) + m)
    let g = (alpha * Double(count)) + m - Double(k)
    var new_alpha = 1.0
    /* if g == 0.0 && k.truncatingRemainder(dividingBy: 2.0) != 0.0 { */
    if g == 0.0 && k % 2 != 0 {
        new_alpha = 0.0
    }
    let Q = QDef(data: data, k: k, alpha: new_alpha)
    return Q
}

func Q4(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.0
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

func Q5(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = 0.5
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

func Q6(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = alpha
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

func Q7(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = 1.0 - alpha
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

func Q8(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = (alpha + 1.0) / 3.0
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

func Q9(data: [Double], alpha: Double) -> Double {
    let data = data.sorted(by: <)
    let count = data.count
    let m = (0.25 * alpha) + (3.0 / 8.0)
    let k = Int((alpha * Double(count)) + m)
    let alpha = (alpha * Double(count)) + m - Double(k)
    let Q = QDef(data: data, k: k, alpha: alpha)
    return Q
}

