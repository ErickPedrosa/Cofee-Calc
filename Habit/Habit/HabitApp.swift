//
//  HabitApp.swift
//  Habit
//
//  Created by Virginia Mota on 10/04/22.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
