//
//  CalculatorEnvironmentDelegate.swift
//  Community Calculator
//
//  Created by Dane Thomas on 9/22/20.
//  Copyright © 2020 Dane Thomas. All rights reserved.
//

import Foundation
import BorrowedCalculator

class CalculatorEnvironmentDelegate: FinishedComputationDelegate {
    
    private let operationStore: OperationStore
    
    init(operationStore: OperationStore) {
        self.operationStore = operationStore
    }
    
    func hasNewFinishedOperation(_ result: FinishedOperationResult) {
        print(result)
    }
}
