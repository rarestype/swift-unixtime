// swift-tools-version:6.2
import class Foundation.ProcessInfo
import CompilerPluginSupport
import PackageDescription

let package: Package = .init(
    name: "u",
    platforms: [.macOS(.v15), .iOS(.v18), .tvOS(.v18), .watchOS(.v11)],
    products: [
        .library(name: "CasesByIntegerEncodingMacro", targets: ["CasesByIntegerEncodingMacro"]),

        .library(name: "ISO", targets: ["ISO"]),
        .library(name: "UnixCalendar", targets: ["UnixCalendar"]),
        .library(name: "UnixTime", targets: ["UnixTime"])
    ],
    dependencies: [
        .package(url: "https://github.com/ordo-one/dollup", from: "1.0.1"),
    ],
    targets: [
        .target(
            name: "UnixCalendar",
            dependencies: [
                .target(name: "ISO"),
                .target(name: "UnixTime"),
            ]
        ),

        .target(name: "UnixTime"),
    ]
)

switch ProcessInfo.processInfo.environment["SWIFTPM_ENABLE_MACROS"]?.lowercased() {
case "1"?, "true"?:
    package.dependencies.append(
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "602.0.0")
    )
    package.targets.append(
        .macro(
            name: "CasesByIntegerEncoding",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            ],
            path: "Macros/CasesByIntegerEncoding"
        )
    )

    package.targets.append(
        .target(
            name: "CasesByIntegerEncodingMacro",
            dependencies: [
                .target(name: "CasesByIntegerEncoding"),
            ],
            path: "Macros/CasesByIntegerEncodingMacro",
            swiftSettings: [
                .define("ENABLE_MACROS"),
            ]
        )
    )

    package.targets.append(
        .target(
            name: "ISO",
            dependencies: [
                .target(name: "CasesByIntegerEncodingMacro"),
            ],
            exclude: [
                "ISO.Country (gen).swift",
                "ISO.Macrolanguage (gen).swift",
            ]
        )
    )

default:
    package.targets.append(
        .target(
            name: "CasesByIntegerEncodingMacro",
            path: "Macros/CasesByIntegerEncodingMacro"
        )
    )

    package.targets.append(
        .target(
            name: "ISO",
            dependencies: [
                .target(name: "CasesByIntegerEncodingMacro"),
            ],
            exclude: [
                "ISO.Country.swift",
                "ISO.Macrolanguage.swift",
            ]
        )
    )
}

for target: Target in package.targets {
    {
        var settings: [SwiftSetting] = $0 ?? []

        settings.append(.enableUpcomingFeature("InternalImportsByDefault"))
        settings.append(.enableUpcomingFeature("ExistentialAny"))

        $0 = settings
    } (&target.swiftSettings)
}
