//
//  initializeObjects.swift
//  ImageLibrary
//
//  Created by Jonathan Guthrie on 2017-02-20.
//  Copyright (C) 2017 PerfectlySoft, Inc.
//
//  Modified by Clingon: https://github.com/iamjono/clingon
//
import PerfectLib
import ImageLibraryModel
import Foundation
import SQLiteStORM

SQLiteConnector.db = "./imagesdb"

var webrootDirectory: String? = nil
var sourceDirectory: String? = nil

var args = CommandLine.arguments.makeIterator()
var currArg = args.next()

func usage() {
	print("Usage: \(CommandLine.arguments.first!) [--webroot webroot_dir] [--source source_dir]")
	exit(0)
}

func argFirst() -> String {
	currArg = args.next()
	guard let frst = currArg else {
		print("Argument requires value.")
		exit(-1)
	}
	return frst
}

func argOptBoolean() -> Bool {
	currArg = args.next()
	guard let _ = currArg else {
		return false
	}
	return true
}

let validArgs = [
	"--webroot": {
		webrootDirectory = argFirst()
	},
	"--source": {
		sourceDirectory = argFirst()
	},
	"--help": {
		usage()
	}]

while let arg = currArg {
	if let closure = validArgs[arg.lowercased()] {
		closure()
	}
	currArg = args.next()
}

guard let srcs = sourceDirectory, let webroot = webrootDirectory else {
	usage()
	exit(0)
}

// run setup
let imgSetup = ImageFile()
try? imgSetup.setup()


let d = Dir(webroot+srcs)
do {
	try d.forEachEntry{
		f in
		let img = ImageFile()
		img.name = f
		img.path = srcs
		try runProc("identify", args: ["-format", "%w,%h", "\(webroot)\(srcs)/\(f)"]) {
			r in
			let dimensions = r.components(separatedBy: ",")
			img.width = Int(dimensions[0]) ?? 0
			img.height = Int(dimensions[1]) ?? 0
		}
		try img.save()
		print("Imported \(srcs)/\(img.name)")
	}
} catch {
	print(error)
	exit(0)
}



