//
//  ChapterDetailController.swift
//  TaoTeChing
//
//  Created by 谭凯文 on 2018/10/1.
//  Copyright © 2018 Tan Kevin. All rights reserved.
//

import UIKit

class ChapterDetailController: UITableViewController, UITextViewDelegate {
    var number = 0
    var taoList: Taolist!

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("ChapterDetailController viewDidLoad")
//        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//        print(tableView.headerView(forSection: 0)?.contentView.backgroundColor)
//        statusBar.backgroundColor = tableView.headerView(forSection: 0)?.contentView.backgroundColor
        
        navigationItem.title = (number + 1).chineseChapterWithSpace(3)
        
        navigationController?.navigationBar.tintColor = themeColor
    }

    // MARK: - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
//            let header = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
//            header.text = "   读经"
//            header.font = UIFont.preferredFont(forTextStyle: .footnote).withSize(8)
//            header.textColor = UIColor.darkGray
            let header = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as! HeaderView
            header.label.text = "读经"
            
            return header
            
//            let header = UITableViewHeaderFooterView()
//            header.textLabel?.text = "fsdjifghsdl"
//            header.textLabel?.font = UIFont.systemFont(ofSize: 5)
//            return header
        case 1:
            let header = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as! HeaderView
            header.label.text = "悟道"
            
            return header
//            let header = UITableViewHeaderFooterView()
//            header.textLabel?.text = "fdfasfa"
//
//            header.textLabel?.font = UIFont.systemFont(ofSize: 5)
//            print(header.textLabel?.font)
//
//            return header
        default:
            return UITableViewHeaderFooterView()
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OriginalCell", for: indexPath) as! RTextCell
                cell.textView.text = taoList.list[number].origin
                //            cell.textLabel?.text = "dfsdfsdf"
                //            print(cell.textView.text)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TranslationCell", for: indexPath) as! RTextCell
                cell.textView.text = taoList.list[number].translation
                return cell
            default:
                return UITableViewCell()
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! RWTextCell
            
            // Read file if exists
            cell.textView.text = readString(ofFile: "Chapter\(number + 1).txt")
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
//            print("height is \(tableView.frame.height)")
            return UITableView.automaticDimension
        default:
//            print(tableView.safeAreaInsets.top)
            return 300
        }

    }
    
    // MARK: - Actions
    
    @IBAction func dismissSelf() {
        
        // Save information to a file named by chapter number
        let text = (tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! RWTextCell).textView.text
        writeString(text ?? "", toFile: "Chapter\(number + 1).txt")
        
        dismiss(animated: true, completion: nil)
    }

    

    @IBAction func keyboardDown() {
        (tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! RWTextCell).textView.resignFirstResponder()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    
    @IBAction func showShareActions() {
        
        let favActivity = FavoriteActivity(number: number, taoList: taoList)
        
        let cellOfText = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! RWTextCell
        let text = (cellOfText.textView.text)!
        let profile = """
            「读经」
            \(taoList.list[number].origin)
            \(taoList.list[number].translation)\n
            「悟道」
            \(text)
            """
        let activityController = UIActivityViewController(activityItems: [profile], applicationActivities: [favActivity])
        activityController.excludedActivityTypes = [.mail, .message, .addToReadingList, .airDrop, .assignToContact, .copyToPasteboard]
        
        
        present(activityController, animated: true)
    }
    
    
    // MARK: - Text view delegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Text view began editing")
    }

}
