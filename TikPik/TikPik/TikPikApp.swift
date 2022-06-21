//
//  TikPikApp.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//

import SwiftUI

@main
struct TikPikApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
                .preferredColorScheme(.dark)
        }
    }
}
