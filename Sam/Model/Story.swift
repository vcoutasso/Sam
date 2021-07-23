//
//  Story.swift
//  Sam
//
//  Created by Vinícius Couto on 22/07/21.
//

import Foundation

struct Story {
    var currentChapter: Int = 0

    var currentChapterText: String {
        chapterTexts[currentChapter]
    }

    var currentChapterChoices: [String] {
        chapterChoices[currentChapter]
    }

    private let chapterTexts: [String] = ["My text here"]
    private let chapterChoices: [[String]] = [["First option", "Second option"]]

    // Story modifiers
    var didSamCry: Bool = false
}
