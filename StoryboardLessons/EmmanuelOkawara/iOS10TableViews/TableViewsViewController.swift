//
//  TableViewsViewController.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 1/30/23.
//

import UIKit

class TableViewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Animals", "Fruits", "Cars"]
    let rows: [[String]] = [
        ["Lion", "Tiger", "Dog", "Wolf"],
        ["Apple", "Orange"],
        ["Audi", "Ferrari", "Ford"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension TableViewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        let title = rows[indexPath.section][indexPath.row]
        cell.textLabel?.text = title
        cell.imageView?.image = #imageLiteral(resourceName: "logo1")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}

extension TableViewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You Selected: \(rows[indexPath.section][indexPath.row])")
    }
    
}
class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
}
