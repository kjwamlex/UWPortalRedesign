//
//  RegistrarOfficeIntentHandler.swift
//  PortalIntents
//
//  Created by Joonwoo KIM on 2018-08-06.
//  Copyright © 2018 Joonwoo KIM. All rights reserved.
//

import Foundation

import Intents

class RegistrarOfficeIntentHandler: INExtension, RegistrarOfficeIntentHandling {
    
    func confirm(intent: RegistrarOfficeIntent, completion: @escaping (RegistrarOfficeIntentResponse) -> Void) {
        
        
        //completion(NextClassIntentResponse.init(code: .ready, userActivity: nil))
        completion(RegistrarOfficeIntentResponse.init(code: .success, userActivity: nil))
        
        
        
    }
    
    func handle(intent: RegistrarOfficeIntent, completion: @escaping (RegistrarOfficeIntentResponse) -> Void) {
        
        completion(RegistrarOfficeIntentResponse.init(code: .success, userActivity: nil))

        
    }
}

