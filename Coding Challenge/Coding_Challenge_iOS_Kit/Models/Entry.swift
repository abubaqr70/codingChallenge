//
//  Entries.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

struct Entry: Identifiable,Equatable {
    let id: UUID
    let title: String
    let content: String
    let priority: Priority
    
    init(id: UUID, title: String, content: String, priority: Priority) {
        self.id = id
        self.title = title
        self.content = content
        self.priority = priority
    }
}

enum Priority: Int {
    case low = 0
    case medium = 1
    case high = 2
}
