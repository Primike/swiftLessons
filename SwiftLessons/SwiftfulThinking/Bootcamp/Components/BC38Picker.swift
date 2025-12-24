//
//  BC38Picker.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/18/23.
//

import SwiftUI

struct BC38Picker: View {
    
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    //from uikit override all segmented in app
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            Picker(selection: $selection) {
                ForEach(filterOptions.indices, id: \.self) { index in
                    Text(filterOptions[index])
                        .tag(filterOptions[index])
                }
            } label: {
                Text("Picker")
            }
            .pickerStyle(SegmentedPickerStyle())

            Picker(selection: $selection) {
                ForEach(filterOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                        Image(systemName: "heart.fill")
                    }
                    .tag(option)
                }
            } label: {
                HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct BC38PickerWheel: View {
    
    @State var selection: String = "1"
    
    var body: some View {
        VStack {
            HStack {
                Text("Age:")
                Text(selection)
            }
            
            Picker(selection: $selection) {
                ForEach(18..<100) { number in
                    Text("\(number)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .tag("\(number)")
                }
            } label: {
                Text("Picker")
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct BC38Picker_Previews: PreviewProvider {
    static var previews: some View {
        BC38Picker()
    }
}
