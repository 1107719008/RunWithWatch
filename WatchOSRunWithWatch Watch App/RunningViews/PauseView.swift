//
//  PauseView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/12.
//

import SwiftUI

struct PauseView: View {
    @State private var isPaused = false
       @State private var isStopped = false

       var body: some View {
           VStack {
               Spacer()
               
               HStack {
                   Spacer()
                   // 暂停按钮
                   Button(action: {
                       isPaused.toggle()
                   }) {
                       Image(systemName: isPaused ? "pause.fill" : "pause")
                           .foregroundColor(.blue)
                   }
                   .padding()
                   
                   // 重新开始按钮
                   Button(action: {
                       isPaused = false
                   }) {
                       Image(systemName: "play.fill")
                           .foregroundColor(.green)
                       
                   }
                   .padding()
                   
                   Spacer()
               }
               
               Spacer()
               
               HStack{
                   Spacer()
                   // 停止按钮
                   Button(action: {
                       isStopped = true
                   }) {
//                       Image(systemName: "stop.fill")
//                           .foregroundColor(.red)
                       Text("停止")
                           .fontWeight(.bold)
                           .foregroundColor(Color.red)
                   }
                   .padding()
                   
                   Spacer()
               }
           }
       }
    
    
}

#Preview {
    PauseView()
}
