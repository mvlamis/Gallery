//
//  ContentView.swift
//  Gallery
//
//  Created by Michael Vlamis on 2023-01-31.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    var choice: String
    
    var body: some View {
        Text(choice)
    }
}

struct ContentView: View {
    @State var images = [UIImage]()


    var body: some View {
        NavigationView{
            
            ScrollView {
                NavigationLink(destination: PhotoView(choice:"Image")) {
                    Text("View Image")
                }
                NavigationLink(destination: PhotosSelector()) {
                    Text("Upload Image")
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                    ForEach(images, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .background(Color.yellow)
                        
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onAppear {
                    self.loadImages()
                }
            }.navigationTitle("Images")
        }
        
    }
    
    func loadImages() {
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let imagesURL = bundleURL.appendingPathComponent("Images")

        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: imagesURL, includingPropertiesForKeys: nil)
            self.images = fileURLs.compactMap { URL in
                guard let data = try? Data(contentsOf: URL) else { return nil }
                return UIImage(data: data)
            }
        } catch {
            print("Error while enumerating files \(imagesURL.path): \(error.localizedDescription)")
        }
    }
}

struct PhotosSelector: View {
    @State var selectedItems: [PhotosPickerItem] = []

    var body: some View {
        PhotosPicker(selection: $selectedItems,
                     matching: .images) {
            Text("Select Multiple Photos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
