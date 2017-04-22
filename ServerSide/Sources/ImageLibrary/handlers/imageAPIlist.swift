//
//  imageAPIlist.swift
//  ImageLibrary
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectHTTP
import ImageLibraryModel

extension Handlers {
    /// Image Listing as JSON
    static func imageAPIlist(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

			let imgs = ImageFile()
			do {
				try imgs.findAll()
				_ = try response.setBody(json: ["images": Handlers.nestedDataDict(imgs.rows())])
			} catch {
				Handlers.error(request, response, error: "\(error)", code: .badRequest)
			}
            response.completed()
        }
    }
}
