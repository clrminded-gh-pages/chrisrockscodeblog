//
//  File 3.swift
//  
//
//  Created by chris on 3/20/22.
//

import Foundation

extension Blog {

    enum Category {
        
    }
}

extension Blog.Category {
    
    struct List: Codable {
        let id: UUID
        let title: String
    }
}
