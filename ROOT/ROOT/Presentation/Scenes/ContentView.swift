//
//  ContentView.swift
//  ROOT
//
//  Created by 원이 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .rootFont(.heading(.heading1))
            Text("Hello, world!")
                .rootFont(.heading(.heading2))
            Text("Hello, world!")
                .rootFont(.heading(.heading3))
            Text("Hello, world!")
                .rootFont(.heading(.heading4))
            Text("Hello, world!")
                .rootFont(.heading(.heading5))
            Text("Hello, world!")
                .rootFont(.heading(.heading6))
            Text("Hello, world!")
                .rootFont(.body(.body1))
            Text("Hello, world!")
                .rootFont(.body(.body2))
            Text("Hello, world!")
                .rootFont(.body(.body3))
            Text("Hello, world!")
                .rootFont(.body(.body4))
            Text("Hello, world!")
                .rootFont(.caption(.caption1))
            Text("Hello, world!")
                .rootFont(.caption(.caption2))
            Text("Hello, world!")
                .rootFont(.caption(.caption3))
            Text("Hello, world!")
                .rootFont(.caption(.caption4))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
