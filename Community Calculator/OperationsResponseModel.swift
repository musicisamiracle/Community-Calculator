//
//  OperationsResponse.swift
//  Community Calculator
//
//  Created by Dane Thomas on 9/22/20.
//  Copyright © 2020 Dane Thomas. All rights reserved.
//

import Foundation

struct OperationsResponseModel {
    struct Keys {
        static let operationsParent = "operations"
        
        static let timestamp = "timestamp"
        static let firstOperand = "firstOperand"
        static let secondOperand = "secondOperand"
        static let operation = "operation"
        static let result = "result"
    }
    
    let id: String
    let timestamp: String
    let firstOperand: String
    let secondOperand: String
    let operation: String
    let result: String
}
