//
//  ContentView.swift
//  Community Calculator
//
//  Created by Dane Thomas on 9/22/20.
//  Copyright © 2020 Dane Thomas. All rights reserved.
//

import SwiftUI
import BorrowedCalculator

struct ContentView: View {
    @EnvironmentObject var env: CalculatorEnviromentObject
    @ObservedObject var viewModel: OperationsViewModel
    
    var body: some View {
        VStack {
            CalculatorView()
            List(viewModel.operations, id: \.self) { operation in
                Text(operation)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
