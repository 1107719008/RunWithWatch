//
//  SwiftUIView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/7.
//

import SwiftUI

struct RaceCategoryView: View {
    let options = ["與朋友競賽", "與自己競賽","新競賽"]
    @State private var selectedOption: String?
    //@State private var selectedActivity: String? = "Running"
    var body: some View {
        List {
            ForEach(options, id: \.self) { option in
                //                Button(action: {
                //                    selectedOption = option
                //                }) {
                //                    Text(option)
                //                }
                NavigationLink(
                    destination: 
                        
                      
                            //ChooseFriendView()
                        destinationView(for: option)
                        
                            
                        ,
                    tag: option,
                    selection: $selectedOption
                ) {
                    Text(option)
                }
            }
        }
        .listStyle(.elliptical)
    }
}

func destinationView(for option: String) -> some View {
    switch option {
    case "與朋友競賽":
        return AnyView(ChooseFriendView())
    case "與自己競賽":
        return AnyView(RouteUserSelfHistoryView())
    case "新競賽":
        return AnyView(EmptyView())
    default:
        return AnyView(EmptyView()) // 默认情况下返回一个空视图
    }
}



#Preview {
    //RaceCategoryView(activity: "Running")
    ContentView()
}
