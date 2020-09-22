//
//  PendingBinaryOperation.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

class PendingBinaryOperation {
    private let function: (Double, Double) -> Double
    private var accumulatedValue: Double
    private var operand: Double? = nil
    private var operationString = ""
    
    init(function: @escaping (Double, Double) -> Double, firstOperand: Double, operationString: String) {
        self.function = function
        self.accumulatedValue = firstOperand
        self.operationString = operationString
    }
    
    var hasOperand: Bool {
        return operand != nil
    }
    
    func setAccumulatedValue(_ value: Double) {
        self.accumulatedValue = value
    }
    
    func setOperand(_ secondOperand: Double) {
        self.operand = secondOperand
    }
    
    /**
    * We save the current accumulated value in order to handle recurrent operations when tapping the equal button
    * more than once.
    */
    func perform() -> Double {
        guard let operand = operand else { return 0 }
        let value = function(accumulatedValue, operand)
        accumulatedValue = value
        return value
    }
    
    func toString() -> String {
        guard let operand = operand else { return "" }
        return "\(self.accumulatedValue) \(self.operationString) \(operand)"
    }
}
