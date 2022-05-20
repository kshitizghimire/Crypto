// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Coins",
	platforms: [.iOS(.v15)],
	products: [
		.library(
			name: "Coins",
			targets: ["Coins"]
		),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "Coins",
			dependencies: []
		),
		.testTarget(
			name: "CoinsTests",
			dependencies: ["Coins"]
		),
	]
)
