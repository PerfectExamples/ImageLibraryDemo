//
//  Images.swift
//  ImageLibrary
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectLib
import SQLiteStORM
import StORM

/// Image library storage
public class ImageFile: SQLiteStORM {

    // Properties
    /// Row ID
    public var id = 0

    /// Name
    public var name = ""

    /// Path to image
    public var path = ""

    /// Width of image
    public var width = 0

    /// Height of image
    public var height = 0


    // ORM helper method
    override public func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        name = this.data["name"] as? String ?? ""
        path = this.data["path"] as? String ?? ""
        width = this.data["width"] as? Int ?? 0
        height = this.data["height"] as? Int ?? 0
    }

    // ORM helper method
    public func rows() -> [ImageFile] {
        var rows = [ImageFile]()
        for i in 0..<self.results.rows.count {
            let row = ImageFile()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }

}
