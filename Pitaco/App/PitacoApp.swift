//
//  PitacoApp.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI
import FirebaseCore

@main
struct YourApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject private var firebase = FirebaseAuthService.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    firebase.addStateDidChangeListener()
                }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
