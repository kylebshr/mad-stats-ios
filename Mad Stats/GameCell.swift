//
//  GameCell.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        highlight(selected, animated: animated)
    }

    override func setHighlighted(highlighted: Bool, animated: Bool) {
        highlight(highlighted, animated: animated)
    }

    func highlight(highlighted: Bool, animated: Bool) {

        let animations = {
            self.contentView.backgroundColor = highlighted ? UIColor(hex: "#239ceb") : UIColor(hex: "#127CC1")
        }

        animated ? UIView.animateWithDuration(0.3, animations: animations) : animations()
    }
}
