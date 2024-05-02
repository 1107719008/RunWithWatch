//
//  HomeView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/7.
//

import SwiftUI

struct HomeView: View {
    
    let options = ["跑步", "散步"]
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
                                            destination: RaceCategoryView(),
                                            tag: option,
                                            selection: $selectedOption
                                        ) {
                                            if option=="跑步"{
                                                Image(systemName: "figure.run")
                                            }else{
                                                Image(systemName: "figure.walk")
                                            }
                                            
                                            Text(option)
                                        }.navigationBarBackButtonHidden(true)
            }
        }
        .listStyle(.elliptical)
        
        //        VStack {
        //                    Text("選擇項目：")
        //                    Button(action: {
        //                        selectedActivity = "Running"
        //                    }) {
        //                        Text("跑步")
        //                    }
        //                    Button(action: {
        //                        selectedActivity = "Walking"
        //                    }) {
        //                        Text("散步")
        //                    }
        //            NavigationLink(destination: RaceCategoryView(activity: selectedActivity)) {
        //                        Text("跑步")
        //                //RaceCategoryView(activity: selectedActivity)
        //                    }
        //                }
        //                .navigationTitle("Activity")
        //            }
        
    }
}


#Preview {
    HomeView()
}
