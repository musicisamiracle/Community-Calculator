//
//  DependencyInjectionManager.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/17/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

public struct DependencyInjectionManager {
    public static func createCalculatorConfiguration() -> CalculatorConfigurationProtocol {
        return CalculatorConfiguration()
    }
    
    public static func createCalculatorValidator() -> CalculatorOperationValidatorProtocol {
        let calculatorConfiguration = createCalculatorConfiguration()
        return CalculatorOperationValidator(calculatorDisplayMaxLimit: calculatorConfiguration.calculatorDisplayMaxLimit)
    }
    
    public static func createCalculatorTrimmer() -> CalculatorDisplayTrimmerProtocol {
        return CalculatorDisplayTrimmer()
    }
    
    public static func createCalculatorOperationHandler() -> CalculatorOperationHandlerProtocol {
        return CalculatorOperationHandler(calculatorValidator: createCalculatorValidator(),
                                         calculatorTrimmer: createCalculatorTrimmer())
    }
    
    public static func createCalculatorResultFormatter() -> CalculatorResultFormatterProtocol {
        return CalculatorResultFormatter(calculatorConfiguration: createCalculatorConfiguration())
    }
    
    public static func createCalculatorEnvironmentObject() -> CalculatorEnviromentObject {
        return CalculatorEnviromentObject(calculatorButtons: CalculatorBuilder.buildCalculatorOptions(),
                                          resultFormatter: self.createCalculatorResultFormatter(),
                                          calculatorOperationHandler: self.createCalculatorOperationHandler())
    }
}
