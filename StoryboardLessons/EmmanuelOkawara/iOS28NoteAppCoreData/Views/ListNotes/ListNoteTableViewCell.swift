//
//  ListNoteTableViewCell.swift
//  SwiftLessonsPlaylist
//
//  Created by Prince Avecillas on 3/18/23.
//

import Foundation
import UIKit

class ListNoteTableViewCell: UITableViewCell {

    static let identifier = "ListNoteTableViewCell"
    
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var descriptionLbl: UILabel!
    
    func setup(note: Note) {
        titleLbl.text = note.title
        descriptionLbl.text = note.desc
    }
}
