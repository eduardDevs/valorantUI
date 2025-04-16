//
//  AgentRepositoryProtocol.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

protocol AgentRepositoryProtocol {
    func getAgents() async throws -> [Agent] 
    func getAgent(this uuid: String) async throws -> Agent
}

