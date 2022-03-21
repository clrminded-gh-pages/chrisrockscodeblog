//
//  File.swift
//  
//
//  Created by chris on 3/21/22.
//

@resultBuilder

public enum FormComponentBuilder {
    
    public static func buildBlock(_ components: FormComponent...) -> [FormComponent] {
        components
    }
}
