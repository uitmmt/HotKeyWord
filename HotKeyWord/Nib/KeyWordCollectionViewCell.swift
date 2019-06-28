//
//  KeyWordCollectionViewCell.swift
//  HotKeyWord
//
//  Created by Thinh on 6/27/19.
//  Copyright © 2019 Thinh. All rights reserved.
//

import UIKit

class KeyWordCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var keyword_label: UILabel!
    @IBOutlet weak var icon_imageView: UIImageView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var key = String() {
        didSet {
            if (key.range(of: " ") != nil) {
                keyword_label.numberOfLines = 2
            }else {
                keyword_label.numberOfLines = 1
            }
            keyword_label.lineBreakMode = .byWordWrapping
            keyword_label.text = key
//            keyword_label.sizeToFit()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.layoutIfNeeded()
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        heightConstraint.constant = 400
        keyword_label.layer.cornerRadius = 5
        keyword_label.layer.masksToBounds = true
        
//        icon_imageView.contentMode = .scaleAspectFit
//        icon_imageView.layer.masksToBounds = true
    }
}
