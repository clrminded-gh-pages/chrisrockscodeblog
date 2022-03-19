//
//  File 2.swift
//  
//
//  Created by chris on 3/19/22.
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
