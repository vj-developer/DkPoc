import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains DkPoc App target and DkPoc unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "DkPoc",
//                          platform: .iOS,
//                          additionalTargets: ["DkPocKit", "DkPocUI"])

let project = Project(
    name: "DkPoc",
    organizationName: "com.greymatter",
    targets: [
        Target(
            name: "DkPoc",
            platform: .iOS,
            product: .app,
            bundleId: "com.greymatter.DkPoc",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/App/Sources/**"],
            dependencies: [
                .external(name: "Alamofire"),
            ]
        ),
    ]
)

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.0.0")),
    ],
    platforms: [.iOS]
)
