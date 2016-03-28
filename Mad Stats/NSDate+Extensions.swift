//
//  NSDate+Extensions.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import Foundation

extension NSDate {

    // Convience method for adding dates to games
    static func dateFromString(string: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "M/dd"
        return formatter.dateFromString(string) ?? NSDate()
    }
}
