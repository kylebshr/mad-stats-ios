//
//  Game.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

struct Game {

    let firstTeam: Team
    let secondTeam: Team
    let date: NSDate

}

extension Game: GameDisplayable {

    var firstTeamName: String {
        return firstTeam.name
    }

    var secondTeamName: String {
        return secondTeam.name
    }

    var dateString: String {

        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM d"

        return formatter.stringFromDate(date).uppercaseString
    }
}
