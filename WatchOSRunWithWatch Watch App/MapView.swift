//
//  MapView.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/10.
//

import SwiftUI

import MapKit
import CoreLocation

import AVFoundation
import WatchKit


struct MapAnnotationItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    //秒數
    let timestamp: Int
    
    init(coordinate: CLLocationCoordinate2D, timestamp: Int) {
        self.coordinate = coordinate
        self.timestamp = timestamp
    }
    
}


extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct MapView: View {
    
    @EnvironmentObject var coreDataPath: CoreDataStack
    
    @Binding var isRecording: Bool
    
    //declare variable
    @EnvironmentObject var locationManager: LocationManager
    
    @State private var region = MKCoordinateRegion(
        //sf
//        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
//        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        //apple park
        center: CLLocationCoordinate2D(latitude: 37.334803, longitude: -122.008965),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
    )
    
    
    
    //自定義類別
    @State private var pathCoordinates: [MapAnnotationItem] = []
    
    //@State private var virtualPathCoordinates: [CLLocationCoordinate2D] = []

    //虛擬預設座標 - 虛擬的路徑
    let virtualPathCoordinates: [CLLocationCoordinate2D] = [
//        sf
//        CLLocationCoordinate2D(latitude: 37.77515, longitude: -122.419443),
//        CLLocationCoordinate2D(latitude: 37.774315, longitude: -122.420788),
//        CLLocationCoordinate2D(latitude: 37.775237, longitude: -122.420983),
//        CLLocationCoordinate2D(latitude: 37.775426, longitude: -122.419459),
//        CLLocationCoordinate2D(latitude: 37.77515, longitude: -122.419443)
            //apple park
            // Steve Jobs theatre
            CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495),
            // Caffè Macs
            CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),
            // Apple wellness center
            CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
        ]
    
//    let oldPathCoordinates: [MapAnnotationItem] = [
//        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.330828, longitude: -122.007495)),
//        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356)),
//        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.336901, longitude: -122.012345))
//    ]
  
    
    //操場
    let oldPathCoordinates: [MapAnnotationItem] = [
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023150206414901, longitude: 121.544275915479005),timestamp: 1),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022781330367899, longitude: 121.544254581450005),timestamp: 3),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.0226815440862, longitude: 121.544282355337003),timestamp: 5),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.0226165875101, longitude: 121.544341498330994),timestamp: 7),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022555592587398, longitude: 121.544425230456),timestamp: 9),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022530229207401, longitude: 121.544519940948007),timestamp: 13),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.02253398217, longitude: 121.544634772953998),timestamp: 17),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022581216736501, longitude: 121.544732259328995),timestamp: 20),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022654423092199, longitude: 121.544815391444999),timestamp: 23),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.022762637350102, longitude: 121.544858717053003),timestamp: 26),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023166544811598, longitude: 121.544881311725007),timestamp: 29),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023319476325401, longitude: 121.544887718544004),timestamp: 31),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.0233654253955, longitude: 121.544877540204993),timestamp: 33),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023414898535201, longitude: 121.544852618014005),timestamp: 36),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023451806598398, longitude: 121.544833505108002),timestamp: 39),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023478220030601, longitude: 121.544799637763006),timestamp: 43),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023511364960001, longitude: 121.544760619648002),timestamp: 46),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023540646563301, longitude: 121.544705440488002),timestamp: 50),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023557063392701, longitude: 121.544619840910002),timestamp: 54),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023555575784499, longitude: 121.544519538808004),timestamp: 57),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023513803536201, longitude: 121.544425850110997),timestamp: 61),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.0234551462475, longitude: 121.544350862528006),timestamp: 62),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.0233882931945, longitude: 121.544302913414),timestamp: 65),
        MapAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 25.023150206414901, longitude: 121.544275915479005),timestamp: 67)
    ]
    //計算距離用
    @State private var pathCoordinatesUser: [MapAnnotationItem] = []
    
    //timer state var
    @State public var counter = 0
    //每秒
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //毫秒
    //let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
    
    //relate pos
    @State public var friendDis: Int = 0
    @State public var meterRun: Int = 0
    
    //計算當前的距離
    //歷史距離
    @State private var totalHistoryDistance:Double = 0.0
    //用戶距離
    @State private var totalUserDistance:Double = 0.0
    
    @State private var isReachedFriendMeter:Bool = false
    
    //finsih toggle
    @State private var isFinishViewActive = false
    
    //speak 文字
    private let speechSynthesizer = AVSpeechSynthesizer()
    @State private var isCatchOnFriend: Bool = false
    @State private var hasSpeak:Bool = false
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                
                
                //map
                VStack{
                    
                    Map(
                        coordinateRegion: $region, showsUserLocation: true,
                        userTrackingMode: .constant(.follow),
                        annotationItems: pathCoordinates
                        
                    )
                    { item in
                        
                        MapAnnotation(coordinate: item.coordinate){
                            if item.timestamp >= counter{
                                Circle()
                                //.fill(Color.blue)
                                    .fill(oldPathCoordinates.contains(where: { $0.coordinate == item.coordinate }) ? Color.gray : Color.green)
                                    .frame(width: 8,height: 8)
                                
                            }else{
                                Circle()
                                //.fill(Color.blue)
                                    .fill(oldPathCoordinates.contains(where: { $0.coordinate == item.coordinate }) ? Color.teal : Color.green)
                                    .frame(width: 8,height: 8)
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    .onReceive(locationManager.$location){ newLocation in
                        if isRecording, let location = newLocation{
                            let newItem = MapAnnotationItem(coordinate: location.coordinate,timestamp: counter) // 创建新的 MapAnnotationItem 对象
                            pathCoordinates.append(newItem)
                            
                            print("Received new location: \(String(describing: newLocation))  \(counter)")
                            
                            //計算距離用的變數
                            pathCoordinatesUser.append(newItem)
                            
                            
                            //將新的位置信息加到coredata中
                            //                        let pathEntity = UserPath(context: coreDataPath.context)
                            //                        pathEntity.latitude = location.coordinate.latitude
                            //                        pathEntity.longitude = location.coordinate.longitude
                            //                        pathEntity.timestamp = location.timestamp
                            //                        coreDataPath.saveContext()
                            
                            //card value count
                            if !isFinishViewActive{
                                //計算距離（history的）
                                let timeStamp = counter
                                let coordinatesBeforeTime = pathCoordinatesBefore(timeStamp: timeStamp, pathCoordinates: oldPathCoordinates)
                                let totalDistance = totalDistanceBetweenCoordinates(coordinates: coordinatesBeforeTime)
                                print("在时间 \(timeStamp) 秒之前的路径点之间的距离总和为 \(totalDistance) 米")
                                
                                //計算距離（User的）
                                let coordinatesBeforeTimeUser = pathCoordinatesBefore(timeStamp: timeStamp, pathCoordinates: pathCoordinatesUser)
                                let totalDistanceUser = totalDistanceBetweenCoordinates(coordinates: coordinatesBeforeTimeUser)
                                print("User在时间 \(timeStamp) 秒之前的路径点之间的距离总和为 \(totalDistanceUser) 米")
                                friendDis = Int(totalDistanceUser.rounded() - totalDistance.rounded())
                                meterRun = Int(totalDistanceUser.rounded())
                                
                                if friendDis>0{
                                    isReachedFriendMeter = true
                                }else{
                                    isReachedFriendMeter = false
                                }
                                
                                
                                
//                                if friendDis>=20 && friendDis<=40{
//                                    if !hasSpeak{
//                                        //read meter
//                                        speak("很好、你已經超越朋友\(friendDis)公尺")
//                                        print("超越了！！")
//                                        hasSpeak = true
//                                    }
//                                }
//                                
//                                //離30m時提醒
//                                if friendDis == -30 && hasSpeak == false{
//                                            speak("再加把勁")
//                                            speak("距離朋友還有\(friendDis)公尺")
//                                            
//                                            hasSpeak = true
//                                }
//                                
//                                
//                                if counter == 29{hasSpeak = false}
//                                if counter == 58{hasSpeak = false}
//                                if counter == 90{hasSpeak = false}
//                                if counter == 119{hasSpeak = false}
//                                if counter == 150{hasSpeak = false}
//                                
//                                //30秒提醒
//                                if counter >= 30{
//                                    if !hasSpeak{
//                                        speak("加油")
//                                        speak("目前距離朋友\(friendDis)公尺")
//                                        
//                                        hasSpeak = true
//                                    }
//                                }
                                print(hasSpeak)
                                if !hasSpeak {
                                    // 超越時提醒
                                    if friendDis >= 0 && counter >= 5 {
                                        speak("很好，你已經超越朋友\(friendDis)公尺")
                                        print("超越了！")
                                        hasSpeak = true
                                    }
                                    
                                    // 距離 -20~-40 內提醒
                                    if friendDis >= -40 && friendDis <= -20 {
                                        speak("再加把勁，快追上了還有\(friendDis)公尺")
                                        hasSpeak = true
                                    }
                                    
                                    // 30秒提醒
                                    if counter >= 30 && counter % 30 == 0 {
                                        speak("加油，目前距離朋友\(friendDis)公尺")
                                        hasSpeak = true
                                    }
                                    
                                 
                                }
                                
                                // 計時器時間點的重設
                                if [10,29, 58, 88, 118, 149].contains(counter) {
                                    hasSpeak = false
                                }
                                
                                
                                
                                
                            }
                                
                        }
                        //region = newRegion
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    
                }
                .onAppear(){
                    pathCoordinates.append(contentsOf: oldPathCoordinates)
                    if isRecording{
                        //call recording function
                        startRecording()
                        
                        
                    }
                    
                    
                    
                    
                }
                
                HStack{
                    
                    Button(action: {
                        //stop logic here
                        //stop recording & jump to finish section
                        //print("recording stop function call")
                        stopFunction()
                        
                    }){
                        
                        
                        Image(systemName: "pause").fontWeight(.bold)
                            .foregroundColor(.white) // 图标颜色
                            .frame(width: 35, height: 35) // 设置按钮大小
                            .background(Color.gray) // 设置背景颜色
                            .cornerRadius(30) // 设置圆角
                    }.background(Color(.clear))
                        .frame(width: 30, height: 30)
                        .offset(x:70,y:-103)
                        .buttonStyle(PlainButtonStyle())
                    
                    
                    
                    
                }
                
                
                //ui card info here
                CardView(description: "This is a sample",
                         friendDistance: $friendDis,
                         timeCount: $counter, //經過的時間
                         meterLeft: $meterRun,//已經跑的距離
                         cornerRadius: 10, frameSize: CGSize(width: 200, height: 105),
                         isReachedFriend: $isReachedFriendMeter
                )
                .offset(y:65)
                .onReceive(timer) { _ in
                    if !isFinishViewActive{
                        updateTimer()
                    }
                }
                
                
            }
            
            
        }.sheet(isPresented: $isFinishViewActive) {
            FinishRunView(isFinishViewActive: $isFinishViewActive,totalMeters: $meterRun,usedTime: $counter,friendDis: $friendDis)
            //finsh
            //@Binding var totalMeters: Int
            //@Binding var usedTime: Int
            //@Binding var friendDis: Int
        }
        
    }
    
    
    
    //record the path and draw
    func startRecording(){
       print("start recording function call")
    }
    
    //stop function
    func stopFunction(){
        //stop and go back to home
        //finish
        print("stop function function call")
        isFinishViewActive = true
        
    }
    
    //timer update
    func updateTimer(){
        counter += 1
    }
    

    
    //count realtime distance
    func pathCoordinatesBefore(timeStamp: Int, pathCoordinates: [MapAnnotationItem]) -> [MapAnnotationItem] {
        var coordinatesBeforeTime: [MapAnnotationItem] = []
        for coordinate in pathCoordinates {
            if coordinate.timestamp <= timeStamp {
                coordinatesBeforeTime.append(coordinate)
            }
        }
        return coordinatesBeforeTime
    }
    
    func totalDistanceBetweenCoordinates(coordinates: [MapAnnotationItem]) -> Double {
        guard coordinates.count > 1 else { return 0 }
        var totalDistance: Double = 0.0
        for i in 0..<coordinates.count - 1 {
            let currentCoordinate = coordinates[i].coordinate
            let nextCoordinate = coordinates[i + 1].coordinate
            let distance = CLLocation(latitude: currentCoordinate.latitude, longitude: currentCoordinate.longitude).distance(from: CLLocation(latitude: nextCoordinate.latitude, longitude: nextCoordinate.longitude))
            totalDistance += distance
        }
        return totalDistance
    }
    
    //語音功能、讀文字
    func speak(_ message: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-CN")
        utterance.rate = 0.5 // 调整语速
        speechSynthesizer.speak(utterance)
    }
    
    //vibrate
    func vibrate() {
        WKInterfaceDevice.current().play(.notification)
    }
    
    
}


