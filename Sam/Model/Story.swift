//
//  Story.swift
//  Sam
//
//  Created by Vinícius Couto on 22/07/21.
//

import Foundation

struct Story {
    // MARK: - Variables

    // Story modifiers
    private var didSamCry: Bool = false
    private var choseVideogame: Bool = false
    private var choseSkate: Bool = false
    private var state: GameState = .start

    // MARK: - Private Variables

    private let chapterTexts: [String] = [
        Strings.Plot.birth,
        Strings.Plot.cry, Strings.Plot.reachOut,
        Strings.Plot.childhoodIfCried, Strings.Plot.childhoodIfNotCried,
        Strings.Plot.hungry,
    ]
    private let chapterChoices: [[String]] = [
        [Strings.Choices.cry, Strings.Choices.reachOut],
        [Strings.Choices.childhood],
        [Strings.Choices.videogame, Strings.Choices.actionFigure],
        [Strings.Choices.skate, Strings.Choices.bike],
        [Strings.Choices.hungry],
        [Strings.Choices.mike, Strings.Choices.sulley, Strings.Choices.boo],
    ]

    // MARK: - Public Methods

    func getText() -> String {
        switch state {
        case .start:
            return Strings.Plot.birth
        case .baby:
            return didSamCry ? Strings.Plot.cry : Strings.Plot.reachOut
        case .childhood:
            return didSamCry ? Strings.Plot.childhoodIfCried : Strings.Plot.childhoodIfNotCried
        case .choseFood:
            return Strings.Plot.hungry
        case .choseGift:
            return didSamCry ? (choseVideogame ? Strings.Plot.videogame : Strings.Plot.actionFigure) :
                (choseSkate ? Strings.Plot.skate : Strings.Plot.bike)
        case .goingHome:
            return Strings.Plot.mcDonalds
        case .end:
            return ""
        }
    }

    func getChoices() -> [String] {
        switch state {
        case .start:
            return [Strings.Choices.cry, Strings.Choices.reachOut]
        case .baby:
            return [Strings.Choices.childhood]
        case .childhood:
            return [Strings.Choices.hungry] + (didSamCry ?
                [Strings.Choices.videogame, Strings.Choices.actionFigure] :
                [Strings.Choices.skate, Strings.Choices.bike])
        case .choseFood:
            return [Strings.Choices.mike, Strings.Choices.sulley, Strings.Choices.boo]
        case .goingHome:
            return [Strings.Choices.end]
        case .choseGift:
            return [Strings.Choices.end]
        case .end:
            return []
        }
    }

    mutating func choose(option: String) {
        if option == Strings.Choices.cry || option == Strings.Choices.reachOut {
            state = .baby
        } else if option == Strings.Choices.childhood {
            state = .childhood
        } else if option == Strings.Choices.hungry {
            state = .choseFood
        } else if option == Strings.Choices.videogame || option == Strings.Choices.actionFigure || option == Strings.Choices.skate || option == Strings.Choices.bike {
            state = .choseGift
        } else if option == Strings.Choices.mike || option == Strings.Choices.sulley || option == Strings.Choices.boo {
            state = .goingHome
        } else {
            state = .end
        }

        if option == Strings.Choices.cry {
            didSamCry = true
        } else if option == Strings.Choices.videogame {
            choseVideogame = true
        } else if option == Strings.Choices.skate {
            choseSkate = true
        }
    }

    private enum GameState {
        case start
        case baby
        case childhood
        case choseFood
        case choseGift
        case goingHome
        case end
    }
}
