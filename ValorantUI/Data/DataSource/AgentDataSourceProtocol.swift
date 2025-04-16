//
//  AgentDataSourceProtocol.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

protocol AgentDataSourceProtocol {
    func getAgents() async throws -> [AgentDTO]
    func getAgent(this uuid: String) async throws -> AgentDTO
}
