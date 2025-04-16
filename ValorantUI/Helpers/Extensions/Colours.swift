//
//  Colours.swift
//  ValorantUI
//
//  Created by Eduard on 29/4/24.
//

import Foundation
import SwiftUI

extension Color {
    init?(hex: String) {
            var formattedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics)
    
            var rgb: UInt64 = 0
            guard Scanner(string: hex).scanHexInt64(&rgb) else {
                return nil
            }
    
            let red = Double((rgb & 0xFF000000) >> 24) / 255.0
            let green = Double((rgb & 0x00FF0000) >> 16) / 255.0
            let blue = Double((rgb & 0x0000FF00) >> 8) / 255.0
    
            self.init(red: red, green: green, blue: blue)
        }
}
