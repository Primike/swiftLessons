//
//  CL24TimerReceive.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/5/23.
//

import SwiftUI

struct CL24TimerReceive: View {
        
    //Publishing values over time.
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    @State var countDown: Int = 10
    @State var finishedText: String? = nil
    
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
//            HStack {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 150)
//            .foregroundColor(.white)
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
        }
        //subscribe to publisher
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }
        }
//        .onReceive(timer) { value in
//            updateTimeRemaining()
//        }
    }
}

struct CL24TimerReceive_Previews: PreviewProvider {
    static var previews: some View {
        CL24TimerReceive()
    }
}
