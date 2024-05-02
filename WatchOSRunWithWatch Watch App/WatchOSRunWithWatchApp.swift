//
//  WatchOSRunWithWatchApp.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/4.
//

import SwiftUI

@main
struct WatchOSRunWithWatch_Watch_AppApp: App {
    
    //for location
    //全域變數
    @StateObject var locationManager = LocationManager()
    
    //coredata 引入
    @StateObject private var dataController = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
                .environmentObject(dataController)
            
            
        }
    }
}
