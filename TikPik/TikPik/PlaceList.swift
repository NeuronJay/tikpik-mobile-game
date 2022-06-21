//
//  PlaceList.swift
//  TikPik
//
//  Created by Dev, Jay on 4/6/22.
//

import SwiftUI

struct PlaceList: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
            ScrollView {
            //Color.black.ignoresSafeArea()
            HStack {
                Image(systemName: "chevron.left").onTapGesture {
                    withAnimation {
                        viewRouter.currentPage = .homepage
                    }
                }
                
                Spacer()
            }.foregroundColor(.white)
            .font(.headline)
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ActivityView(emoji: "🍔", title: "Food")
                    ActivityView(emoji: "🌇", title: "Travel")
                    ActivityView(emoji: "🏂", title: "Sports")
                    ActivityView(emoji: "🎥", title: "Movies")
                }
            }
            
            Text("POPULAR")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            LazyVStack {
                ForEach(placeImages, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .mask(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }.background(.black)
    }
}

struct ActivityView: View {
    let emoji: String
    let title: String
    
    var body: some View {
        VStack {
            Text(emoji)
                .padding(10)
                .background(Circle().fill(.purple))
            Text(title).foregroundColor(.white).font(.subheadline)
        }
        .padding()
    }
}

let placeImages: [String] = [
    "https://img.hellofresh.com/f_auto,fl_lossy,q_auto,w_375/hellofresh_website/us/lp/images/hellofresh-coupons-and-promos-30OFF.jpg",
    "https://1.bp.blogspot.com/-4IkxBCZFPnY/X-jB-LqAc1I/AAAAAAAAKnU/TXwxt9kHqDM9x-0xPDDw-t6EgY2Hu8V2QCLcBGAsYHQ/w1200-h630-p-k-no-nu/hellofresh-discounts-promo-codes.jpg",
    "https://ukdealpal.com/wp-content/uploads/UberEats-Promo-Codes-in-UK.jpg",
    "https://hip2save.com/wp-content/uploads/2019/11/walmart-black-friday-ad-print.jpg",
    "https://i.ytimg.com/vi/HnuHp3T9VkM/maxresdefault.jpg",
    "https://images.unsplash.com/photo-1640148791027-80af0f8b55da",
    "https://images.unsplash.com/photo-1640187458259-95c326b58154"
]

struct PlaceList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceList().environmentObject(ViewRouter())
    }
}

