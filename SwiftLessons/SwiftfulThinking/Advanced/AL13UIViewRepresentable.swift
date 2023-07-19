//
//  AL13UIViewRepresentable.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI

struct AL13UIViewRepresentable: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle)
            
            HStack {
                Text("Swift UI")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                    .background(Color.gray)
            }
            
            HStack {
                Text("UIKit")
                AL13UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("QWE")
                    .padding()
                    .frame(height: 55)
                    .background(Color.gray)
            }
        }
        .padding()
    }
}

struct AL13UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeHolder: String
    let placeHolderColor: UIColor
    
    init(text: Binding<String>, placeHolder: String = "Type...", placeHolderColor: UIColor = .white) {
        self._text = text
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        
        return textField
    }
    
    //from swiftui to uikit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        let placeHolder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor : placeHolderColor])
        
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    
    func updatePlaceholder(_ text: String) -> AL13UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeHolder = text
        
        return viewRepresentable
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    //From uikit to swiftui
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct AL13UIViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        AL13UIViewRepresentable()
    }
}
