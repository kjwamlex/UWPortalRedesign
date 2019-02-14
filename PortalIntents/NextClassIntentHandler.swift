//
//  NextClassIntentHandler.swift
//  PortalIntents
//
//  Created by Joonwoo KIM on 2018-08-03.
//  Copyright © 2018 Joonwoo KIM. All rights reserved.
//

import Foundation
import Intents

class NextClassIntentHandler: INExtension, NextClassIntentHandling {
    
    func confirm(intent: NextClassIntent, completion: @escaping (NextClassIntentResponse) -> Void) {
        
        
        //completion(NextClassIntentResponse.init(code: .ready, userActivity: nil))
        completion(NextClassIntentResponse.success(nextClass:  "CS135"))

   
        
    }
    
    func handle(intent: NextClassIntent, completion: @escaping (NextClassIntentResponse) -> Void) {

        completion(NextClassIntentResponse.success(nextClass:  "CS135"))
        
        completion(NextClassIntentResponse(code: .success, userActivity: nil))

    }
}
