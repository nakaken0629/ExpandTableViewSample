//
//  ViewController.swift
//  ExpandTableViewSample
//
//  Created by 中垣 健志 on 2015/10/25.
//  Copyright © 2015年 itvirtuoso. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var sections: [(title: String, details: [String], extended: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getSectionsValue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sections[section].extended ? sections[section].details.count : 0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Header") as? CustomHeaderFooterView
        if cell == nil {
            cell = CustomHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapHeader:"))
        }
        cell!.textLabel!.text = self.sections[section].title
        cell!.section = section
        cell!.setExpanded(self.sections[section].extended)
        return cell
    }
    
    func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CustomHeaderFooterView else {
            return
        }
        let extended = self.sections[cell.section].extended
        self.sections[cell.section].extended = !extended
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("datas")!
        cell.textLabel!.text = self.sections[indexPath.section].details[indexPath.row]
        return cell
    }
    
    // section value
    private func getSectionsValue(){
        
        var details: [String]
        for i in 1...10 {
            details = []
            details.append("details 1")
            details.append("details 2")
            details.append("details 3")
            details.append("details 4")
            details.append("details 5")
            sections.append((title: "SECTION\(i)", details: details, extended: true))
        }
    }
}
