import PackageDescription

let package = Package(
    name: "BasicApp",
    dependencies: [
		.Package(url: "https://github.com/nestproject/Nest.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/novi/Kunugi.git", majorVersion: 0, minor: 1),
		.Package(url: "https://github.com/nestproject/Inquiline.git", majorVersion: 0, minor: 2),
		.Package(url: "https://github.com/takebayashi/http4swift.git", majorVersion: 0, minor: 0)
    ]
)