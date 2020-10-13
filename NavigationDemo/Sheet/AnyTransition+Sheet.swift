//
//  AnyTransition+Sheet.swift
//  NavigationDemo
//
//  Created by Yoshimi Shingai on 2020/10/06.
//

import SwiftUI

extension AnyTransition {
    static var sheet: AnyTransition {
        get {
            modifier(
                active: SheetTransition(percentage: 0),
                identity: SheetTransition(percentage: 1)
            )
        }
    }
}
