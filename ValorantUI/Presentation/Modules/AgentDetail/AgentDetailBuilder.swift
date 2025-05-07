//
//  AgentDetailBuilder.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import Foundation

class AgentDetailBuilder {
    func build() -> AgentDetailView {
        let agentDataSource = AgentDataSource()
        let agentRepository = AgentRepository(agentDataSource: agentDataSource)
        let agentUseCase = AgentUseCase(repository: agentRepository)
        let viewModel = AgentDetailViewModel(agentUseCase: agentUseCase)
        let view = AgentDetailView(viewModel: viewModel)
        return view
    }
}
