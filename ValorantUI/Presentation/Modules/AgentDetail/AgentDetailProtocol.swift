//
//  AgentDetailProtocols.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import Foundation
import SwiftUI

protocol AgentDetailViewModelProtocol: ObservableObject {
    var agent: Agent? { get set }
    var gradientColors: [Color] { get set }
    func getAgent(this uuid: String)
    func getGradientColors()
}
