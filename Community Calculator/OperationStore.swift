//
//  OperationStore.swift
//  Community Calculator
//
//  Created by Dane Thomas on 9/22/20.
//  Copyright © 2020 Dane Thomas. All rights reserved.
//

import Foundation
import Firebase
import BorrowedCalculator

class OperationStore {
    let database: DatabaseReference
    private var dbHandle: UInt?
    private let dateFormatter = ISO8601DateFormatter()
    
    init(database: DatabaseReference) {
        self.database = database
    }
    
    deinit {
        self.stopRetrievalOperations()
    }
    
    func save(_ operation: FinishedOperationResult) {
        var operationDict = operation.toDict()
        operationDict[OperationsResponseModel.Keys.timestamp] = String(Date().timeIntervalSince1970)
        self.database.child(OperationsResponseModel.Keys.operationsParent).childByAutoId().setValue(operationDict)
    }
    
    func retrieveOperations(onUpdated: @escaping ([OperationsResponseModel]) -> Void) {
        self.stopRetrievalOperations()
        self.dbHandle = self.database.observe(.value) { (snapshot) in
            let responseDict = snapshot.value as? [String: Any] ?? [:]
            let operations = responseDict[OperationsResponseModel.Keys.operationsParent] as? [String: Any] ?? [:]
            print(operations)
            let operationModels = operations.compactMap { (key, value) -> OperationsResponseModel? in
                guard let valuesDict = value as? [String: String],
                    let timestamp = valuesDict[OperationsResponseModel.Keys.timestamp],
                    let firstOperand = valuesDict[OperationsResponseModel.Keys.firstOperand],
                    let secondOperand = valuesDict[OperationsResponseModel.Keys.secondOperand],
                    let operation = valuesDict[OperationsResponseModel.Keys.operation],
                    let result = valuesDict[OperationsResponseModel.Keys.result] else { return nil }
                
                return OperationsResponseModel(id: key, timestamp: timestamp, firstOperand: firstOperand,
                                               secondOperand: secondOperand, operation: operation, result: result)
                
            }
            
            onUpdated(operationModels)
        }
    }
    
    func stopRetrievalOperations() {
        guard let handle = self.dbHandle else { return }
        self.database.removeObserver(withHandle: handle)
        self.dbHandle = nil
    }
}

extension FinishedOperationResult {
    func toDict() -> [String: Any] {
        return [OperationsResponseModel.Keys.firstOperand: String(self.firstOperand),
                OperationsResponseModel.Keys.secondOperand: String(self.secondOperand),
                OperationsResponseModel.Keys.operation: self.operation,
                OperationsResponseModel.Keys.result: String(self.result)]
    }
}
