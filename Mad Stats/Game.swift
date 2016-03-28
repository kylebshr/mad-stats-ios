//
//  Game.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

// A game holds the two teams playing and a date for the game
struct Game {

    let firstTeam: Team
    let secondTeam: Team
    let date: NSDate

}

// Convenience protocol to get strings for displaying
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
