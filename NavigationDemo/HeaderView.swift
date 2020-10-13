//
//  HeaderView.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/07.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let onClose: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Button(action: {
                onClose()
            }, label: {
                Image("close")
            })
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
    }
}

extension HeaderView {
    func setBackButton(isPresented: Binding<Bool>) -> some View {
        modifier(NavigationBarBackButton(isPresented: isPresented))
    }
    
}

struct NavigationBarBackButton: ViewModifier {
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        HStack {
            Button(action: {
                withAnimation {
                    isPresented = false
                }
            }, label: { Image("back") })
                .padding(.top, 20)
                .padding(.leading, 16)
            content
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", onClose: {})
    }
}
