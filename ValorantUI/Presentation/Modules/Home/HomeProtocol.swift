//
//  HomeProtocol.swift
//  ValorantUI
//
//  Created by Eduard on 27/4/24.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var agents: [Agent] { get set }
    func getAgents()
}
