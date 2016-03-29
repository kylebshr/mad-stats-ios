//
//  GameCell.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet var firstTeamLabel: UILabel!
    @IBOutlet var secondTeamLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Annoying, but iPad doesn't respect this being set in IB
        backgroundColor = .clearColor()
    }

    // Override this for custom selection color
    override func setSelected(selected: Bool, animated: Bool) {
        highlight(selected, animated: animated)
    }

    // Override this for custom highlight color
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        highlight(highlighted, animated: animated)
    }

    // Called by setHighlighted or setSelected to show hightlighting or selecting
    func highlight(highlighted: Bool, animated: Bool) {

        // Put these in a block in case we have more at some point
        let animations = {
            self.contentView.backgroundColor = highlighted ? UIColor(hex: "#239ceb") : UIColor(hex: "#127CC1")
        }

        // Perform the changes with appropiate animation
        animated ? UIView.animateWithDuration(0.3, animations: animations) : animations()
    }

    // Helper function to set up all the labels based on a game
    func setUpWithGame(game: Game) {
        firstTeamLabel.text = game.firstTeamName
        secondTeamLabel.text = game.secondTeamName
        dateLabel.text = game.dateString
    }
}
