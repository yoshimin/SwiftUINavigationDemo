//
//  View+Push.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

extension View {
    func push<Item, Destination: View>(
        isPresented: Binding<Bool>,
        item: Binding<Item>,
        view: @escaping (Item) -> Destination) -> some View {
        modifier(
            PushWithItem(
                isPresented: isPresented,
                item: item,
                view: view
            )
        )
    }
    func push<Destination: View>(
        isPresented: Binding<Bool>,
        view: @escaping () -> Destination) -> some View {
        modifier(
            Push(
                isPresented: isPresented,
                view: view
            )
        )
    }
}

struct Push<Destination>: ViewModifier where Destination: View {
    @Binding var isPresented: Bool
    
    var view: () -> Destination
    
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            Group {
                if isPresented {
                    view()
                        .transition(.pushIn)
                } else {
                    content
                        .transition(.pushOut)
                }
            }
        }
    }
}

struct PushWithItem<Item, Destination>: ViewModifier where Destination: View {
    @Binding var isPresented: Bool
    @Binding var item: Item
    
    var view: (Item) -> Destination
    
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            Group {
                if isPresented {
                    view(item)
                        .transition(.pushIn)
                } else {
                    content
                        .transition(.pushOut)
                }
            }
        }
    }
}
