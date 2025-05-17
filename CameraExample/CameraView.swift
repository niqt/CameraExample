//
//  CameraView.swift
//  CameraExample
//
//  Created by Nicola De Filippo on 16/05/25.
//

import SwiftUI

struct CameraView: View {
    @Binding var image: CGImage?
    @State var isPresented: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                NavigationStack {
                    ZStack {
                        Image(decorative: image, scale: 1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height)
                            .overlay(alignment: .top) {
                                Color.black
                                    .opacity(0.75)
                                    .frame(height: geometry.size.height * 0.15)
                            }
                            .overlay(alignment: .bottom) {
                                buttonsView()
                                    .frame(height: geometry.size.height * 0.15)
                                    .background(.black.opacity(0.75))
                            }
                        
                        }
                    }
            } else {
                ContentUnavailableView("Camera not available", systemImage: "camera.fill")
                                        .frame(width: geometry.size.width,
                           height: geometry.size.height)
            }
        }.fullScreenCover(isPresented: $isPresented) {
            PhotoPreview(image: image)
        }
    }
    
    private func buttonsView() -> some View {
        HStack(spacing: 50) {
            Spacer()
            Button {
                self.isPresented.toggle()
            } label: {
                Label {
                    Text("")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }.labelStyle(.iconOnly)
            Spacer()
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding()
    }
}

#Preview {
    CameraView(image: .constant(nil))
}
