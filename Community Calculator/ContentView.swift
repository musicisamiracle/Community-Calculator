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
    
    var body: some View {
        CalculatorView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
