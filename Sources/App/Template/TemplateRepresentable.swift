//
//  File 3.swift
//  
//
//  Created by chris on 3/19/22.
//

import Vapor
import SwiftSgml

public protocol TemplateRepresentable {
    
    @TagBuilder
    func render(_ req: Request) -> Tag
}
