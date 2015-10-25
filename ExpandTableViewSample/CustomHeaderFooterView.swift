//
//  CustomHeaderFooterView.swift
//  ExpandTableViewSample
//
//  Created by 中垣 健志 on 2015/10/25.
//  Copyright © 2015年 itvirtuoso. All rights reserved.
//

import UIKit

class CustomHeaderFooterView: UITableViewHeaderFooterView {
    private var arrow = UIImageView()
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.arrow.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.arrow)
        self.addConstraints([
            NSLayoutConstraint(item: arrow, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -8),
            NSLayoutConstraint(item: arrow, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(expanded: Bool) {
        arrow.image = UIImage(named: expanded ? "ArrowUp" : "ArrowDown")
    }
}
