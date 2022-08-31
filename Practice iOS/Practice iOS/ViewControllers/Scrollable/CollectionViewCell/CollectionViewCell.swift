//
//  CollectionViewCell.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import UIKit

public class CollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet private var contentBackgroundView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: - Initialization
    override public func awakeFromNib() {
        super.awakeFromNib()
        let cornerRadius = contentBackgroundView.frame.height / 2
        contentBackgroundView.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - Public
    public func configure(with model: ScrollableModel) {
        titleLabel.text = model.sectionName
    }

}
