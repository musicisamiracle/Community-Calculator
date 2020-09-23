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
    }
}

extension OperationsViewModel: FinishedComputationDelegate {
    func hasNewFinishedOperation(_ result: FinishedOperationResult) {
        print(result)
    }
}
