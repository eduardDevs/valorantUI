//
//  Abilities.swift
//  ValorantUI
//
//  Created by Eduard Gaya Calabuig on 2/4/25.
//

import Foundation

struct Abilities {
    var slot: String
    var displayName: String
    var description: String
    var displayIcon: String
    
    init(dto: AbilitiesDTO) {
        self.slot = dto.slot
        self.displayName = dto.displayName
        self.description = dto.description
        self.displayIcon = dto.displayIcon
    }
}
