//
//  StatCell.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

class StatCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var firstTeamLabel: UILabel!
    @IBOutlet var secondTeamLabel: UILabel!

    // Helper function to set up all the labels based on a game
    func setUpWithStatistic(stat: Statistic, forGame game: Game, atIndex indexPath: NSIndexPath) {

        // Set all the titles and team colors
        titleLabel.text = stat.title

        firstTeamLabel.text = stat.firstTeam
        firstTeamLabel.textColor = game.firstTeam.color

        secondTeamLabel.text = stat.secondTeam
        secondTeamLabel.textColor = game.secondTeam.color

        // Alternate color between white and grey
        contentView.backgroundColor = indexPath.row % 2 == 0 ? .whiteColor() : .groupTableViewBackgroundColor()
    }
}
