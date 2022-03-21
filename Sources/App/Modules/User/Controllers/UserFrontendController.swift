//
//  File.swift
//  
//
//  Created by chris on 3/20/22.
//

import Vapor

struct UserFrontendController {
    private struct Input: Decodable {
        let email: String?
        let password: String?
    }
    
    private func renderSignInView(_ req: Request,
                                  _ input: Input? = nil,
                                  _ error: String? = nil) -> Response {
        let template = UserLoginTemplate(.init(icon: "⬇️",
                                               title: "Sign in",
                                               message: "Please sign in with your existing account"))
        return req.templates.renderHtml(template)
    }
    
    func signInView(_ req: Request) async throws -> Response {
        renderSignInView(req)
    }
    
    func signInAction(_ req: Request) async throws -> Response {
        /// the user is authenticated, we can store the users data inside the session
        if let user = req.auth.get(AuthenticatedUser.self) {
            req.session.authenticate(user)
            return req.redirect(to: "/")
        }
        let input = try req.content.decode(Input.self)
        return renderSignInView(req, input, "Invalud email or password.")
    }
    
    func signOut(req: Request) throws -> Response {
        req.auth.logout(AuthenticatedUser.self)
        req.session.unauthenticate(AuthenticatedUser.self)
        return req.redirect(to: "/")
    }
}

