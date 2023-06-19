//
//  BC40DatePicker.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC40DatePicker: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2022)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Selected Date:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            
            DatePicker("Select A Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date, .hourAndMinute])
                .accentColor(.red)
                .datePickerStyle(
                    CompactDatePickerStyle()
    //                GraphicalDatePickerStyle()
    //                WheelPickerStyle()
            )
        }
        .padding()
    }
}

struct BC40DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        BC40DatePicker()
    }
}
