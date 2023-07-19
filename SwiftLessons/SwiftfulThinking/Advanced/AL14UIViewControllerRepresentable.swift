//
//  AL14UIViewControllerRepresentable.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/15/23.
//

import SwiftUI
//import UIKit

struct AL14UIViewControllerRepresentable: View {
    
    @State private var showScreen: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("Hi")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                showScreen.toggle()
            } label: {
                Text("Click")
            }
            .sheet(isPresented: $showScreen) {
                AL14UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
            }
        }
    }
}

struct AL14UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.allowsEditing = false
        viewController.delegate = context.coordinator
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    //uikit to swiftui
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else {
                return
            }
            
            image = newImage
            showScreen = false
        }
    }
}

struct AL14BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String

    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = AL14FirstViewController()
        
        viewController.labelText = labelText
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class AL14FirstViewController: UIViewController {
    
    var labelText: String = "Starting"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}

struct AL14UIViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        AL14UIViewControllerRepresentable()
    }
}
