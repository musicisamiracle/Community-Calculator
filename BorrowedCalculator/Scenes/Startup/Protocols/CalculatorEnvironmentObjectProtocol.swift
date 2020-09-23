//
//  CalculatorEnvironmentObjectProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

public protocol CalculatorEnvironmentObjectProtocol: class {
    func updateValue(_ value: String, isEnteringNumbers: Bool)
    func hasNewFinishedOperation(_ result: FinishedOperationResult)
}
