//
//  RouteHistoryView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/7.
//
//
//此頁為歷史地圖選擇頁

import SwiftUI


struct RouteHistoryView: View {
    
    let pathsName = ["操場, 昨日", "陽光公園, 星期五", "景美河濱, 星期三"]
    let pathImg = ["pathSample","pathSample2","bg3"]
    let meter = [300,550,800]
    let time = [10,25,50]
    @State private var selectedPath: String?
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
                           //加入PathCardardView
                           PathCardView(model: PathCardViewModel(pathsName: pathsName[index], pathImg: pathImg[index], meter: meter[index], time: time[index]))
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
    RouteHistoryView()
}
