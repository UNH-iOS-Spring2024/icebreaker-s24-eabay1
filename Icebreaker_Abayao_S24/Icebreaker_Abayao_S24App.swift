//
//  Icebreaker_Abayao_S24App.swift
//  Icebreaker_Abayao_S24
//
//  Created by ea on 2/6/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreInternal

@main
struct Icebreaker_Abayao_S24App: App {
    init(){
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
