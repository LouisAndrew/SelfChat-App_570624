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
        Text("Hello World")
            .onTapGesture {
                let str = "Test Message"
                let url = getDocumentsPath().appendingPathComponent("message.txt")

                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
        Text(textContent)
            .onTapGesture {
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
