//
//  ContentView.swift
//  WeatherVR
//
//  Created by Yasir on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var viewModel : WeatherViewModel
    
    
    var body: some View {
        
        ZStack {
            
            
            //Color.blue.edgesIgnoringSafeArea(.all)
            
            ContainerRelativeShape()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            
            
            
            if viewModel.isLoading {
                
                ProgressView("Loading ...")
                
            }else{
                
                VStack(spacing:20){
                    
                    Text(viewModel.titleCityName)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Image(systemName:viewModel.mainTitleImage)
                        .resizable()
                        .frame(width:120, height:100)
                        .padding(5)
                        .foregroundColor(.white)
                    
                    
                    Text(viewModel.mainTemp)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                    
                    
                    HStack {
                        
                        DayTempEelement(dayName:viewModel.dayOne, imgName:viewModel.dayOneImg, tempValue:viewModel.dayOneTemp)
                        
                        DayTempEelement(dayName:viewModel.dayTwo, imgName:viewModel.dayOneImg, tempValue:viewModel.dayTwoTemp)
                        
                        DayTempEelement(dayName:viewModel.dayThree, imgName:viewModel.dayOneImg, tempValue:viewModel.dayThreeTemp)
                        
                        DayTempEelement(dayName:viewModel.dayFour, imgName:viewModel.dayOneImg, tempValue:viewModel.dayFourTemp)
                        
                        DayTempEelement(dayName:viewModel.dayFive, imgName:viewModel.dayOneImg, tempValue:viewModel.dayFiveTemp)
                        
                        
                    }
                    .padding()
                    
                }
                
                
                
            }
            
            
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}


struct DayTempEelement : View{
    
    let dayName : String
    let imgName : String
    let tempValue : String
    
    var body : some  View {
        VStack {
            
            Text(dayName)
                //.font(.title2)
                .font(.title2.weight(.semibold))
                .foregroundColor(.white)
            
            Image(systemName: imgName)
                .resizable()
                .frame(width:60, height: 40)
                .foregroundColor(.white)
                .padding(5)
            
            Text(tempValue)
                //.font(.caption)
                .font(Font.system(size:15))
                .scaledToFit()
                .foregroundColor(.white)
        }
        
    }
}
