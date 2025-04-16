//
//  AgentRepository.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

final class AgentRepository {
    let agentDataSource: AgentDataSourceProtocol
    
    init(agentDataSource: AgentDataSourceProtocol) {
        self.agentDataSource = agentDataSource
    }
}

extension AgentRepository: AgentRepositoryProtocol {
    func getAgents() async throws -> [Agent] {
        let agentsDTO = try await agentDataSource.getAgents()
        return agentsDTO.compactMap {$0.toDomain() }
    }
    
    func getAgent(this uuid: String) async throws -> Agent {
        let agentDTO = try await agentDataSource.getAgent(this: uuid)
        return agentDTO.toDomain()
    }
    
    
}
