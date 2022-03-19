//
//  File.swift
//  
//
//  Created by chris on 3/19/22.
//

import Vapor

struct WebFrontendController {
    
    func homeView(req: Request) throws -> Response {
        let ctx = WebHomeContext(icon: "👋",
                                 title: "Home",
                                 message: "Hi there, welcome to my page.",
                                 paragraphs: [
                                    "My name is Christopher Liudahl-Rackley.",
                                    "A computer Science Student, expecting father, and iOS enthusiast.",
                                    "I am a certified network specialist, software engineer, and technology ambassedor.",
                                    "Coming out of the woodworks looking for an internship this summer!.",
                                 ],
                                 link: .init(label: "Read my blog →", url: "/blog/"))

        return req.templates.renderHtml(WebHomeTemplate(ctx))
    }
}
