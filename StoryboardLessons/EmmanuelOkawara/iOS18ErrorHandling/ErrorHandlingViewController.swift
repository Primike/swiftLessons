//
//  ErrorHandlingViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/5/23.
//

import UIKit

class ErrorHandlingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(readTxtFile("chungusfile"))
        print(readTxtFile2("chungusfile"))
    }
    
    func readTxtFile(_ name: String) -> String {
        guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "txt") else {
            return "Guard: File does not exist"
        }
        
        let text = try? String(contentsOf: fileUrl)
        return text ?? "File not found"
    }
    
    func readTxtFile2(_ name: String) -> String {
        guard var fileUrl = Bundle.main.url(forResource: name, withExtension: "txt") else {
            return "Guard: File does not exist"
        }
        fileUrl.appendPathComponent("")
        print(fileUrl)
        
        do {
            let text = try String(contentsOf: fileUrl)
            return text
        } catch {
            return error.localizedDescription
        }
    }
}
