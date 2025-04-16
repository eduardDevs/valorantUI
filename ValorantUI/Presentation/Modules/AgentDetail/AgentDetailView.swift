//
//  AgentDetailView.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import SwiftUI

struct AgentDetailView<VM>: View where VM: AgentDetailViewModelProtocol {
    @ObservedObject var viewModel: VM
    @Environment(\.presentationMode) var presentation
    @State private var isTemplateMode = true
    
    
    var body: some View {
        agentView()
//        abilitiesView()
    }
    
    private func agentView() -> some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: viewModel.agent?.background ?? "")) {
                    image in
                    image
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    
                }
                
                VStack {
                    Text(viewModel.agent?.displayName ?? "")
                        .font(Font.custom("Poppins-Black", size: 45))
                        .foregroundStyle(Color.customWhite)
                    
                    AsyncImage(url: URL(string: viewModel.agent?.fullPortraitV2 ?? "")) {
                        image in
                        image
                            .renderingMode(isTemplateMode ? .template : .original)  // Cambia el modo
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    isTemplateMode = false
                                }
                            }
                    } placeholder: {
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RadialGradient(gradient: Gradient(colors: viewModel.gradientColors), center: .center, startRadius: 5, endRadius: 1000)
            )
            .onAppear() {
                viewModel.getAgent(this: "e370fa57-4757-3604-3648-499e1f642d3f")
            }
        }
        .frame(width: 375, height: 418)
    }
    
//    private func abilitiesView() -> some View {
//        VStack {
//            ForEach(viewModel.agent?.abilities.enumerated()) { ability in
//                Text(ability.displayName)
//                Text(ability.description)
//                Text(ability.displayIcon)
//                Text(ability.slot)
//            }
//        }
//    }
}

#Preview {
    AgentDetailBuilder().build()
}
