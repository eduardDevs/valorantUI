//
//  HomeViewModel.swift
//  ValorantUI
//
//  Created by Eduard on 27/4/24.
//

import Foundation

class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    @Published var agents: [Agent] = []
    private let agentUseCase: AgentUseCaseProtocol
    
    init(agentUseCase: AgentUseCaseProtocol) {
        self.agentUseCase = agentUseCase
    }
    
    func getAgents() {
        Task {
            do {
                agents = try await agentUseCase.getAgents()
                print("\(agents)")
            } catch {
                print(error)
            }
        }
    }
    
}
