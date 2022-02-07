//
//  Home.swift
//  UI-453 (iOS)
//
//  Created by nyannyan0328 on 2022/02/07.
//

import SwiftUI

struct Home: View {
    @StateObject var moldel = PickImageViewModel()
    var body: some View {
        VStack{
            
            if let image = moldel.pickedImage{
                
                
                Group{
                    
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipped()
                        .onTapGesture {
                            
                            
                        }
                    
                    
                    Button {
                        
                        moldel.generateIconSet()
                        
                      
                        
                    } label: {
                        
                        
                        Text("Create Icon set")
                            .font(.title.weight(.bold))
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(.white,in: RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.top,30)

                    
                    
                    
                }
                
                
            }
            else{
                
                ZStack{
                    
                    
                    Button {
                        
                        moldel.PickeToImage()
                        
                    } label: {
                        
                        
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white,in: RoundedRectangle(cornerRadius: 10))
                    }

                    
                    Text("1024 * 1024 is Recommended")
                        .font(.caption2.weight(.bold))
                        .foregroundColor(.gray)
                        .frame(maxHeight:.infinity,alignment: .bottom)
                        .padding(.bottom,20)
                    
                    
                    
                    
                }
                
                
            }
        }
        .frame(width: 500, height: 500)
        .buttonStyle(.plain)
        .alert(moldel.aleartMSG, isPresented: $moldel.showAlert, actions: {
            
            
        })
        .overlay(
        
            ZStack{
                
                if moldel.isGenerating{
                    
                    Color.black.opacity(0.3)
                    
                    ProgressView()
                        .padding()
                        .background(.white,in: RoundedRectangle(cornerRadius: 10))
                        .environment(\.colorScheme, .light)
                    
                }
            }
        
        
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
