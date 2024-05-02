//
//  CardModel.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/16.
//

import Foundation
import SwiftUI

struct CardView: View {
    //let title: String
    let description: String
    @Binding var friendDistance: Int //與朋友差幾公尺
    @Binding var timeCount: Int
    @Binding var meterLeft: Int
    let cornerRadius: CGFloat
    let frameSize: CGSize
    @Binding var isReachedFriend: Bool
    
    var body: some View {
        VStack (alignment: .leading){
                
//            Text(description)
//                .font(.body)
//                .foregroundColor(.white)
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
             
            HStack{
                Text(String(timeCount) + "秒")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                
                Text(String(meterLeft)+"公尺")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            }
            
            HStack{
                Image("headIcon").resizable()
                    .frame(width: 25,height: 25)
                
                if isReachedFriend{
                    Text("+ " + String(friendDistance) + "公尺")
                        .font(.body)
                        .foregroundColor(.green)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                else
                {
                    Text(" " + String(friendDistance) + "公尺")
                        .font(.body)
                        .foregroundColor(.orange)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            
            }
            
        
           
            
            
        }
        .frame(width: frameSize.width, height: frameSize.height)
        //.background(Color.black)
        .cornerRadius(cornerRadius)
//        .overlay(
//                RoundedRectangle(cornerRadius: cornerRadius)
//                        .stroke(Color.white, lineWidth: 1) // 边框
//                )
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .blur(radius: 5) // 模糊效果
                        .opacity(0.3)
                )
        .shadow(radius: 3)
    }
}

