//
//  ChooseFriendView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/22.
//

import SwiftUI

struct ChooseFriendView: View {
    let options = ["阿翰", "小明","小美","小華","大名"]
    let optionsImage = ["meVol","headIcon","wheadIcon","dog","headIcon"]
    @State private var selectedOption: String?
    //@State private var selectedActivity: String? = "Running"
    var body: some View {
        List {
            ForEach(options.indices, id: \.self) { index in
                            NavigationLink(
                                destination: RouteHistoryView(),
                                tag: options[index],
                                selection: $selectedOption
                            ) {
                                HStack {
                                    Image(optionsImage[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                    Text(options[index])
                                }
                }
            }
        }
        .listStyle(.elliptical)
    }

}

#Preview {
    ChooseFriendView()
        .environmentObject(LocationManager())
            .environmentObject(CoreDataStack())
}
