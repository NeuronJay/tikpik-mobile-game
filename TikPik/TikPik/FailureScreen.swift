//
//  FailureScreen.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//

import SwiftUI

struct FailureScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{

                Spacer()
                
                Image("sad").resizable().frame(width: 200.0,height: 200.0).fixedSize()
                
                Text("Oopsiee!")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.blue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                    
                Text("Better Luck Next Time")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding()
            
                Text("New Score: \(SelectionScreen().defaults.integer(forKey: "score")) 🍓")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    //.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.841, saturation: 0.418, brightness: 0.882)/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 10)
                    .opacity(50)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        viewRouter.currentPage = .gamepage
                    }
                }) {
                    PlayButtonContent()
                }
                
                Button(action: {
                    withAnimation {
                        viewRouter.currentPage = .homepage
                    }
                }) {
                    GoHomeButtonContent()
                }.padding()
                
                Spacer()
                
            }
        }.onAppear(perform: {playSound(sound: "failure", type: "mp3")})
    }
}

struct GoHomeButtonContent : View {
    var body: some View {

        Text("Go to Home")
            .padding(.horizontal, 50)
            .padding(.vertical, 25)

            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .clipShape(Capsule())
    }
}

struct FailureScreen_Previews: PreviewProvider {
    static var previews: some View {
        FailureScreen().environmentObject(ViewRouter())
    }
}
