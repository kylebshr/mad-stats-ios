//
//  DataGenerator.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

/* 
 Since we're not loading data from anywhere, had to 
 make this. Trying out a no-case enum, since this 
 should never be instantiated.

 Please don't judge me based on this, I don't usually
 have to hardcode a bunch of static data so there might
 be a much better way to do this :P
*/
enum DataGenerator {

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
        "Team",
        "Points Offense",
        "Points Defense",
        "Fouls",
        "Free Throws Made",
        "Field Goal Percent"
    ]

    private static let pointsOffense = [
        "Iowa State": "2,862",
        "Iona": "2,628",
        "Baylor": "2,621",
        "Yale": "2,248",
        "Indiana": "2,891",
        "Chattanooga": "2,652",
        "Gonzaga": "2,840",
        "Seton Hall": "2,522",
    ]

    private static let pointsDefense = [
        "Iowa State": "1,903",
        "Iona": "2,053",
        "Baylor": "1,824",
        "Yale": "1,830",
        "Indiana": "2,038",
        "Chattanooga": "1,238",
        "Gonzaga": "2,140",
        "Seton Hall": "2,031",
    ]

    private static let fouls = [
        "Iowa State": "536",
        "Iona": "420",
        "Baylor": "529",
        "Yale": "429",
        "Indiana": "509",
        "Chattanooga": "628",
        "Gonzaga": "539",
        "Seton Hall": "581",
    ]

    private static let freeThrows = [
        "Iowa State": "788",
        "Iona": "931",
        "Baylor": "830",
        "Yale": "734",
        "Indiana": "802",
        "Chattanooga": "918",
        "Gonzaga": "791",
        "Seton Hall": "937",
        ]

    private static let goals = [
        "Iowa State": "46.9%",
        "Iona": "42.1%",
        "Baylor": "40.8%",
        "Yale": "49.3%",
        "Indiana": "38.5%",
        "Chattanooga": "43.4%",
        "Gonzaga": "39.0%",
        "Seton Hall": "43.2%",
    ]

    private static var names: [String: String] {

        var teams = [String: String]()

        games.forEach {
            teams[$0.firstTeamName] = $0.firstTeamName
            teams[$0.secondTeamName] = $0.secondTeamName
        }

        return teams
    }

    private static let stats = [names,  pointsOffense, pointsDefense, fouls, freeThrows, goals]

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
