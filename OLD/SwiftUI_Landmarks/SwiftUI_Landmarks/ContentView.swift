//
//  ContentView.swift
//  SwiftUI_Landmarks
//
//  Created by Станислав Буйновский on 23.06.2020.
//  Copyright © 2020 Станислав Буйновский. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            VStack {
                MapView()
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.top)

                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    HStack {
                        Text("Joshua Tree National Park")
                            .font(.subheadline)
                        Spacer()
                        Text("California")
                            .font(.subheadline)
                    }
                }
                .padding()
               
                Spacer()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
