//
//  TipsListView.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/07.
//

import SwiftUI

struct TipsListView: View {
    let onClose: () -> Void
    @Binding var isPresented: Bool
    
    @State private var filter: String = ""
    @State private var isDetailPresented = false {
        didSet {
            guard !isDetailPresented else { return }
            selected = nil
        }
    }
    @State private var selected: Tip? {
        didSet {
            guard let _ = selected else { return }
            isDetailPresented = true
        }
    }
    
    private let list = [
        Tip(title: "Cicero", detail: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."),
        Tip(title: "Li Europan lingues ", detail: "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular."),
        Tip(title: "Far far away", detail: "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts."),
        Tip(title: "Werther", detail: "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.")
    ]
    private var visibleList: [Tip] {
        if filter.isEmpty { return list }
        return list.filter{ $0.title.hasPrefix(filter) }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView(title: "Tips", onClose: onClose)
                    .setBackButton(isPresented: $isPresented)
                HStack {
                    TextField("keyword", text: $filter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    if !filter.isEmpty {
                        Button(action: {
                            filter = ""
                        }, label: {
                            Text("Cancel")
                        })
                    }
                }
                .padding()
                ForEach(visibleList) { tip in
                    TipsRow(tip: tip)
                        .onTapGesture {
                            withAnimation {
                                selected = tip
                            }
                        }
                }
            }
        }
        .background(
            RoundedBackgroundView()
        )
        .frame(height: UIScreen.main.bounds.height/2)
        .push(isPresented: $isDetailPresented, item: $selected) {
            TipView(tip: $0!,
                    onClose: onClose,
                    isPresented: $isDetailPresented)
        }
    }
}

private struct TipsRow: View {
    let tip: Tip
    var body: some View {
        Color.white
            .overlay(
                HStack {
                    Text(tip.title)
                    Spacer()
                    Image("arrow")
                }
                .padding(.horizontal)
            )
            .frame(height: 60)
            
    }
}

struct TipsListView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        TipsListView(onClose: {}, isPresented: $isPresented)
            .previewLayout(.sizeThatFits)
    }
}
