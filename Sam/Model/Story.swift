//
//  Story.swift
//  Sam
//
//  Created by Vinícius Couto on 22/07/21.
//

import Foundation

struct Story {
    // MARK: - Variables

    var currentChapter: Int = 0

    // Story modifiers
    var didSamCry: Bool = false

    // MARK: - Computed Variables

    var currentChapterText: String {
        chapterTexts[currentChapter]
    }

    var currentChapterChoices: [String] {
        chapterChoices[currentChapter]
    }

    // MARK: - Private Variables

    private let chapterTexts: [String] = [
        Strings.Plot.birth,
        Strings.Plot.cry,
        Strings.Plot.reachOut,
        Strings.Plot.childhoodIfCried,
        Strings.Plot.childhoodIfNotCried,
        Strings.Plot.hungry,
    ]
    private let chapterChoices: [[String]] = [
        [Strings.Choices.cry, Strings.Choices.reachOut],
        [Strings.Choices.childhood],
        [Strings.Choices.videogame, Strings.Choices.actionFigure],
        [Strings.Choices.skate, Strings.Choices.bike],
        [Strings.Choices.hungry],
        [Strings.Choices.mike, Strings.Choices.sulley, Strings.Choices.mike],
    ]
}
