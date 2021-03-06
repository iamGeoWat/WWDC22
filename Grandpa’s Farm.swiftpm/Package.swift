// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Grandpa’s Farm",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Grandpa’s Farm",
            targets: ["AppModule"],
            displayVersion: "1.3",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swiftui-library/scrollview-reactive-header", "1.0.1"..<"2.0.0"),
        .package(url: "https://github.com/Changemin/LoadingButton", "1.1.2"..<"2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "ScrollViewReactiveHeader", package: "scrollview-reactive-header"),
                .product(name: "LoadingButton", package: "LoadingButton")
            ],
            path: "."
        )
    ]
)
