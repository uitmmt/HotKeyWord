//
//  ViewController.swift
//  HotKeyWord
//
//  Created by Thinh on 6/27/19.
//  Copyright © 2019 Thinh. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    
    @IBOutlet weak var key_word_collectionview: UICollectionView!
    
    var keywords = [Keyword]()
    
    let colors = ["#16702e", "#005a51", "#996c00", "#5c0a6b", "#006d90", "#974e06", "#99272e", "#89221f", "#00345d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        key_word_collectionview.register(UINib.init(nibName: "KeyWordCell", bundle: nil), forCellWithReuseIdentifier: "KeyWordCell")
        key_word_collectionview.delegate = self
        key_word_collectionview.dataSource = self
        
        getKeyWord()
    }
    
    func getKeyWord() {
        API.share.getKeyWord { (result) in
            switch result {
            case .success(let keyResponse):
                self.keywords = keyResponse.keywords
                self.key_word_collectionview.reloadData()
            case .failed( _):
                break
            }
        }
    }


}
extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let str = keywords[indexPath.item].keyword
        var w = CGFloat()
        if (str.range(of: " ") != nil) {
            w = (keywords[indexPath.item].keyword as NSString).size(withAttributes: nil).width/CGFloat(2)
        }else {
            w = (keywords[indexPath.item].keyword as NSString).size(withAttributes: nil).width
        }
        return CGSize(width: w + 40, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyWordCell", for: indexPath) as! KeyWordCollectionViewCell
        let key = keywords[indexPath.item]
        cell.key = key.keyword
        cell.icon_imageView.sd_setImage(with: URL(string: key.icon), placeholderImage: UIImage.init(named: ""))
        cell.keyword_label.backgroundColor = UIColor().hexStringToUIColor(hex: colors[indexPath.item%colors.count])
        return cell
    }
}



