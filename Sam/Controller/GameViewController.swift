//
//  GameViewController.swift
//  Sam
//
//  Created by Vinícius Couto on 21/07/21.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: - Class Properties

    private var model = Story()

    private var chapterText: UILabel!
    private var choices = [UIButton]()
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
        textView.textAlignment = .left
        textView.numberOfLines = 0
        textView.setTyping(text: model.getText())
        textView.font = UIFont(name: "Kenney-Future-Narrow", size: 24)
        textView.textColor = .white

        return textView
    }

    private func createChoiceButtons() -> [UIButton] {
        model.getChoices().map { choice in
            let button = UIButton()
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitle(choice, for: .normal)
            button.titleLabel?.textAlignment = .left
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.font = UIFont(name: "Kenney-Future-Narrow", size: 24)
            button.contentHorizontalAlignment = .leading
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

            return button
        }
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: choices)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    private func updateView() {
        if chapterText != nil {
            chapterText.removeFromSuperview()
        }
        if choicesStackView != nil {
            choicesStackView.removeFromSuperview()
        }

        choices = createChoiceButtons()
        chapterText = createTextView()
        view.addSubview(chapterText)

        choicesStackView = createStackView()
        view.addSubview(choicesStackView)

        NSLayoutConstraint.activate([
            chapterText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            chapterText.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            chapterText.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            choicesStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            choicesStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            choicesStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -60),
        ])
    }

    // MARK: - Overridden Methods

    override func loadView() {
        view = createView()

        updateView()
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

        if model.getChoices().first! == Strings.Choices.end {
            dismiss(animated: true)
        }

        model.choose(option: sender.titleLabel?.text! ?? "")
        updateView()
    }
}
