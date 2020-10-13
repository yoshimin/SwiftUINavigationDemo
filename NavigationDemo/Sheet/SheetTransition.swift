//
//  SheetTransition.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/06.
//

import SwiftUI

struct SheetTransition {
    var percentage: CGFloat
}

extension SheetTransition: GeometryEffect {
    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let parcentage = percentage
        let ty = size.height*(1-parcentage)
        return ProjectionTransform(
            CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: ty)
        )
    }
}
