//
//  ContentView.swift
//  MapApp
//
//  Created by OmarMattr on 06/10/2022.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
