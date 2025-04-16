//
//  ValorantUIApp.swift
//  ValorantUI
//
//  Created by Eduard on 22/4/24.
//

import SwiftUI
import IQKeyboardManagerSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        return true
    }
}

@main
struct ValorantUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                HomeBuilder().build()
                AgentDetailBuilder().build()
            }
        }
    }
}
