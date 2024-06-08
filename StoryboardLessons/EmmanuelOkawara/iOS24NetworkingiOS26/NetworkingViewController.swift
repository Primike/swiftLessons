//
//  NetworkingViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/16/23.
//

import UIKit

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPost()
    }
    
    func createPost() {
        let newPost = Post(id: 101, title: "Big Chungus", body: "This is big chungus")
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(newPost)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("The error was: \(error.localizedDescription)")
            } else {
                guard let data = data else {
                    return
                }
                let post = try? JSONDecoder().decode(Post.self, from: data)
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.view.backgroundColor = .red
            }
        }.resume()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response \(jsonRes)")
            }
        }.resume()
    }
}
