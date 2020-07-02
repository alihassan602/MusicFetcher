//
//  MusicItemTableViewCell.swift
//  Fetcher
//
//  Created by Ali Hassan on 28/06/2020.
//  Copyright © 2020 Ali Hassan. All rights reserved.
//

import UIKit

class MusicItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    public static let IDENTIFIER = "MusicItemTableViewCell"
    
    public func setupWithMusicItem(_ item: MusicItem) {
        titleLabel.text = item.trackName
    }
    
}
