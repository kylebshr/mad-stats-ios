//
//  DataGenerator.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

struct DataGenerator {

    // This is kind of awful, but oh well. A real app would obviously load this from a server
    static var games: [Game] {

        var games = [Game]()

        let iowa = Team(name: "Iowa State", players: [])
        let iona = Team(name: "Iona", players: [])

        games.append(Game(firstTeam: iowa, secondTeam: iona, date: NSDate.dateFromString("3/17")))

        let baylor = Team(name: "Baylor", players: [])
        let yale = Team(name: "Yale", players: [])

        games.append(Game(firstTeam: baylor, secondTeam: yale, date: NSDate.dateFromString("3/17")))

        let indiana = Team(name: "Indiana", players: [])
        let chattanooga = Team(name: "Chattanooga", players: [])

        games.append(Game(firstTeam: indiana, secondTeam: chattanooga, date: NSDate.dateFromString("3/17")))

        let gonzaga = Team(name: "Gonzaga", players: [])
        let seton = Team(name: "Seton Hall", players: [])

        games.append(Game(firstTeam: gonzaga, secondTeam: seton, date: NSDate.dateFromString("3/17")))

        return games
    }
}
