//
//  ContentView.swift
//  CameraExample
//
//  Created by Nicola De Filippo on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    @State
    private var viewModel = ViewModel()
    
    var body: some View {
        CameraView(image: $viewModel.currentFrame)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
