//
//  AgentDetailViewModel.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import Foundation
import SwiftUI

class AgentDetailViewModel: ObservableObject, AgentDetailViewModelProtocol {
    @Published var agent: Agent?
    @Published var gradientColors: [Color] = []
    private let agentUseCase: AgentUseCaseProtocol
    
    init(agentUseCase: AgentUseCaseProtocol) {
        self.agentUseCase = agentUseCase
    }
    
    func getAgent(this uuid: String) {
        Task {
            do {
                let agent = try await agentUseCase.getAgent(this: uuid)
                DispatchQueue.main.sync {
                    self.agent = agent
                    self.getGradientColors()
                }
                print(agent)
            } catch {
                print(error)
            }
        }
    }
    
    func getGradientColors(){
        gradientColors = []
        agent?.backgroundGradientColors.forEach({ color in
            gradientColors.append(Color(hex: color) ?? .black)
            print("El color de back:",color)
            gradientColors.forEach { color in
                print("El color de front:",color)
            }
        })
        print(gradientColors)
    }
}


