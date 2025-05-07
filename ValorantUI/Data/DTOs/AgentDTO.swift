//
//  AgentDTO.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

struct AgentDTO: Codable {
    var uuid: String
    var displayName: String
    var description: String
    var developerName: String
//    var developerName:
    var displayIcon: String
    var displayIconSmall: String
    var bustPortrait: String?
    var fullPortrait: String?
    var fullPortraitV2: String?
    var killfeedPortrait: String
    var background: String?
    var backgroundGradientColors: [String]
//    var assetPath: String
//    var isFullPortraitRightFacing: Bool
//    var isPlayableCharacter: Bool
//    var isAvailableForTest: Bool
//    var isBaseContent: Bool
    var role: RoleDTO?
//    var recruitmentData:
    var abilities: [AbilitiesDTO]
//    var voiceLine:
}

internal extension AgentDTO {
    func toDomain() -> Agent {
        Agent(dto: self)
    }
}
