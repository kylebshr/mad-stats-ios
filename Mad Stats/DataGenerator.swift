//
//  DataGenerator.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

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

        let iowa = Team(name: "Iowa State", color: UIColor(hex: "#B7173A"))
        let iona = Team(name: "Iona", color: UIColor(hex: "#702E3E"))

        games.append(Game(firstTeam: iowa, secondTeam: iona, date: NSDate.dateFromString("3/17")))

        let baylor = Team(name: "Baylor", color: UIColor(hex: "#023016"))
        let yale = Team(name: "Yale", color: UIColor(hex: "#04376A"))

        games.append(Game(firstTeam: baylor, secondTeam: yale, date: NSDate.dateFromString("3/17")))

        let indiana = Team(name: "Indiana", color: UIColor(hex: "#7C1312"))
        let chattanooga = Team(name: "Chattanooga", color: UIColor(hex: "#E0A92B"))

        games.append(Game(firstTeam: indiana, secondTeam: chattanooga, date: NSDate.dateFromString("3/17")))

        let gonzaga = Team(name: "Gonzaga", color: UIColor(hex: "#CC1931"))
        let seton = Team(name: "Seton Hall", color: UIColor(hex: "#074686"))

        games.append(Game(firstTeam: gonzaga, secondTeam: seton, date: NSDate.dateFromString("3/17")))

        return games
    }

    private static let statTitles = [
        "Team Name",
        "Key Players",
        "Points",
        "Fouls",
        "Possession Time"
    ]

    private static let keyPlayers = [
        "Iowa State": "",
        "Iona": "",
        "Baylor": "",
        "Yale": "",
        "Indiana": "",
        "Chattanooga": "",
        "Gonzaga": "",
        "Seton Hall": "",
    ]

    private static let points = [
        "Iowa State": "",
        "Iona": "",
        "Baylor": "",
        "Yale": "",
        "Indiana": "",
        "Chattanooga": "",
        "Gonzaga": "",
        "Seton Hall": "",
    ]

    private static let fouls = [
        "Iowa State": "",
        "Iona": "",
        "Baylor": "",
        "Yale": "",
        "Indiana": "",
        "Chattanooga": "",
        "Gonzaga": "",
        "Seton Hall": "",
    ]

    private static let possessions = [
        "Iowa State": "",
        "Iona": "",
        "Baylor": "",
        "Yale": "",
        "Indiana": "",
        "Chattanooga": "",
        "Gonzaga": "",
        "Seton Hall": "",
    ]

    private static var names: [String: String] {

        var teams = [String: String]()

        games.forEach {
            teams[$0.firstTeamName] = $0.firstTeamName
            teams[$0.secondTeamName] = $0.secondTeamName
        }

        return teams
    }

    private static let stats = [names, keyPlayers, points, fouls, possessions]

    static var statCount: Int {
        return statTitles.count
    }

    static func statisticForIndex(index: Int, game: Game) -> Statistic {

        let title = statTitles[index]

        let firstStat = stats[index][game.firstTeamName]!
        let secondStat = stats[index][game.secondTeamName]!

        return Statistic(title: title, firstTeam: firstStat, secondTeam: secondStat)
    }
}
