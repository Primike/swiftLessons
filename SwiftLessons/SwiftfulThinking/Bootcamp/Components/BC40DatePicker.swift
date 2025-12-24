//
//  BC40DatePicker.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC40DatePicker: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: nil)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Selected Date:")
                    .font(.title)
                
                Text(dateFormatter.string(from: selectedDate))
                    .font(.title3)
                    .fontWeight(.bold)
                
                Rectangle()
                    .frame(height: 1)
                
                DatePicker("Select A Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date, .hourAndMinute])
                    .accentColor(.red)
                    .datePickerStyle(
                        CompactDatePickerStyle()
                    )
                
                Rectangle()
                    .frame(height: 1)

                DatePicker("Select A Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date, .hourAndMinute])
                    .accentColor(.red)
                    .datePickerStyle(
                        GraphicalDatePickerStyle()
                    )
                
                Rectangle()
                    .frame(height: 1)

                DatePicker("Select A Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date, .hourAndMinute])
                    .accentColor(.red)
                    .datePickerStyle(
                        WheelDatePickerStyle()
                    )
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct BC40DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        BC40DatePicker()
    }
}
