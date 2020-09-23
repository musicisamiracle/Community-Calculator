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
    func hasNewFinishedOperation(_ result: FinishedOperationResult) {
        print(result)
    }
}
