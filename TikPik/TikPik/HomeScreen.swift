//
//  HomeScreen.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//

//import SwiftUI
import SwiftUI
import UIKit

struct HomeScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {

            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    
                    Image("pngegg").resizable().frame(width: 200.0,height: 250.0).fixedSize().padding()

                    Text("Hey, welcome. I am Kitty")
                            .foregroundColor(.purple)
                            .multilineTextAlignment(.leading)
                            .padding()
                    
                    Text("Earn points by taking pics of items")
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                        .padding()
                                        
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .gamepage
                        }
                    }) {
                        PlayButtonContent()
                    }.transition(.move(edge: .trailing))
                    
                    Text("Current Score: \(SelectionScreen().defaults.integer(forKey: "score")) 🍓")
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
                            viewRouter.currentPage = .offerpage
                        }
                    }) {
                        PlaceContent()
                    }.transition(.opacity)
                    
                    /*
                        Button {
                        } label: {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.white)
                                        .font(.title)
                                )
                                .shadow(radius: 10)
                        }
                    */
                    
                    HStack{
                        Image("Icon-128").resizable().frame(width: 25, height: 25)
                        Text("TikPik")
                            .foregroundColor(.white)
                    }.padding()
                    
                    Spacer()
                }
            }
    }
}

struct PlayButtonContent : View {
    var body: some View {
        Text("Play New Game")
            .frame(width: 200, height: 80)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.headline)
    }
}

struct PlaceContent : View {
    var body: some View {
        Text("Redeem My Berries 🍓")
            .padding(.horizontal, 30)
            .padding(.vertical, 16)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.headline)
            .clipShape(Capsule())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().environmentObject(ViewRouter())
    }
}
