//
//  Tipkit_demoApp.swift
//  Tipkit_demo
//
//  Created by vignesh kumar c on 04/10/23.
//

import SwiftUI
import TipKit

@main
struct Tipkit_demoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try await Tips.configure([
                            .displayFrequency(.immediate),
                            .datastoreLocation(.applicationDefault)
                        ])
                    } catch {
                       print(error.localizedDescription)
                    }
                }
        }
    }
}
