//
//  AL15Protocols.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/16/23.
//

import SwiftUI

protocol AL15ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct AL15DefaultColorTheme: AL15ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AL15AlternativeColorTheme: AL15ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

protocol AL15ButtonTextProtocol {
    var buttonText: String { get }
}

protocol AL15ButtonPressedProtocol {
    func buttonPressed()
}

protocol AL15ButtonDataSourceProtocol: AL15ButtonTextProtocol, AL15ButtonPressedProtocol {
    
}
class AL15DefaultDataSource: AL15ButtonDataSourceProtocol {
    var buttonText: String = "Protocols"
    
    func buttonPressed() {
        print("Chungus")
    }
}

struct AL15Protocols: View {
    
    let colorTheme: AL15ColorThemeProtocol
    let dataSource: AL15DefaultDataSource
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct AL15Protocols_Previews: PreviewProvider {
    static var previews: some View {
        AL15Protocols(colorTheme: AL15DefaultColorTheme(), dataSource: AL15DefaultDataSource())
    }
}
