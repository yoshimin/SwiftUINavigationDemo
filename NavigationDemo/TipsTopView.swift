//
//  TipsTopView.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/07.
//

import SwiftUI

struct TipsTopView: View {
    let onClose: () -> Void
    
    @State private var isListPresented = false
    
    var body: some View {
        VStack {
            HeaderView(title: "Welcome", onClose: onClose)
            Image("idea")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            Button(action: {
                withAnimation {
                    isListPresented = true
                }
            }, label: {
                Color.clear
                    .overlay(
                        Text("Go")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                    .frame(height: 50)
                    .background(
                        Color("LightBlue")
                            .edgesIgnoringSafeArea(.bottom)
                    )
            })
        }
        .background(
            RoundedBackgroundView()
        )
        .sizeThatFit()
        .push(isPresented: $isListPresented) {
            TipsListView(onClose: onClose, isPresented: $isListPresented)
        }
    }
}
