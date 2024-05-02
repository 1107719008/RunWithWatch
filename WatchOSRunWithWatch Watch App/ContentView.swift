//
//  ContentView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/4.
//

import SwiftUI

struct ContentView: View {
    //location won't show in live preview, use simulator or device
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        NavigationView{
            HomeView()
        }
                
                
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
