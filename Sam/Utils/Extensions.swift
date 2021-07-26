//
//  Extensions.swift
//  Sam
//
//  Created by Vinícius Couto on 26/07/21.
//

import UIKit

extension UILabel {
    // Reference: https://stackoverflow.com/a/51879935
    func setTyping(text: String, characterDelay: TimeInterval = 3) {
        self.text = ""

        let writingTask = DispatchWorkItem { [weak self] in
            text.forEach { char in
                DispatchQueue.main.async {
                    self?.text?.append(char)
                }
                Thread.sleep(forTimeInterval: characterDelay / 100)
            }
        }

        let queue: DispatchQueue = .init(label: "typespeed", qos: .userInteractive)
        queue.asyncAfter(deadline: .now() + 0.05, execute: writingTask)
    }
}
