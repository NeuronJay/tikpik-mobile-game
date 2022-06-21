//  MotherView.swift
//  TikPik
//
//  Created by Dev, Jay on 4/2/22.
//
//  MotherView.swift
//  NavigatinInSwiftUIStarter
//
//  Created by Andreas Schultz on 29.10.20.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .homepage:
            HomeScreen()
                .transition(.slide)
        case .gamepage:
            SelectionScreen()
                .transition(.opacity)
        case .successpage:
            SuccessScreen()
                .transition(.opacity)
        case .failurepage:
            FailureScreen()
                .transition(.opacity)
        case .offerpage:
            PlaceList()
                .transition(.opacity)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
