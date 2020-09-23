//
//  FinishedComputationDelegate.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Dane Thomas on 9/21/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

public protocol FinishedComputationDelegate: class {
    func hasNewFinishedOperation(_ result: FinishedOperationResult)
}
