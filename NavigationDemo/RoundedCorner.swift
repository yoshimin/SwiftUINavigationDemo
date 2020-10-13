//
//  RoundedCorner.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

struct RoundedCorner: Shape {
    let radius: CGFloat
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath
        return Path(path)
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorner(radius: 20)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
