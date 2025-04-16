//
//  AgentsResponseDTO.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

struct AgentsResponseDTO: Codable {
    var status: Int
    var data: [AgentDTO]
}

struct AgentResponseDTO: Codable {
    var status: Int
    var data: AgentDTO
}
