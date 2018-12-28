//
//  MasterViewController.swift
//  Appetiser_Namoc
//
//  Created by Louise Nicolas Namoc on 24/12/2018.
//  Copyright © 2018 Louise Nicolas Namoc. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var masterViewModel = MasterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.restorationIdentifier = "MasterViewController"
        self.title = "Top Movies"
        self.setup()
    }
    
    // MARK: ALL LOGIC
    func setup(){
        NVActivityIndicatorView.showActivityIndicator(message: "", size: CGFloat(INDICATORSIZE), color: UIColor.red)
        self.masterViewModel.searchMedia()
        self.masterViewModel.didUpdate = { [weak self]  in
            NVActivityIndicatorView.hideActivityIndicator()
            self!.tableView.reloadData()
        }
        self.masterViewModel.hasError = { error in
            self.presentAlertWithTitle(title: APPNAME, message: error.description)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = (UIStoryboard.SB_LoadBoard(boardName: bMain, storyBoardID: VC.vc_DetailViewController) as! DetailViewController)
        detailViewController.modalPresentationStyle = .overCurrentContext
        let media = self.masterViewModel.mediaResult[indexPath.row]
        detailViewController.detailViewModel.saveSelectedMedia(media: media, response:{ (result) in
            detailViewController.media = result
        })
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}

//  MARK:- UIViewControllerRestoration
extension MasterViewController{
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }
   
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }
    override func applicationFinishedRestoringState() {
        self.tableView.reloadData()

    }
}
