//
//  AgentDetailView.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import SwiftUI

struct AgentDetailView: View {
    @StateObject var viewModel: AgentDetailViewModel
    @Environment(\.presentationMode) var presentation
    @State private var isTemplateMode = true
    @State private var rotationX: Double = 0.0
    @State private var rotationY: Double = 0.0
    @State private var lastDrag: CGSize = .zero
    
    var body: some View {
        agentView()
    }
    
    private func agentView() -> some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .top){
                    VStack {
                        AsyncImage(url: URL(string: viewModel.agent?.fullPortraitV2 ?? "")) { image in
                            image
                                .renderingMode(isTemplateMode ? .template : .original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1.5)) {
                                        isTemplateMode = false
                                    }
                                }
                                .rotation3DEffect(
                                    .degrees(rotationX),
                                    axis: (x: 1, y: 0, z: 0)
                                )
                                .rotation3DEffect(
                                    .degrees(rotationY),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let deltaX = value.translation.height - lastDrag.height
                                            let deltaY = value.translation.width - lastDrag.width
                                            rotationX += Double(deltaX / 2)
                                            rotationY += Double(deltaY / 2)
                                            lastDrag = value.translation
                                        }
                                        .onEnded { _ in
                                            lastDrag = .zero
                                            rotationX = 0.0
                                            rotationY = 0.0
                                        }
                                )
                        } placeholder: {
                        }
                        
                        VStack {
                            Text(viewModel.agent?.displayName ?? "")
                                .font(Font.custom("Teko-Bold", size: 45))
                                .foregroundStyle(Color.customWhite)

                            Text(viewModel.agent?.description ?? "")
                                .font(Font.custom("Teko-SemiBold", size: 16))
                                .foregroundStyle(Color.customWhite)
                            
                            abilitiesView()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black.opacity(0.3))
                        )

                    }
                    .ignoresSafeArea()
                    .onAppear {
                        viewModel.getAgent(this: "e370fa57-4757-3604-3648-499e1f642d3f")
                    }
                    Text(viewModel.agent?.displayName ?? "")
                        .font(Font.custom("Teko-Bold", size: 64))
                        .foregroundStyle(Color.customWhite)
                }
            }
        }
        .background(
            RadialGradient(
                gradient: Gradient(colors: viewModel.gradientColors),
                center: .center,
                startRadius: 5,
                endRadius: 1000
            )
        )
    }
    
    private func abilitiesView() -> some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible())]  // 2 columnas
        return LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.agent?.abilities ?? [], id: \.displayName) { ability in
                VStack {
                    AsyncImage(url: URL(string: ability.displayIcon)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                    }
                    Text(ability.displayName)
                        .font(Font.custom("Teko-SemiBold", size: 16))
                        .foregroundStyle(Color.customWhite)
                    
                    Text(ability.description)
                        .font(Font.custom("Teko-SemiBold", size: 16))
                        .foregroundStyle(Color.customWhite)
                }
            }
        }
        .padding()
    }

    #Preview {
        AgentDetailBuilder().build()
    }
}
