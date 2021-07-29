// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PactSwiftToolbox",

	// MARK: - Platforms

	platforms: [
		.macOS(.v11),
		.iOS(.v12),
		.tvOS(.v12)
	],

	// MARK: - Products

	products: [
		.library(name: "PactSwiftToolbox", targets: ["PactSwiftToolbox"]),
	],

	// MARK: - Package Dependencies

	dependencies: [
	],

	// MARK: - Targets

	targets: [
		.target(
			name: "PactSwiftToolbox",
			dependencies: []
		),

		.testTarget(
			name: "PactSwiftToolboxTests",
			dependencies: [
				"PactSwiftToolbox"
			]
		),
	]

	// MARK: - Other Settings

	// swiftLanguageVersions: [.version("5")]

)
