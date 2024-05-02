//
//  TotalScoreView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/5/1.
//

import SwiftUI

struct TotalScoreView: View {
    @State private var isSavedViewOpen = false
    
    //@Environment(\.dismiss) private var dismiss
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var totalMeters: Int
    @Binding var usedTime: Int
    @Binding var friendDis: Int
    
    var body: some View {
        NavigationView{
            ZStack{
                if !isSavedViewOpen{
                    VStack{
                        Text("已經完成此次運動").font(.title3).fontWeight(.bold)
                        Text("")
                        Text("總花費時間 \(usedTime) 秒")
                        
                        
                        Text("總距離 \(totalMeters) 公尺")
                        Text("超越朋友 \(friendDis) 公尺")
                        
                        Text("")
                        HStack{
                            Button("保存路徑"){
                                isSavedViewOpen = true
                                
                            }
                            
                            //                        NavigationLink(destination: HomeView()) {
                            //                            Text("返回主頁")
                            //
                            //                        }
                            Button("返回主頁"){
                                
                                
                            }
                        }
                        

                    }
                }else{
                    VStack{
                        Text("路徑儲存完畢").font(.title3).fontWeight(.bold).padding()
                        
                        Button("確認"){
                            isSavedViewOpen = false
                        }
                    }
                }
                
            }
        }
    }
}

//#Preview {
//    TotalScoreView()
//}
