//
//  univariateANOVA.swift
//  SigmaSwiftStatistics
//
//  Created by Alan James Salmoni on 19/01/2017.
//  Copyright © 2017 Evgenii Neumerzhitckii. All rights reserved.
//

import Foundation

public extension Sigma {
    /**
     
     Performs within and between subjects univariate analysis of variance
     
     Within is also known as related or dependent
     Between is also known as unrelated or independent
     
     https://en.wikipedia.org/wiki/Analysis_of_variance
     
     */

    private static func shape(data: [[Double]]) -> [Int] {
        let numberOfColumns = data.count
        let numberOfRows = data[0].count
        return [numberOfColumns, numberOfRows]
    }
    
    private static func unravelMatrix(data: [[Double]]) -> [Double] {
        let k = data.count
        var newData: [Double] = []
        var columnData: [Double]
        var columnarN = 0
        for idx in 1...k {
            columnData = data[idx - 1]
            columnarN = columnData.count
            for idy in 1...columnarN {
                newData.append(columnData[idy - 1])
            }
        }
        return newData
    }
    
    private static func sumMatrix(data: [[Double]], axis: Int) -> [Double]? {
        var summedMatrix: [Double] = []
        if axis == 0 {
            // Summation across all data
            let unraveledMatrix = unravelMatrix(data: data)
            summedMatrix.append(sum(unraveledMatrix))
            return summedMatrix
        }
        else if axis == 1 {
            // column wise summation
            let matrixShape = shape(data: data)
            var summedColumn: Double
            var column: [Double]
            for idx in 1...matrixShape[0] {
                summedColumn = 0.0
                column = data[idx - 1]
                for idy in 1...matrixShape[1] {
                    summedColumn += column[idy - 1]
                }
                summedColumn /= Double(matrixShape[1])
                summedMatrix.append(summedColumn)
                }
            return summedMatrix
        }
        else if axis == 2 {
            // row wise summation
            let matrixShape = shape(data: data)
            var summedRow: Double
            for idy in 1...matrixShape[1] {
                summedRow = 0.0
                for idx in 1...matrixShape[0] {
                    summedRow += data[idx - 1][idy - 1]
                }
                summedRow /= Double(matrixShape[0])
                summedMatrix.append(summedRow)
            }
            return summedMatrix
        }
        else {
            return nil
        }
    }
    
    public static func univariateANOVA(data: [[Double]], modelType: String) -> Dictionary<String, Double>? {
        // Check incoming data to see if it's a nice, neat box
        if (modelType.lowercased() != "within" && modelType.lowercased() != "between") {
            return nil
        }
        // And how to deal with missing data?!
        
        // Might be worth having a separate routine to deal with missing data
        let matrixShape = shape(data: data)
        
        // calc k 'k'
        let k = matrixShape[0]
        
        // calc n (for each cell) 'nCells'
        let nCells = matrixShape[1]
        
        // calc total N 'nTotal'
        let nTotal = k * nCells

        // Calc mean for each column 'columnMeans'
        //let columnMeans = getColumnMeans(data: data)
        let columnMeans = sumMatrix(data: data, axis: 1)!

        // "flatten" data into a single vector 'whole'
        let whole = unravelMatrix(data: data)

        // Calc grand mean for all data 'grandMean'
        let grandMean = sum(whole) / Double(nTotal)

        // Define SS variables
        var SStotal: Double = 0.0
        var SStreatments: Double = 0.0
        var SSerror: Double
        var SSsubjects: Double = 0.0

        // Calc total sums of squares
        for idx in 1...whole.count {
            SStotal += pow((whole[idx - 1] - grandMean), 2)
        }
        
        // Calculate the sum of squares of treatments (columns)
        for idx in 1...k {
            SStreatments += pow((columnMeans[idx - 1] - grandMean), 2)
        }
        SStreatments = SStreatments * Double(nCells)

        // Calculate degrees of freedom for total and treatments. Error to follow
        let DFtotal = nTotal - 1
        let DFtreatments = k - 1
        var DFerror: Int = 0
        var DFsubjects: Int = 0

        // Check whether analysis is within or between subjects and analyse accordingly
        if modelType == "within" {
            // Calculate within-subjects design variables

            // Calc mean for each row 'means' if within subjects 'rowMeans'
            //let rowMeans = getRowMeans(data: data)
            let rowMeans = sumMatrix(data: data, axis: 2)!
            
            // Calculate sum of squares of subjects if a within-subjects design
            SSsubjects = 0.0
            for rowMean in rowMeans {
                SSsubjects += pow(rowMean - grandMean, 2)
            }
            SSsubjects = SSsubjects * Double(k)
            DFsubjects = nCells - 1
            DFerror = DFtotal - DFtreatments - DFsubjects
            
            // Calculate sum of squares of the error
            SSerror = SStotal - SStreatments - SSsubjects
        }

        else if modelType == "between" {
            // Calculate between-subjects design variables

            // Sum of squares of subjects is nil
            SSerror = SStotal - SStreatments
            DFerror = DFtotal - DFtreatments
        }

        else {
            // modelType not correctly specified!
            return nil // Needs to return a correct error here
        }
        
        // Define MS variables
        let MStreatments: Double
        let MSerror: Double
        let MSsubjects: Double
        let MStotal: Double
        
        // Calculate mean squares of treatments
        if DFtreatments != 0 {
            MStreatments = SStreatments / Double(DFtreatments)
        }
        else {
            // Unsure how to handle division by zero errors?
            MStreatments = 0.0
        }
        
        // Calculate mean square error
        if DFerror != 0 {
            MSerror = SSerror / Double(DFerror)
        }
        else {
            MSerror = 0.0
        }
        
        // Calculate mean square of subjects (only useful for within-subjects designs)
        if DFsubjects != 0 {
            MSsubjects = SSsubjects / Double(DFsubjects)
        }
        else {
            MSsubjects = 0.0
        }

        // Calculate mean square total
        if DFtotal != 0 {
            MStotal = SStotal / Double(DFtotal)
        }
        else {
            // Unsure how to handle division by zero error
            MStotal = 0.0
        }
        
        // Define f variables
        var Fratio: Double = 0.0
        var Fsubjects: Double? = 0.0
        
        // Calculate F-ratio
        if MSerror != 0.0 {
            Fratio = MStreatments / MSerror
        }
        else {
            Fratio = 0.0
        }
        
        // Calculate F-subjects
        if modelType == "within" {
            Fsubjects = MSsubjects / MSerror
        }
        else if modelType == "between" {
            Fsubjects = nil
        }
        
        // fProbability(DFnum: Double, DFden: Double, F: Double)
        // Calculate the probability
        let probability = fProbability(DFnum: Double(DFtreatments), DFden: Double(DFtotal), F: Fratio)
        
        // compile results into dictionary
        var results = [String: Double]()
        
        // store sums of squares
        results["SStotal"] = SStotal
        results["SStreatments"] = SStreatments
        results["SSerror"] = SSerror
        results["SSsubjects"] = SSsubjects
        
        // Store degrees of freedom
        results["DFtotal"] = Double(DFtotal)
        results["DFtreatments"] = Double(DFtreatments)
        results["DFerror"] = Double(DFerror)
        results["DFsubjects"] = Double(DFsubjects)
        
        // Store mean square
        results["MStotal"] = MStotal
        results["MStreatments"] = MStreatments
        results["MSerror"] = MSerror
        results["MSsubjects"] = MSsubjects
        
        // Store F values
        results["Fratio"] = Fratio
        results["Fsubjects"] = Fsubjects
        
        // Store probability
        results["probability"] = probability
        
        // Return dictionary of results
        return results
    }
    
}


