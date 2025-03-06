//
//  PredatorDetail.swift
//  APEX
//
//  Created by Arun  on 06/03/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    let predator: ApexPredator
//    @State var position: MapCameraPosition
    
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    //Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                   Gradient.Stop(color: .black, location: 1)
                                                  ], startPoint: .top, endPoint: .bottom)
                        }
                    //Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                VStack(alignment: .leading){
                    //Dino name
                    Text(predator.name)
                    
                    // Current location
//                    Map(position: <#T##Binding<MapCameraPosition>#>)
                    
                    // Apperance in
                    Text("Appears In:")
                    
                    ForEach(predator.movies, id: \.self){ movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    // Movie moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach (predator.movieScenes) { secne in
                        Text(secne.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(secne.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    // Link to webpage
                    Text("Read more:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundColor(.blue)
                    
                }
                .padding()
                .padding(.bottom, 10)
                .frame(width: geo.size.width, alignment: .leading)
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[10])
        .preferredColorScheme(.dark)
}
