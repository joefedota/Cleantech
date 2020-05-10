//
//  StateController.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/21/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import Foundation

class StateController {
    var route : String
    var realRoute : Bool
    var trans : Bool
    init(route: String) {
        self.route = route
        self.realRoute = false
        self.trans = false
    }
    
    func setRoute(route:String) {
        self.route = route
        self.realRoute = true
    }
    func setTrans() {
        self.trans = true
    }
    func getRoute() -> String {
        return self.route
    }
}
