//
//  RoundedBackgroundView.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

struct RoundedBackgroundView: View {
    var body: some View {
        Color.white
            .cornerRadius(radius: 15, corners: [.topLeft, .topRight])
            .edgesIgnoringSafeArea(.bottom)
    }
}
