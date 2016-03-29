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
        let dataViewController = R.storyboard.card.dataViewController()!

        // Set the game which we're showing data for
        dataViewController.game = games[indexPath.row]

        return dataViewController
    }

    func embedAndPresentViewController(viewController: UIViewController) {

        // Embed the view controller into a navigation controller
        let navigationController = UINavigationController(rootViewController: viewController)

        // On iPad, use a form sheet style. On iPhones, use ElegantPresentations.
        if traitCollection.horizontalSizeClass == .Regular && traitCollection.verticalSizeClass == .Regular {
            navigationController.modalPresentationStyle = .FormSheet
        } else {
            navigationController.modalPresentationStyle = .Custom
            navigationController.transitioningDelegate = self
        }

        // Present the navigation controller
        self.presentViewController(navigationController, animated: true, completion: nil)
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

        // There seems to be a bug where this isn't called on the main thread or something. This fixes it.
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            self.embedAndPresentViewController(self.viewControllerForIndexPath(indexPath))
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

        // Get the rect for the cell being pressed
        let cellRect = tableView.rectForRowAtIndexPath(indexPath)

        // Remove the cell separators from the previewing rect
        let previewRect = CGRect(x: cellRect.origin.x, y: cellRect.origin.y + 1, width: cellRect.width, height: cellRect.height - 2)

        // Set the source rect to the cell
        previewingContext.sourceRect = previewRect

        // Return a VC configured for that indexPath
        return viewControllerForIndexPath(indexPath)
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        embedAndPresentViewController(viewControllerToCommit)
    }
}
