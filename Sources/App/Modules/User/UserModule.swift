//
//  File.swift
//  
//
//  Created by chris on 3/20/22.
//

import Vapor

struct UserModule: ModuleInterface {
    
    let router = UserRouter()
    
    func boot(_ app: Application) throws {
        app.migrations.add(UserMigratons.v1())
        app.migrations.add(UserMigratons.seed())
        
        app.middleware.use(UserSessionAuthenticator())
        
        try router.boot(routes: app.routes)
    }
}
