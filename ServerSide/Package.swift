// Generated automatically by Perfect Assistant Application
// Date: 2017-04-01 20:14:44 +0000
import PackageDescription
let package = Package(
    name: "ImageLibrary",
    targets: [
		Target(
			name: "ImageLibrary",
			dependencies: [
				.Target(name: "ImageLibraryModel")
			]
		),
		Target(
			name: "ImageImportTool",
			dependencies: [
				.Target(name: "ImageLibraryModel")
			]
		),
		Target(
			name: "ImageLibraryModel",
			dependencies: []
		)
	],
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2),
        .Package(url: "https://github.com/iamjono/JSONConfig.git", majorVersion: 0),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", majorVersion: 2),
        .Package(url: "https://github.com/SwiftORM/StORM.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", majorVersion: 2),
        .Package(url: "https://github.com/iamjono/SwiftString.git", majorVersion: 1),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", majorVersion: 1),
        .Package(url: "https://github.com/SwiftORM/SQLite-StORM.git", majorVersion: 1)
    ]
)
