//
//  CalculatorEnviromentObject.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/11/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation
import Combine

public class CalculatorEnviromentObject: ObservableObject, CalculatorEnvironmentObjectProtocol {

    @Published var formattedCalculatorDisplay: String = "0"
    
    let calculatorButtons: [[CalculatorOptionProtocol]]
    private let resultFormatter: CalculatorResultFormatterProtocol
    private var calculatorOperationHandler: CalculatorOperationHandlerProtocol
    private var finishedComputationDelegate: FinishedComputationDelegate?
    
    // MARK: - Initializers
    
    public init(calculatorButtons: [[CalculatorOptionProtocol]],
         resultFormatter: CalculatorResultFormatterProtocol,
         calculatorOperationHandler: CalculatorOperationHandlerProtocol,
         finishedComputationDelegate: FinishedComputationDelegate? = nil) {
        self.calculatorButtons = calculatorButtons
        self.resultFormatter = resultFormatter
        self.calculatorOperationHandler = calculatorOperationHandler
        self.calculatorOperationHandler.delegate = self
        self.finishedComputationDelegate = finishedComputationDelegate
    }
    
    // MARK: - Public
    
    func handleCalculatorOption(_ calculatorOption: CalculatorOptionProtocol) {
        calculatorOperationHandler.handleCalculatorOption(calculatorOption)
    }
    
    // MARK: - CalculatorEnvironmentObjectProtocol
    
    public func updateValue(_ value: String, isEnteringNumbers: Bool) {
        if isEnteringNumbers {
            guard let formattedResult = resultFormatter.formatEnteredNumber(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        } else {
            guard let formattedResult = resultFormatter.formatResult(from: value) else { return }
            formattedCalculatorDisplay = formattedResult
        }
    }
    
    public func hasNewFinishedOperation(_ result: FinishedOperationResult) {
        self.finishedComputationDelegate?.hasNewFinishedOperation(result)
    }
}
