//
//  AgentUseCase.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

protocol AgentUseCaseProtocol {
    func getAgents() async throws -> [Agent]
    func getAgent(this uuid: String) async throws -> Agent
}

final class AgentUseCase {
    let repository: AgentRepositoryProtocol
    
    init(repository: AgentRepositoryProtocol) {
        self.repository = repository
    }
}

extension AgentUseCase: AgentUseCaseProtocol {
    func getAgents() async throws -> [Agent] {
        do {
            return try await repository.getAgents()
        } catch {
            throw error
        }
    }
    
    func getAgent(this uuid: String) async throws -> Agent {
        do {
            return try await repository.getAgent(this: uuid)
        } catch {
            throw error
        }
    }
    
    
}
