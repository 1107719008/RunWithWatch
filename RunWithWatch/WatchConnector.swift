//
//  WatchConnector.swift
//  RunWithWatch
//
//  Created by 林君翰 on 2024/4/4.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate{
    
    
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    //recieve content from watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    
}
