//
//  FinishRunView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/29.
//

import SwiftUI

struct FinishRunView: View {
    //各項數據
//    @Binding var meters:Double
//    @Binding var usedTime:Int
    
    //for control finish page
    @Binding var isFinishViewActive: Bool
    @State private var navigateToTotalScore = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("是否要繼續運動？")
                Button("繼續"){
                    isFinishViewActive = false
                }
                Button("結束運動") {
                    //isFinishViewActive = false
                    navigateToTotalScore = true
                    
                }
                .background(
                    NavigationLink( destination: TotalScoreView(),
                                    isActive: $navigateToTotalScore,
                                    label: { EmptyView() }
                                    )
                   
                )
                
            }
        }
    }
}

#Preview {
   ContentView().environmentObject(LocationManager())
        .environmentObject(CoreDataStack())
}

