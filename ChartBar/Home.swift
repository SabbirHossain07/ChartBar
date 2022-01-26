//
//  Home.swift
//  ChartBar
//
//  Created by Sopnil Sohan on 26/1/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("History")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {},
                           label: {
                        Image(systemName: "gearshape.circle.fill")
                            .renderingMode(.original)
                            .font(.system(size: 38))
                            .foregroundColor(.black)
                    })
                }
                .padding()
                
                //MARK: BAr chart
                VStack(alignment: .leading, spacing: 25) {
                    Text("Recent Fasts")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15) {
                        ForEach(fastingData) {work in
                            //Bars
                            
                            VStack {
                                VStack {
                                    Spacer(minLength: 0)
                                    
                                    Text(getHrs(value: work.fastingInMin))
                                        .foregroundColor(.white)
                                    
                                    Rectangle()
                                        .fill(LinearGradient(gradient: .init(colors: [Color.green, Color.black]), startPoint: .top, endPoint: .bottom))
                                        .frame(height: getHeight(value: work.fastingInMin))
                                        .cornerRadius(10)
                                }
                                .frame(height: 250)
                                
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding()
            }
        }
        .background(Color.black.opacity(0.9).edgesIgnoringSafeArea(.all))
//        .preferredColorScheme(.dark)
    }
    
    //MARK: Calculating Height...
    func getHeight(value: CGFloat)->CGFloat {
        //the value in min...
        //getting height...
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    func getHrs(value: CGFloat)->String{
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//MARK: Sample Data
struct Daily: Identifiable {
    var id: Int
    var day: String
    var fastingInMin: CGFloat
}

var fastingData = [
    Daily(id: 0, day: "Day 1", fastingInMin: 480),
    Daily(id: 1, day: "Day 2", fastingInMin: 880),
    Daily(id: 2, day: "Day 3", fastingInMin: 280),
    Daily(id: 3, day: "Day 4", fastingInMin: 380),
    Daily(id: 4, day: "Day 5", fastingInMin: 1280),
    Daily(id: 5, day: "Day 6", fastingInMin: 780),
    Daily(id: 6, day: "Day 7", fastingInMin: 980),
]
