//
//  View+Sheet.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/06.
//

import SwiftUI

extension View {
    func modalSheet<Destination: View>(
        isPresented: Binding<Bool>,
        view: @escaping () -> Destination
    ) -> some View {
        modifier(ModalSheet(isPresented: isPresented, view: view))
    }
}

struct ModalSheet<Destination>: ViewModifier where Destination: View {
    @Binding var isPresented: Bool

    var view: () -> Destination

    func body(content: Content) -> some View {
        ZStack {
            content
            background()
            modalSheet()
        }
    }

    private func background() -> some View {
        Color.black
            .opacity(isPresented ? 0.2 : 0)
            .ignoresSafeArea()
            .onTapGesture{
                withAnimation {
                    isPresented = false
                }
            }
    }

    private func modalSheet() -> some View {
        Group {
            if isPresented {
                view()
                    .transition(.sheet)
            } else {
                EmptyView()
            }
        }
    }
}
