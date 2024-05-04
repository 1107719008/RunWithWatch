//
//  StartRunView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/12.
//

import SwiftUI

struct StartRunView: View {
    
    @State var isStartRecording: Bool = true
    
    var body: some View {
        
        ZStack{
            VStack{
                Image("pathSample")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175.0, height: 120.0)
                    .cornerRadius(10)
                    .opacity(0.5)
                
            }
            
            
            
            VStack(alignment: .leading){
                Text("跑步")
                Text("操場, 昨日")
                HStack{
                    Text("總距離")
                    Text("300")
                    Text("m")
                }
                HStack{
                    Text("總時間")
                    Text("10")
                    Text("min")
                }
                
                
            }
            
            
        }
        VStack{
            
            NavigationLink(destination: MapView(isRecording: $isStartRecording)){
                //start btn
//                Button(action: {
//                    //logic here
//                    print("Button tapped!")
//                    
//                    
//                }) {
//                     //按钮文本
                Text("開始")
//                        .foregroundColor(.white) // 文本颜色
//                        //.cornerRadius(30)
//                    
//                    
//                }
//                //.padding(.top, 10)
//                .buttonStyle(PlainButtonStyle()) //移除默認樣式
                
                
                
                
            }.background(Color(.clear))
            
        }
    
    }
    
    
    
}

#Preview {
    //StartRunView()
    ContentView().environmentObject(LocationManager())
        .environmentObject(CoreDataStack())
}
