//
//  DataViewController.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController {

    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    // Set up a few things UI related
    func setUpUI() {

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }

    /* UITableViewDataSource methods */
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataGenerator.statCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Grab a cell and stat (unit tests will catch if R can't find the cell for some reason)
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.statCell)!
        let stat = DataGenerator.statisticForIndex(indexPath.row, game: game)

        // Set it up, and give it the index so it can alternate its coloring
        cell.setUpWithStatistic(stat, forGame: game, atIndex: indexPath)

        return cell
    }
}
