//
//  Agent.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

struct Agent {
    var uuid: String
    var displayName: String
    var description: String
    var developerName: String
    var displayIcon: String
    var displayIconSmall: String
    var bustPortrait: String
    var fullPortrait: String
    var fullPortraitV2: String
    var killfeedPortrait: String
    var background: String
    var backgroundGradientColors: [String]
//    var assetPath: String
    var role: Role?
    var abilities: [Abilities]
//    var voiceLine:
    
    init(dto: AgentDTO) {
        self.uuid = dto.uuid
        self.displayName = dto.displayName
        self.description = dto.description
        self.developerName = dto.developerName
        self.displayIcon = dto.displayIcon
        self.displayIconSmall = dto.displayIconSmall
        self.bustPortrait = dto.bustPortrait ?? ""
        self.fullPortrait = dto.fullPortrait ?? ""
        self.fullPortraitV2 = dto.fullPortraitV2 ?? ""
        self.killfeedPortrait = dto.killfeedPortrait
        self.background = dto.background ?? ""
        self.backgroundGradientColors = dto.backgroundGradientColors
    //    var assetPath: String
        self.role = dto.role.map { Role(dto: $0) }
        self.abilities = dto.abilities.compactMap { Abilities(dto: $0) }
    //    var voiceLine:
    }
}
