//
//  TableViewCell.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    public func configure(with model: SectionContentModel) {
        contentLabel.text = model.content
    }
    
}
