//
//  ViewController.swift
//  Sam
//
//  Created by Vinícius Couto on 21/07/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Properties

    private var model = Story()

    private var chapterText: UILabel!
    private var choicesStackView: UIStackView!

    // MARK: - Private Methods

    private func createView() -> UIView {
        let view = UIView()

        view.backgroundColor = .black

        return view
    }

    private func createTextView() -> UILabel {
        let textView = UILabel()

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .right
        textView.text = model.currentChapterText
        textView.font = UIFont(name: "Kenney-Future-Narrow", size: 24)
//        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textColor = .white

        return textView
    }

    private func createChoiceButtons() -> [UIView] {
        model.currentChapterChoices.map { choice in
            let button = UIButton()
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitle(choice, for: .normal)
            button.contentHorizontalAlignment = .leading
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

            return button
        }
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: createChoiceButtons())
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    // MARK: - Overridden Methods

    override func loadView() {
        view = createView()

        chapterText = createTextView()
        view.addSubview(chapterText)

        choicesStackView = createStackView()
        view.addSubview(choicesStackView)

        NSLayoutConstraint.activate([
            chapterText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            chapterText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            choicesStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            choicesStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Objc Methods

    @objc func buttonTapped(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction) {
            sender.transform = CGAffineTransform.identity
        }
    }
}
