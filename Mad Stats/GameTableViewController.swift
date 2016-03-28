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

    // Generated for the sake of this app; could easily be loaded from a backend
    var games = DataGenerator.games

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    // Set up a few things UI related
    func setUpUI() {

        registerForPreviewingWithDelegate(self, sourceView: tableView)

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }

    // We create a view controller based on an index path in a few places, so this is convenient
    func viewControllerForIndexPath(indexPath: NSIndexPath) -> UIViewController {

        // Initialize from R.swift, safe to force unwrap — we want to crash if there's no VC there
        let dataNavigationController = R.storyboard.card.initialViewController()!
        let dataViewController = dataNavigationController.viewControllers.first as! DataViewController

        // Set the custom presentation properties
        dataNavigationController.modalPresentationStyle = .Custom
        dataNavigationController.transitioningDelegate = self

        // Set the game which we're showing data for
        dataViewController.game = games[indexPath.row]

        return dataNavigationController
    }

    @IBAction func unwindToGames(segue: UIStoryboardSegue) {

        // When we unwind, we deselect any cells — animated shows the user where they were
        tableView.indexPathsForSelectedRows?.forEach {
            tableView.deselectRowAtIndexPath($0, animated: true)
        }
    }


    /* UITableViewDelegate and UITableViewDataSource methods */


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // If we can't deque this cell, let's crash, R.swift should make sure that doesn't happen!
        let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.gameCell)!

        // Set up the game info
        cell.setUpWithGame(games[indexPath.row])

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        // There seems to be a bug where this isn't called on the main thread and sometimes lags
        dispatch_async(dispatch_get_main_queue()) {

            // Present a DataViewController created for the index path
            self.presentViewController(self.viewControllerForIndexPath(indexPath), animated: true, completion: nil)
        }
    }
}

extension GameTableViewController: UIViewControllerTransitioningDelegate {

    // Conform to transtion delegate for ElegantPresentations
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {

        return ElegantPresentations.controller(presentedViewController: presented, presentingViewController: presenting, options: [])
    }
}

// Yay 3D Touch! :D
extension GameTableViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        // Make sure we tapped a cell and grab the indexPath
        guard let indexPath = tableView.indexPathForRowAtPoint(location) else {
            return nil
        }

        // Set the source rect to the cell
        previewingContext.sourceRect = tableView.rectForRowAtIndexPath(indexPath)

        // Return a VC configured for that indexPath
        return viewControllerForIndexPath(indexPath)
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        presentViewController(viewControllerToCommit, animated: true, completion: nil)
    }
}