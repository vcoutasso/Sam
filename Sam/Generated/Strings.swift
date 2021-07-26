// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// Credits
  internal static let credits = Strings.tr("Localizable", "credits")
  /// New Game
  internal static let newGame = Strings.tr("Localizable", "newGame")
  /// Quit
  internal static let quit = Strings.tr("Localizable", "quit")

  internal enum Choices {
    /// You want to take a look at the newest collection of action figures.
    internal static let actionFigure = Strings.tr("Localizable", "Choices.actionFigure")
    /// You ask for a new bike to replace your old one.
    internal static let bike = Strings.tr("Localizable", "Choices.bike")
    /// Pick Boo
    internal static let boo = Strings.tr("Localizable", "Choices.boo")
    /// Childhood
    internal static let childhood = Strings.tr("Localizable", "Choices.childhood")
    /// Cry
    internal static let cry = Strings.tr("Localizable", "Choices.cry")
    /// You feel too hungry to choose right now.
    internal static let hungry = Strings.tr("Localizable", "Choices.hungry")
    /// Pick Wazowski
    internal static let mike = Strings.tr("Localizable", "Choices.mike")
    /// Reach out and grab
    internal static let reachOut = Strings.tr("Localizable", "Choices.reachOut")
    /// Your are delighted with the skateboard and go for it.
    internal static let skate = Strings.tr("Localizable", "Choices.skate")
    /// Pick Sulley
    internal static let sulley = Strings.tr("Localizable", "Choices.sulley")
    /// You want to check out the new videogame.
    internal static let videogame = Strings.tr("Localizable", "Choices.videogame")
  }

  internal enum Plot {
    /// You wake up in a warm void.\nYou feel a sudden discomfort as you're being squished and pushed.\nThen you feel hands grabbing your head and light fills your sight.\nA strong metallic scent overtakes you.\n"Sam", you hear.
    internal static let birth = Strings.tr("Localizable", "Plot.birth")
    /// On your seventh birthday your parents are looking to buy you a gift.\nThey take you to a shopping mall on the suburbs and walk around to see what interests you.
    internal static let childhoodIfCried = Strings.tr("Localizable", "Plot.childhoodIfCried")
    /// On your eighth birthday your parents are looking to buy you a gift.\nThey take you to a sports shop on the suburbs and walk around to see what interests you.
    internal static let childhoodIfNotCried = Strings.tr("Localizable", "Plot.childhoodIfNotCried")
    /// You are wrapped up in a blanket and held.\n"Oh, you're beautiful" a soft voice says.
    internal static let cry = Strings.tr("Localizable", "Plot.cry")
    /// Your parents take you to a McDonalds to eat a happy meal.
    internal static let hungry = Strings.tr("Localizable", "Plot.hungry")
    /// You grab something fleshy yet firm.\n"Ow, my nose!" a deep voice says.\nYou're turned around and lose your grasp.\nLight slaps hit your back and you start to cry.
    internal static let reachOut = Strings.tr("Localizable", "Plot.reachOut")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
