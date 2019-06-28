//
//  KeyWord.swift
//  HotKeyWord
//
//  Created by Thinh on 6/28/19.
//  Copyright © 2019 Thinh. All rights reserved.
//

import Foundation

struct Keywords: Codable {
    let keywords: [Keyword]
}

// MARK: - Keyword
struct Keyword: Codable {
    let keyword: String
    let icon: String
}
