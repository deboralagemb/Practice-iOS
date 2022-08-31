//
//  CollectionViewCell.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var contentBackgroundView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cornerRadius = contentBackgroundView.frame.height / 2
        contentBackgroundView.layer.cornerRadius = cornerRadius
        contentBackgroundView.backgroundColor = .systemCyan
    }
    
    public func configure(with model: ScrollableModel) {
        titleLabel.text = model.sectionName
    }

}
