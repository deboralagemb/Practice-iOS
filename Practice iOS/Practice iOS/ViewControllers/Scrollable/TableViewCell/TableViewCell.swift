//
//  TableViewCell.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import UIKit

public class TableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private var contentLabel: UILabel!
    
    // MARK: - Initialization
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    // MARK: - Public
    public func configure(with model: SectionContentModel) {
        contentLabel.text = model.content
    }
    
}
