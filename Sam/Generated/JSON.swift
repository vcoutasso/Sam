// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum Plot {
    private static let _document = JSONDocument(path: "plot.json")

    internal static let abcde: [String] = _document["abcde"]
    internal static let `as`: String = _document["as"]
}

// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func objectFromJSON<T>(at path: String) -> T {
    guard let url = BundleToken.bundle.url(forResource: path, withExtension: nil),
          let json = try? JSONSerialization.jsonObject(with: Data(contentsOf: url), options: []),
          let result = json as? T
    else {
        fatalError("Unable to load JSON at path: \(path)")
    }
    return result
}

private struct JSONDocument {
    let data: [String: Any]

    init(path: String) {
        data = objectFromJSON(at: path)
    }

    subscript<T>(key: String) -> T {
        guard let result = data[key] as? T else {
            fatalError("Property '\(key)' is not of type \(T.self)")
        }
        return result
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
