//
//  CL22DownloadJSON.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/5/23.
//

import SwiftUI

struct CL22PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class CL22DownloadJSONViewModel: ObservableObject {
    @Published var posts: [CL22PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        downloadData(url: url) { data in
            if let data = data {
                guard let newPost = try? JSONDecoder().decode([CL22PostModel].self, from: data) else { return }

                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.posts = newPost
                }
            } else {
                print("No data")
            }
        }
    }
    
    func downloadData(url: URL, completion: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            completion(data)
        }
        .resume()
    }
}

struct CL22DownloadJSON: View {
    @StateObject var viewModel = CL22DownloadJSONViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct CL22DownloadJSON_Previews: PreviewProvider {
    static var previews: some View {
        CL22DownloadJSON()
    }
}
