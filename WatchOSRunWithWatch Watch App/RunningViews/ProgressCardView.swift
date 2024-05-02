//
//  ProgressCardView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/16.
//

import SwiftUI

struct ProgressCardView: View {
 
    var body: some View {
        ZStack{
            Rectangle().frame(width: 200.0, height: 300.0).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
            VStack{
//                CardView(
//                    description: "This is a sample",
//                    friendDistance: 2,
//                    timeLeft:10,
//                    meterLeft: 10,
//                    cornerRadius: 10, frameSize: CGSize(width: 220, height:105))
//                .offset(y:65)
                Text("tester")
            }
            
        }
        
    }
}

#Preview {
    ProgressCardView()
}
