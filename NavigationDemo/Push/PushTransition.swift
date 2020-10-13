//
//  PushTransition.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

struct PushTransition {
    var percentage: CGFloat
}

extension PushTransition: GeometryEffect {
    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let parcentage = percentage
        let tx = size.width*(1-parcentage)
        return ProjectionTransform(
            CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: tx, ty: 0)
        )
    }
}

struct PopTransition {
    var percentage: CGFloat
}

extension PopTransition: GeometryEffect {
    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let parcentage = percentage
        let tx = size.width*(1-parcentage) * -1
        return ProjectionTransform(
            CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: tx, ty: 0)
        )
    }
}
