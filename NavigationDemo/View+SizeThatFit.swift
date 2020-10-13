//
//  View+SizeThatFit.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

struct ContentSizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func sizeThatFit() -> some View {
        modifier(FittedContent())
    }
}

struct FittedContent: ViewModifier {
    @State private var contentSize: CGSize = .zero
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.white
                        .cornerRadius(radius: 15, corners: [.topLeft, .topRight])
                        .edgesIgnoringSafeArea(.bottom)
                        .preference(key: ContentSizePreferenceKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(ContentSizePreferenceKey.self) {
                contentSize = $0
            }
            .frame(height: contentSize.height)
    }
}
