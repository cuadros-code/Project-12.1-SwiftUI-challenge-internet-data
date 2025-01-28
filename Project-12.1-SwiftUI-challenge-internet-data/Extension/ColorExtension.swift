//
//  ColorExtension.swift
//  Project-12.1-SwiftUI-challenge-internet-data
//
//  Created by Kevin Cuadros on 28/01/25.
//

import Foundation
import SwiftUI

extension Color {
    public static var random: Color{
        let colors = [
            Color.blue,
            Color.yellow,
            Color.accentColor,
            Color.purple,
            Color.indigo,
            Color.red,
            Color.brown
        ]
        return colors.randomElement() ?? Color.teal
    }
}
