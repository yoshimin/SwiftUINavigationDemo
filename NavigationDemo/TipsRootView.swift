//
//  TipsRootView.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/15.
//

import SwiftUI

extension View {
    func putIntoContainer() -> some View {
        modifier(ContainerView())
    }
}

struct ContainerView: ViewModifier {
    @State private var contentSize: CGSize = .zero
    
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Spacer()
                Color.white
                    .cornerRadius(radius: 15, corners: [.topLeft, .topRight])
                    .frame(width: contentSize.width, height: contentSize.height)
            }
            content
        }
        .onPreferenceChange(ContentSizePreferenceKey.self) { size in
            withAnimation {
                contentSize = size
            }
        }
    }
}
