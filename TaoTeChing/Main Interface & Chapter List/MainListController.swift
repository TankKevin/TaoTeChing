//
//  ViewController.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/9/21.
//  Copyright © 2018年 Tan Kevin. All rights reserved.
//

import UIKit

class MainListController: UIViewController, UITableViewDelegate {
    
    
    

    @IBOutlet var listView: UITableView!
    var taoList: Taolist!
    
    
    override func viewWillAppear(_ animated: Bool) {
        listView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        print("MainListController viewDidLoad")
        listView.dataSource = taoList
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favAction = UIContextualAction(style: .normal, title: self.taoList.list[indexPath.row].favorite ? "取消收藏" : "收藏") { (action, sourceView, completionHandler) in
            let newState = !(self.taoList.list[indexPath.row].favorite)
            self.taoList.list[indexPath.row].favorite = newState
            let cell = tableView.cellForRow(at: indexPath) as! ChapterCell
            
            cell.favIcon.isHidden = !newState
            
            

            completionHandler(true)
        }
        favAction.backgroundColor = themeColor
        
        return UISwipeActionsConfiguration(actions: [favAction])

    }
    
    // Make no trailing swipe action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavi = segue.destination as! UINavigationController
        let destination = destinationNavi.topViewController as! ChapterDetailController
        destination.number = (listView.indexPathForSelectedRow?.row)!
        destination.taoList = taoList
        
        listView.deselectRow(at: listView.indexPathForSelectedRow!, animated: false)
    }

}
/*
// Peek and pop
extension MainListController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        guard let indexPath = activityListCollectionView.indexPathForItem(at: location), let cell = activityListCollectionView.cellForItem(at: indexPath) as? ActivityListCollectionViewCell else { return nil }
//        let actid = cell.model?.actid
//        previewingContext.sourceRect = cell.frame
//        guard let detailTableViewController = storyboard?.instantiateViewController(withIdentifier: "ActivityDetailTableViewController") as? ActivityDetailTableViewController else { return nil }
//        detailTableViewController.set(Activity(actid: actid!))
//        return detailTableViewController
        
//        guard let indexPath = listView.indexPathForRow(at: location), let cell = listView.cellForRow(at: indexPath) as? ChapterCell else { return nil }
//        previewingContext.sourceRect = cell.frame
        print("get")
        guard let chapterDetailController = storyboard?.instantiateViewController(withIdentifier: "ChapterDetailController") as? ChapterDetailController else { return nil }
        print("run")
        return chapterDetailController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
}

*/
