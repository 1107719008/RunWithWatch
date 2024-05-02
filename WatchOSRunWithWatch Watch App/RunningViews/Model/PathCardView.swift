//
//  PathCardView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/22.
//

import SwiftUI

struct PathCardViewModel {
    let pathsName: String
    let pathImg: String
    let meter: Int
    let time: Int
}

struct PathCardView: View {
    let model: PathCardViewModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(model.pathImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                //.scaledToFit()
                .frame(width:175,height: 100)
                .cornerRadius(10)
                .clipped()
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(model.pathsName)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    Text("距離: \(model.meter) m")
                    Text("時間: \(model.time) mins")
                }
                .font(.subheadline)
                //.foregroundColor(.secondary)
            }
            .padding(10)
        }
        //.frame(height:125)
        //.background(Color.white)
        //.cornerRadius(30)
        .shadow(radius: 5)
        .padding(.vertical)
    }
}

#Preview {
    RouteHistoryView()
}
