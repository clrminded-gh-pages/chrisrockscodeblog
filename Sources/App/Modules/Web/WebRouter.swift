//
//  File.swift
//  
//
//  Created by chris on 3/19/22.
//

import Vapor

struct WebRouter: RouteCollection {
    
    let controller = WebFrontendController()

    func boot(routes: RoutesBuilder) throws {
        routes.get(use: controller.homeView)
    }
}
