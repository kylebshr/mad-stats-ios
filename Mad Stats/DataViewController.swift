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

    func setUpUI() {

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataGenerator.statCount
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.statCell)!
        let stat = DataGenerator.statisticForIndex(indexPath.row, game: game)

        cell.setUpWithStatistic(stat, forGame: game)
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .whiteColor() : .groupTableViewBackgroundColor()

        return cell
    }
}
