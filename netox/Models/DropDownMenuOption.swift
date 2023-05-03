//
//  DropDownMenuOption.swift
//  netox
//
//  Created by Linda BELHADJ  on 3/5/2023.
//

import Foundation

// We are going to use this type with ForEach, so we need to conform it to
// Hashable protocol.
struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let testSingleMonth: DropdownMenuOption = DropdownMenuOption(option: "Yes")
    static let testAllMonths: [DropdownMenuOption] = [
        DropdownMenuOption(option: "Yes"),
        DropdownMenuOption(option: "No"),
        DropdownMenuOption(option: "Maybe")
    ]
}
