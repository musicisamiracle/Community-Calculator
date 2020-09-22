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
    var body: some View {
        CalculatorView().environmentObject(DependencyInjectionManager.createCalculatorEnvironmentObject())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
