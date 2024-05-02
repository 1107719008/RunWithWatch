//
//  RouteUserSelfHistoryView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/29.
//

import SwiftUI

struct RouteUserSelfHistoryView: View {
    
    let pathsName = ["操場, 昨日", "陽光公園, 星期五", "景美河濱, 星期三"]
    let pathImg = ["pathSample","pathSample2","bg3"]
    let meter = [300,550,800]
    let time = [10,25,50]
    @State private var selectedPath: String?
    @State private var selectedOption: String?
    //@State private var selectedActivity: String? = "Running"
    var body: some View {
        List {
               ForEach(pathsName.indices, id: \.self) { index in
                   NavigationLink(
                       destination: StartRunView(),
                       tag: pathsName[index],
                       selection: $selectedPath
                   ) {
                       
                       
                       
                       VStack{
                           ZStack{
                               //加入PathCardardView
                               PathCardView(model: PathCardViewModel(pathsName: pathsName[index], pathImg: pathImg[index], meter: meter[index], time: time[index]))
                               HStack{
                                   if (pathsName[index] == "操場, 昨日"){
                                   ZStack{
                                       Capsule()
                                                  .fill(Color.blue) // 设置填充颜色
                                                  .frame(width: 60, height: 30) // 设置椭圆形的尺寸
                                       HStack{
                                           Image("crown")
                                               .resizable()
                                               .frame(width:20,height: 20)
                                          
                                               Text("+3")
                                           }
                                           
                                       }
                                   }else{
                                       ZStack{
                                       Capsule()
                                           .fill(Color.gray) // 设置填充颜色
                                           .frame(width: 60, height: 30) // 设置椭圆形的尺寸
                                       HStack{
                                           Image(systemName: "figure.run")
                                               //.resizable()
                                               .frame(width:20,height: 20)
                                           
                                           Text("+1")
                                       }
                                   }
                                   }
                                   
                                   
                                   
                               }.offset(x:65,y:-47)
                               
                               
                           }
                       }
                       .padding(0)
                       //.background(Color.white)
                       //.cornerRadius(10)
                       
                       
                       
                   }
               }
           }
           .listStyle(.plain)
        
    }
    
    
}

#Preview {
    RouteUserSelfHistoryView()
}
