//
//  File.swift
//  
//
//  Created by chris on 3/20/22.
//

public struct FormContext {
    public var action: FormAction
    public var fields: [TemplateRepresentable]
    public var error: String?
    public var submit: String?
}
