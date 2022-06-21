//
//  SuccessScreen.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//


import SwiftUI

struct SuccessScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {

        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("hooray").resizable().frame(width: 200.0,height: 200.0).fixedSize()
                
                Text("Congratulations!")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.blue)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text("You correctly took a photo. Good Going!")
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
        }.onAppear(perform: {playSound(sound: "cheering", type: "mp3")})
    }

}

struct SuccessScreen_Previews: PreviewProvider {
    static var previews: some View {
        SuccessScreen()
    }
}
