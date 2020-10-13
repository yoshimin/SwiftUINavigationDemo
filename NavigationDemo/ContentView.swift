//
//  ContentView.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/02.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Image("icon")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(50)
                        .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 30)
                    Text("ModalSheetDemo")
                        .font(.title)
                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.")
                        .font(.body)
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.center)

                    Button(action: {
                        toggleModal(isPresented: true)
                    }, label: {
                        Text("Present")
                            .foregroundColor(.white)
                            .frame(width: proxy.size.width * 0.8, height: 50)
                            .background(
                                Color("LightBlue")
                                    .cornerRadius(10)
                            )
                            .padding(.top, 30)
                    })
                    Spacer()
                }
                .modalSheet(isPresented: $isPresented) {
                    TipsTopView(onClose: { toggleModal(isPresented: false) })
                }
            }
        }
    }
    
    private func toggleModal(isPresented: Bool) {
        withAnimation {
            self.isPresented = isPresented
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
