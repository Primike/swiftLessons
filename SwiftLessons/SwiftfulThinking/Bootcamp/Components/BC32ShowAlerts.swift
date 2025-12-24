//
//  BC32ShowAlerts.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 5/27/23.
//

import SwiftUI

struct BC32ShowAlerts: View {
    
    @State var showAlert: Bool = false
    @State var backgroundColor: Color = .yellow
    @State var alertType: MyAlerts? = nil

    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Button 1") {
                    alertType = .error
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .success
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error"))
        case .success:
            return Alert(title: Text("This was a success"), message: nil, dismissButton: .default(Text("Ok"), action: {
                backgroundColor = .green
            }))
        case .none:
            return Alert(title: Text("Error"))
        }
    }
}

struct BC32ShowAlerts_Previews: PreviewProvider {
    static var previews: some View {
        BC32ShowAlerts()
    }
}
