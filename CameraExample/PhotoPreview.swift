//
//  PhotoPreview.swift
//  CameraExample
//
//  Created by Nicola De Filippo on 16/05/25.
//

import SwiftUI

struct PhotoPreview: View {
    @Environment(\.dismiss) private var dismiss
    @State var image: CGImage?
    var body: some View {
        GeometryReader { geometry in
            Image(decorative: image!, scale: 1)
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width)
                .overlay(alignment: .top) {
                    ZStack {
                        Color.black
                            .opacity(0.75)
                            .frame(height: 40)
                        HStack {
                            Button("Close", systemImage: "xmark.circle.fill", action: { dismiss() })
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                                .padding(.leading)
                            Spacer()
                            Button("Send", systemImage: "paperplane.fill", action: {})
                                .foregroundStyle(.white)
                                .labelStyle(.iconOnly)
                                .padding(.trailing)
                        }
                    }
                }
        }
    }
}

#Preview {
    PhotoPreview()
}
