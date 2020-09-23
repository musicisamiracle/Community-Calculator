//
//  OperationsViewModel.swift
//  Community Calculator
//
//  Created by Dane Thomas on 9/22/20.
//  Copyright © 2020 Dane Thomas. All rights reserved.
//

import Foundation
import BorrowedCalculator

class OperationsViewModel: ObservableObject {
    @Published var operations: [String] = []
    
    private let operationStore: OperationStore
    
    init(operationStore: OperationStore) {
        self.operationStore = operationStore
        self.operationStore.retrieveOperations(onUpdated: self.onUpdatedOperations(_:))
    }
    
    deinit {
        self.operationStore.stopRetrievalOperations()
    }
    
    func onUpdatedOperations(_ operations: [OperationsResponseModel]) {
        // TODO: figure out what I am doing wrong with sorting in firebase
        let sortedOperations = operations.sorted { (op1, op2) -> Bool in
            return op1.timestamp < op2.timestamp
        }
        let operationStrings = sortedOperations.map { (op) -> String in
            return "\(op.firstOperand) \(op.operation) \(op.secondOperand) = \(op.result)"
        }
        self.operations = operationStrings
    }
}

extension OperationsViewModel: FinishedComputationDelegate {
    func hasNewFinishedOperation(_ result: FinishedOperationResult) {
        self.operationStore.save(result)
    }
}
