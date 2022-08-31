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
    
    init(sectionName: String, sectionContent: [SectionContentModel]) {
        self.sectionName = sectionName
        self.sectionContent = sectionContent
    }
}

public struct SectionContentModel {
    var content: String

    init(content: String) {
        self.content = content
    }
}
