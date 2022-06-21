//
//  SelectionScreen.swift
//  Strawberry
//
//  Created by Dev, Jay on 3/24/22.
//

import SwiftUI
import Vision
import UIKit
import Foundation
import CoreML

struct SelectionScreen: View {
    
    //Image Classification Model
    
    let model = MobileNetV2()
    
    //@EnvironmentObject var finalImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var isImagePickerDisplay = false
    @State var selectedImage: UIImage?
    @State var classificationLabel: String = ""
    
    @State var newScore: Int = 0
    
    @State var flag: Bool = false
    
    //random classes
    @State var randomClasses = getRandomClasses(num: 4)
    
    @State var randomClassData = getRandomClassData(num: 4)
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var defaults = UserDefaults.standard
    
    func loadScore(){
        
    defaults.set(0, forKey: "score")
    }
    
    func updateScore(editScore: Int) -> Int{
    defaults.set((defaults.integer(forKey: "score") + editScore), forKey: "score")
        return editScore
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            HStack {
                Image(systemName: "chevron.left").onTapGesture {
                    withAnimation {
                        viewRouter.currentPage = .homepage
                    }
                    
                    audioPlayer?.stop()
                }
                
                Spacer()
            }.foregroundColor(.white)
            .font(.headline)
            .padding()
            
            if selectedImage == nil {
                
                VStack{
                    
                    
                    
                Spacer()
                
                Text("Take a clear photo of any one of the below classes:").foregroundColor(Color(hue: 0.61, saturation: 0.381, brightness: 0.947)).font(.title).padding(.horizontal, 50.0)
                    
                    Text("Hint: Pick tougher items to get more points.").foregroundColor(.white).font(.caption).padding()
                    
                Button {
                } label: {
                    //Text("ClassData[0].className : ClassData[0].value"
                    Text("\(randomClassData[0].className):  \(randomClassData[0].value)")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Capsule())
                }.padding()
                
                Button {
                } label: {
                    Text("\(randomClassData[1].className):  \(randomClassData[1].value)")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)

                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Capsule())
                }.padding()
                
                Button {
                } label: {
                    Text("\(randomClassData[2].className):  \(randomClassData[2].value)")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)

                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Capsule())
                }.padding()
                
                Button {
                } label: {
                    Text("\(randomClassData[3].className):  \(randomClassData[3].value)")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(Capsule())
                }.padding()
                
                Spacer()
                    
                Button(action: {
                    
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                    
                    audioPlayer?.stop()
                    
                    }){TakePhotoContent()}
                    
                    
                    Spacer()
                }
            }
            else
            {
                VStack
                {
                Image("are-you-sure").resizable().frame(width: 300, height: 300)
                
                Button("Yes, Let's Go"){
                            classifyImage()
                            checkFlag()
                        }.padding()
                            .foregroundColor(.blue)
                }
                        
                //Text(classificationLabel)
                //           .foregroundColor(.white)
            }
                /*
                if selectedImage != nil {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 100, height: 100)
                                } else {
                                    Image("hooray")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 100, height: 100)
                                }
                */
            
            }.onAppear(perform: { playSound(sound: "clock", type: "wav") } )
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)}
        }
    
    private func checkFlag()
        {
            
            for ranClass in randomClassData {
                if classificationLabel.contains(ranClass.className) {
                    flag = true
                    newScore = ranClass.value
                    if(flag)
                    {updateScore(editScore: ranClass.value)}
                    break
                }
                
                
            }
            
            if flag == true
            {
                withAnimation {
                    viewRouter.currentPage = .successpage
                }
            }
            else
            {
                withAnimation {
                    viewRouter.currentPage = .failurepage
                }
            }
        }
    
    private func classifyImage() {
        //let currentImageName = photos[currentIndex]
        let cameraImage = selectedImage
        //guard let image = UIImage(named: currentImageName),
              
        
        guard let image = cameraImage,
              let resizedImage = image.resizeImageTo(size:CGSize(width: 224, height: 224)),
              let buffer = resizedImage.convertToBuffer() else {
              return
        }
        
        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            
            /*
            let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
            let result = results.map { (key, value) in
                return "\(key) = \(String(format: "%.2f", value * 100))%"
            }.joined(separator: "\n")
             */
            
            let result = output.classLabel

            self.classificationLabel = result
        }
    }
}




struct TakePhotoContent : View {
    var body: some View {
        Text("Take a Pic 📷")
            .frame(width: 250, height: 100)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.title)
    }
}

struct SelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        SelectionScreen().environmentObject(ViewRouter())
    }
}
