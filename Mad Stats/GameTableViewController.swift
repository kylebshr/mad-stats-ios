//
//  ViewController.swift
//  Mad Stats
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import UIKit
import ElegantPresentations

class GameTableViewController: UITableViewController {

    var games = [Game]()

    override func viewDidLoad() {
        super.viewDidLoad()

        games = DataGenerator.games

        setUpUI()
    }

    func setUpUI() {

        registerForPreviewingWithDelegate(self, sourceView: tableView)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }

    func viewControllerForIndexPath(indexPath: NSIndexPath) -> UIViewController {

        let dataNavigationController = R.storyboard.card.initialViewController()!
        let dataViewController = dataNavigationController.viewControllers.first as! DataViewController

        dataNavigationController.modalPresentationStyle = .Custom
        dataNavigationController.transitioningDelegate = self

        dataViewController.game = games[indexPath.row]

        return dataNavigationController
    }

    @IBAction func unwindToGames(segue: UIStoryboardSegue) {

        tableView.indexPathsForSelectedRows?.forEach {
            tableView.deselectRowAtIndexPath($0, animated: true)
        }
    }
}

extension GameTableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCellWithIdentifier(GameCell.identifier) as? GameCell else {
            return UITableViewCell()
        }

        let game = games[indexPath.row]

        cell.firstTeamLabel.text = game.firstTeamName
        cell.secondTeamLabel.text = game.secondTeamName
        cell.dateLabel.text = game.dateString

        return cell
    }
}

extension GameTableViewController {

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dispatch_async(dispatch_get_main_queue()) {
            self.presentViewController(self.viewControllerForIndexPath(indexPath), animated: true, completion: nil)
        }
    }
}

extension GameTableViewController: UIViewControllerTransitioningDelegate {

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return ElegantPresentations.controller(presentedViewController: presented, presentingViewController: presenting, options: [])
    }
}

extension GameTableViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        guard let indexPath = tableView.indexPathForRowAtPoint(location) else {
            return nil
        }

        previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)

        return viewControllerForIndexPath(indexPath)
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        presentViewController(viewControllerToCommit, animated: true, completion: nil)
    }
}
