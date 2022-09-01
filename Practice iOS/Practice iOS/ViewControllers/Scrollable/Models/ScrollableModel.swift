//
//  ScrollableModel.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import Foundation

public struct ScrollableModel {
    var sectionName: String
    var sectionContent: [SectionContentModel]
    var isSelected: Bool
    
    init(sectionName: String, sectionContent: [SectionContentModel], isSelected: Bool) {
        self.sectionName = sectionName
        self.sectionContent = sectionContent
        self.isSelected = isSelected
    }
}

public struct SectionContentModel {
    var content: String

    init(content: String) {
        self.content = content
    }
}
