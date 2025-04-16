//
//  HomeView.swift
//  ValorantUI
//
//  Created by Eduard on 27/4/24.
//

import SwiftUI

struct HomeView<VM>: View where VM: HomeViewModelProtocol {
  @ObservedObject var viewModel: VM
  @Environment(\.presentationMode) var presentation

  var body: some View {
    VStack {
      VStack {
        Text("Valorant")
          .font(Font.custom("ValorantFont", size: 64))
          .foregroundStyle(.white)
      }
      VStack{
        ScrollView(showsIndicators: false){
          AgentCustomView()
            .padding(.all, 16)
        }.onAppear() {
          viewModel.getAgents()
        }
        .background(.clear)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.all, 5)
    .background {
      LinearGradient(colors: [.customBlack, .customRed], startPoint: .top, endPoint: .bottom)
//      RadialGradient(gradient: Gradient(colors: [.lima, .purple, .orange, .green]), center: .center, startRadius: 5, endRadius: 1000)
//      AngularGradient(gradient: Gradient(colors: [.customRed, .customBlack]), center: .center)
//      RadialGradient(gradient: Gradient(colors: [.customWhite, .customBlack, .customRed]), center: .center, startRadius: 1, endRadius: 400)
    }.onAppear() {
      viewModel.getAgents()
    }
  }
}

#Preview {
  HomeBuilder().build()
}
