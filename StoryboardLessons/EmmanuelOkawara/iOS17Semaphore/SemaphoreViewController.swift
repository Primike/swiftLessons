//
//  SemaphoreViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/5/23.
//

import UIKit

class SemaphoreViewController: UIViewController {

    var movies: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let semaphore = DispatchSemaphore(value: 1)
        let queue = DispatchQueue.global()
        
        queue.async {
            print("I am in the first block before wait")
            semaphore.wait() //0
            print("I am in the first block after wait")
            self.movies.append(self.downloadMovie(name: "Avengers"))
            semaphore.signal() //1
        }
        
        queue.async {
            print("I am in the second block before wait")
            semaphore.wait() //0
            print("I am in the second block after wait")
            self.saveMovies()
            self.movies.remove(at: 0)
            semaphore.signal() //1
        }
        
        print("Big Chunugs")
        
//        let group = DispatchGroup()
//        let queue = DispatchQueue.global()
//
//        queue.async(group: group) {
//            let movieName = self.downloadMovie(name: "Avengers")
//            self.movies.append(movieName)
//        }
//
//        queue.async(group: group) {
//            self.saveMovies()
//            self.movies.remove(at: 0)
//        }
//
//        group.notify(queue: .main) {
//            print("All downloads have been completed")
//        }
    }
    
    func downloadMovie(name: String) -> String {
        sleep(4)
        print("\(name) has been downloaded")
        
        return name
    }
    
    func saveMovies() {
        sleep(2)
        print("Movies have been saved")
    }
}
