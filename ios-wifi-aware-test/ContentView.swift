//
//  ContentView.swift
//  ios-wifi-aware-test
//
//  Created by Sigurd Ljødal on 07/07/2025.
//

import SwiftUI

struct ContentView: View {

    @State private var accessoryManager = AccessoryManager()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Show picker") {
                accessoryManager.showPicker()
            }
        }
        .padding()
        .task {
            await accessoryManager.activate()
        }
    }
}

#Preview {
    ContentView()
}
