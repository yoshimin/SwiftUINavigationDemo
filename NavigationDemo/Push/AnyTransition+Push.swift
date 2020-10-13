//
//  AnyTransition+Push.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import SwiftUI

extension AnyTransition {
    static var pushOut: AnyTransition {
        modifier(
            active: PopTransition(percentage: 0),
            identity: PopTransition(percentage: 1)
        )
    }
    
    static var pushIn: AnyTransition {
        modifier(
            active: PushTransition(percentage: 0),
            identity: PushTransition(percentage: 1)
        )
    }
}
