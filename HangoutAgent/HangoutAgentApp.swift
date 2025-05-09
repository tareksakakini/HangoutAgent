//
//  HangoutAgentApp.swift
//  HangoutAgent
//
//  Created by Tarek Sakakini on 4/21/25.
//

import SwiftUI

@main
struct HangoutAgentApp: App {
    var body: some Scene {
        @StateObject var vm = ViewModel()
        
        WindowGroup {
            LoginView()
                .environmentObject(vm)
        }
    }
}
