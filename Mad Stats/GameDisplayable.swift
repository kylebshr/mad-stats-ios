//
//  GameDisplayable.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

// Convenience protocol to get strings for displaying
protocol GameDisplayable {

    var firstTeamName: String { get }
    var secondTeamName: String { get }
    var dateString: String { get }
    
}
