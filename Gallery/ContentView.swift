//
//  ContentView.swift
//  Gallery
//
//  Created by Michael Vlamis on 2023-01-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack {
                Image("placeholder")
                    .resizable()
                    .frame(width: 175, height: 175)
                Image("placeholder")
                    .resizable()
                    .frame(width: 175, height: 175)
                
                
            }
            
            
        }

        
    }
    
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
