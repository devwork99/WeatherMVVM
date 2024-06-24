//
//  WeatherVRApp.swift
//  WeatherVR
//
//  Created by Yasir on 24/06/2024.
//

import SwiftUI

@main
struct WeatherVRApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel())
        }
    }
}
