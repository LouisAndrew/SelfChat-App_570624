//
//  ContentView.swift
//  SelfChat-App_570624
//
//  Created by Louis Andrew on 25.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textContent: String = "World Hello"
    
    var body: some View {
        SelectPartnerMenu()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
