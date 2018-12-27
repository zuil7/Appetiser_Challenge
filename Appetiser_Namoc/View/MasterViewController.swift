//
//  MasterViewController.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var masterViewModel = MasterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            self.detailViewController!.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            self.detailViewController!.navigationItem.leftItemsSupplementBackButton = true
            detailViewController?.detailViewModel.checkUserSelected{ (response) in
                self.detailViewController?.media = response
            }
        }
        self.title = "Top Movies"
        self.setup()
    }
    
    // MARK: ALL LOGIC
    func setup(){
        self.masterViewModel.searchMedia()
        self.masterViewModel.didUpdate = { [weak self]  in
            self!.tableView.reloadData()
        }
        self.masterViewModel.hasError = { error in
            self.presentAlertWithTitle(title: APPNAME, message: error.description)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                let media = self.masterViewModel.mediaResult[indexPath.row]
                controller.detailViewModel.saveSelectedMedia(media: media, response:{ (result) in
                    controller.media = result
                })
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.masterViewModel.mediaResult.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaCell
        cell.selectionStyle = .none
        let media = self.masterViewModel.mediaResult[indexPath.row]
        cell.configureCell(media: media)
        return cell
    }

 

}

