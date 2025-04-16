//
//  AgentCustomView.swift
//  ValorantUI
//
//  Created by Eduard on 27/4/24.
//

import SwiftUI

struct AgentCustomView: View {
    var body: some View {
        HStack(spacing: 16) {
            Rectangle()
                .background(.red)
                .frame(width: 100,height: 100)
            VStack() {
                Text("Nombre")
                Text("Apellidos")
            }
        }
        .frame(maxHeight: 100)
        .background(.blue)
    }
}

#Preview {
    AgentCustomView()
}
