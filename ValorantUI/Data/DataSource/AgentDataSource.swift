//
//  AgentDataSource.swift
//  ValorantUI
//
//  Created by Eduard on 26/4/24.
//

import Foundation

enum AgentDataSourceError: Error {
    case badUrl
    case badResponse
    case decodeError
    case badRequest
    case invalidResponse
}

class AgentDataSource: AgentDataSourceProtocol {
    func getAgents() async throws -> [AgentDTO] {
        guard let url = URL(string: AgentEndpoint.getAllAgents.endpoint) else {
            throw AgentDataSourceError.badUrl
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw AgentDataSourceError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    let agentsResponseDTO = try decoder.decode(AgentsResponseDTO.self, from: data)
                    return agentsResponseDTO.data
                } else {
                    throw AgentDataSourceError.badRequest
                }
            } catch {
                throw AgentDataSourceError.decodeError
            }
        } catch {
            throw AgentDataSourceError.badRequest
        }
    }
    
    func getAgent(this uuid: String) async throws -> AgentDTO {
        guard let url = URL(string: AgentEndpoint.getAgent(uuid).endpoint) else {
            throw AgentDataSourceError.badUrl
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw AgentDataSourceError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    let agentResponseDTO = try decoder.decode(AgentResponseDTO.self, from: data)
                    return agentResponseDTO.data
                } else {
                    throw AgentDataSourceError.badRequest
                }
            } catch {
                throw AgentDataSourceError.decodeError
            }
        } catch {
            throw AgentDataSourceError.badRequest
        }
    }
}
