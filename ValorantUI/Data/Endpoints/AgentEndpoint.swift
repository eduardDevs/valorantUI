//
//  AgentEndpoint.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

enum AgentEndpoint {
    case getAllAgents
    case getAgent(String)
    
    var endpoint: String {
        get {
            switch self {
            case .getAllAgents:
                return "https://valorant-api.com/v1/agents"
            case .getAgent(let uuid):
                return "https://valorant-api.com/v1/agents/\(uuid)"
            }
        }
    }
}
