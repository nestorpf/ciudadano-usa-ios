//
//  CiudadanoApp.swift
//  Ciudadano
//
//  Created by Nestor Perez Fernandez  on 6/24/25.
//

import SwiftUI

@main
struct CiudadanoApp: App {
    var body: some Scene {
        WindowGroup {
            Group {
                if UserProfile.shared.hasCompletedOnboarding {
                    HomeView()
                } else {
                    OnboardingView()
                }
            }
            .preferredColorScheme(.light)
        }
    }
}
