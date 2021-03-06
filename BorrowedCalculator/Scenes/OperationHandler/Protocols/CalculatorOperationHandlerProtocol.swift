//
//  CalculatorOperationHandlerProtocol.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import SwiftUI

public protocol CalculatorOperationHandlerProtocol {
    var isEnteringNumbers: Bool { get set }
    var calculatorDisplay: String { get set }
    
    var delegate: CalculatorEnvironmentObjectProtocol? { get set }
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol)
}
