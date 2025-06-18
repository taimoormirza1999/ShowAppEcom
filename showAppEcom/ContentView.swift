//
//  ContentView.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 18/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            LinearGradient(colors: [.blue,.white], startPoint: .topTrailing, endPoint: .bottomLeading)
//                .ignoresSafeArea()
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack() {
                Text("Cupertino, CA").font(.system(size:34,weight: .medium)).foregroundColor(.white).padding()
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120.0, height: 120.0)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .yellow)
                    .foregroundColor(.accentColor)
                
                
                Text("76°").font(.system(size:50, weight: .bold)).foregroundColor(.white).padding()
                HStack( spacing: 0.0){
                    ForecastDayView(day: "TUE", icon: "cloud.fill", temperature: "76°",color:Color.white)
                    ForecastDayView(day: "WED", icon: "cloud.snow.fill", temperature: "76°",color:.white)
                    ForecastDayView(day: "THU", icon: "cloud.fill", temperature: "76°",color:.purple)
                    ForecastDayView(day: "FRI", icon: "cloud.fill", temperature: "76°",color:.red)
                    ForecastDayView(day: "SAT", icon: "cloud.fill", temperature: "76°",color:.yellow)
                }.frame(width:UIScreen.main.bounds.width*0.9)
              
                Button("Change My Day") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.foregroundColor(.red)
                
                Button("dfgd") {
                    
                }
            }
            
           
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ForecastDayView: View {
    var day: String
    var icon: String
    var temperature: String
        let color:Color

    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Text(day)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom, 2.0)
            
            Image(systemName: icon).font(.system(size: 30))
                .aspectRatio(contentMode: .fit)
                .frame(width: 30.0, height: 30.0)
                .foregroundColor(color)
            
            Text(temperature)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        } .frame(maxWidth: .infinity).padding(.horizontal)
       
    }
}
