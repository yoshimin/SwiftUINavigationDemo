//
//  Tip.swift
//  ModalSheetDemo
//
//  Created by Yoshimi Shingai on 2020/10/09.
//

import Foundation

struct Tip: Identifiable {
    var id: String { title }
    
    let title: String
    let detail: String
}
