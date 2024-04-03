//
//  ContentView.swift
//  photoLibrary
//
//  Created by Philippe MICHEL on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var  image:Image?
    @State private var inputImage:UIImage?
    @State private var showImagePicker = false
    
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
           
            
            Button(action: {
                showImagePicker = true
            }
                   , label: {
                Text(LocalizedStringKey("butonDescription"))
            })
            
            .buttonStyle(PlainButtonStyle())
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .padding()
            
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(image: $inputImage)
        }
        .onChange(of:inputImage) {loadImage()}
    }
    //Chargement Image
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

#Preview {
    ContentView()
}

