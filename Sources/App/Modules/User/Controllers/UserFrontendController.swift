//
//  File.swift
//  
//
//  Created by chris on 3/20/22.
//

import Vapor

struct UserFrontendController {
    
    
    private func renderSignInView(_ req: Request,
                                  _ form: UserLoginForm) -> Response {
        let template = UserLoginTemplate(.init(icon: "⬇️",
                                               title: "Sign in",
                                               message: "Please sign in with your existing account",
                                               form: form.render(req: req)))
        return req.templates.renderHtml(template)
    }
    
    func signInView(_ req: Request) async throws -> Response {
        renderSignInView(req, .init())
    }
    
    func signInAction(_ req: Request) async throws -> Response {
        /// the user is authenticated, we can store the users data inside the session
        if let user = req.auth.get(AuthenticatedUser.self) {
            req.session.authenticate(user)
            return req.redirect(to: "/")
        }
        let form = UserLoginForm()
        try await form.process(req: req)
        form.error = "Invalud email or password."
        return renderSignInView(req, form)
    }
    
    func signOut(req: Request) throws -> Response {
        req.auth.logout(AuthenticatedUser.self)
        req.session.unauthenticate(AuthenticatedUser.self)
        return req.redirect(to: "/")
    }
}

