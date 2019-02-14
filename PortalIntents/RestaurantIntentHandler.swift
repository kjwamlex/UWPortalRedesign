//
//  RestaurantIntentHandler.swift
//  PortalIntents
//
//  Created by Joonwoo KIM on 2018-08-06.
//  Copyright © 2018 Joonwoo KIM. All rights reserved.
//

import Foundation

import Intents

class RestuarantIntentHandler: INExtension, RestaurantIntentHandling {
    
    func confirm(intent: RestaurantIntent, completion: @escaping (RestaurantIntentResponse) -> Void) {
        
        
        //completion(NextClassIntentResponse.init(code: .ready, userActivity: nil))
        completion(RestaurantIntentResponse.init(code: .success, userActivity: nil))
        
        
        
    }
    
    func handle(intent: RestaurantIntent, completion: @escaping (RestaurantIntentResponse) -> Void) {
        
        
        completion(RestaurantIntentResponse(code: .success, userActivity: nil))
        
    }
}
