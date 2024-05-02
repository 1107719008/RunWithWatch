//
//  WatchToiOSConnector.swift
//  WatchOSRunWithWatch Watch App
//
//  Created by 林君翰 on 2024/4/4.
//
//建立watch與手機的連結

import Foundation
import WatchConnectivity

class WatchTOiOSConnector: NSObject, WCSessionDelegate{
    
    
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sendMacroToiOS(){
        
    }
    
}
