//
//  TipView.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

struct TipView: View {
    var tip: Tip
    let onClose: () -> Void
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HeaderView(title: tip.title, onClose: onClose)
                .setBackButton(isPresented: $isPresented)
            Text(tip.detail)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
        }
        .background(
            RoundedBackgroundView()
        )
        .sizeThatFit()
    }
}

struct TipView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        TipView(tip: Tip(title: "Cicero", detail: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."), onClose: {}, isPresented: $isPresented)
            .previewLayout(.sizeThatFits)
    }
}
