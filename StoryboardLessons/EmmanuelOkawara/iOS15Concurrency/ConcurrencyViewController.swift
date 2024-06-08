//
//  ConcurrencyViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 2/2/23.
//

import UIKit

class ConcurrencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let group = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "first")
        queue1.async(group: group) {
            sleep(3)
            print("First queue")
        }
        
        let queue2 = DispatchQueue(label: "second")
        queue2.async(group: group) {
            sleep(2)
            print("Second queue")
        }
        
        let queue3 = DispatchQueue(label: "third")
        queue3.sync {
            sleep(6)
            print("Third queue")
        }
        
        group.notify(queue: DispatchQueue.main) {
            print("All executed")
            self.view.backgroundColor = .brown
        }

        print("End")
    }

    @IBAction func greenPressed(_ sender: UIButton) {
        let queue = DispatchQueue(label: "downloadimage")
        queue.async {
            sleep(5)
            
            DispatchQueue.main.async {
                self.view.backgroundColor = .green
            }
        }
    }
    
    @IBAction func redPressed(_ sender: UIButton) {
        view.backgroundColor = .red
    }
    
}
