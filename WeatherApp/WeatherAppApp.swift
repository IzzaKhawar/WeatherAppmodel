//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI


@main
struct WeatherAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
