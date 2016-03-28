//
//  DataGenerator.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

// Helper struct since we're not loading data from anywhere
struct DataGenerator {

    /* 
 
     This is kind of awful/annoying, but oh well.
     A real app would obviously load this from a server.
 
     As the requirements said, this only includes four games, 
     and statistics/data for the eight teams in those games

    */
    static var games: [Game] {

        var games = [Game]()

        let iowa = Team(name: "Iowa State")
        let iona = Team(name: "Iona")

        games.append(Game(firstTeam: iowa, secondTeam: iona, date: NSDate.dateFromString("3/17")))

        let baylor = Team(name: "Baylor")
        let yale = Team(name: "Yale")

        games.append(Game(firstTeam: baylor, secondTeam: yale, date: NSDate.dateFromString("3/17")))

        let indiana = Team(name: "Indiana")
        let chattanooga = Team(name: "Chattanooga")

        games.append(Game(firstTeam: indiana, secondTeam: chattanooga, date: NSDate.dateFromString("3/17")))

        let gonzaga = Team(name: "Gonzaga")
        let seton = Team(name: "Seton Hall")

        games.append(Game(firstTeam: gonzaga, secondTeam: seton, date: NSDate.dateFromString("3/17")))

        return games
    }
}
