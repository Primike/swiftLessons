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
//    @State var alertTitle: String = ""
//    @State var alertMessage: String = ""
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
//                    alertTitle = "Error uploading video"
//                    alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .success
//                    alertTitle = "Successfully uploaded video"
//                    alertMessage = "Your video is now public"
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
//        return Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("Ok")))
//        return Alert(
//            title: Text("This is the title"),
//            message: Text("Here is the message"),
//            primaryButton: .destructive(Text("Delete"), action: {
//                backgroundColor = .red
//            }),
//            secondaryButton: .cancel())
    }
}

struct BC32ShowAlerts_Previews: PreviewProvider {
    static var previews: some View {
        BC32ShowAlerts()
    }
}
