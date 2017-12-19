//
//  Paging.swift
//  TestandoScrollView
//
//  Created by A1 on 18/12/17.
//  Copyright © 2017 A1. All rights reserved.
//

import Foundation
import UIKit

struct Paging {
    let numberOfPages: Int
    let pageSize: Int
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    func setIndicatorPosition(containerView: UIView) {
        indicator.center.x = containerView.center.x
        indicator.center.y = -30
        containerView.addSubview(indicator)
    }
    
    func startAnimating() {
        indicator.startAnimating()
    }
    
    func stopAnimating() {
        indicator.stopAnimating()
    }
    
    func getMaxPages(totalOfItems: Int?) -> Int {
        if let totalOfItems = totalOfItems {
            if totalOfItems % pageSize == 0 {
                return totalOfItems / pageSize
            } else {
                return totalOfItems / pageSize + 1
            }
        } else {
            return 0
        }
    }


}
