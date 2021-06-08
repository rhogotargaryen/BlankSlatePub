//
//  CollectionViewCell.swift
//  CollectionDemo
//
//  Copyright © 2019 Nativo. All rights reserved.
//

import UIKit
import NativoSDK

class PubCollectionViewCell: UICollectionViewCell, NtvAdInterface {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewTextLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var sponsoredContentLabel: UILabel!
    @IBOutlet weak var sponsoredIndicator: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sponsoredContentLabel.isHidden = true
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentView.leftAnchor.constraint(equalTo: leftAnchor),
            self.contentView.rightAnchor.constraint(equalTo: rightAnchor),
            self.contentView.topAnchor.constraint(equalTo: topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    
    
    func displaySponsoredIndicators(_ isSponsored: Bool) {
        if isSponsored {
            self.contentView.backgroundColor = UIColor.lightGray
            self.sponsoredContentLabel.textColor = UIColor.white
            self.sponsoredContentLabel.isHidden = false
            print(self.sponsoredContentLabel.textColor)
        } else {
            self.contentView.backgroundColor = UIColor.white
            self.sponsoredContentLabel.isHidden = true
            print("not sponsored")
        }
    }
}


