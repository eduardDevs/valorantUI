//
//  HomeBuilder.swift
//  ValorantUI
//
//  Created by Eduard on 27/4/24.
//

import Foundation

class HomeBuilder {
    func build() -> HomeView {
        let agentDataSource = AgentDataSource()
        let agentRepository = AgentRepository(agentDataSource: agentDataSource)
        let agentUseCase = AgentUseCase(repository: agentRepository)
        let viewModel = HomeViewModel(agentUseCase: agentUseCase)
        let view = HomeView(viewModel: viewModel)
        return view
    }
}
