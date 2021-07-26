//
//  HomeViewController.swift
//  Sam
//
//  Created by Vinícius Couto on 26/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Class Properties

    private var menuStackView: UIStackView!

    // MARK: - Private Methods

    private func createView() -> UIView {
        let view = UIView()

        view.backgroundColor = .black

        return view
    }

    private func createMenuOptionView(text: String) -> UIButton {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.font = UIFont(name: "Kenney-Future-Narrow", size: 24)
        button.titleLabel?.textColor = .white

        return button
    }

    private func createStackView() -> UIStackView {
        let title = UILabel()
        title.text = "Sam"
        title.font = UIFont(name: "Kenney-Future-Narrow", size: 72)
        title.textColor = .white

        let newGame = createMenuOptionView(text: "New Game")
        newGame.addTarget(self, action: #selector(startGame), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [title, newGame])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 80
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    // MARK: - Overridden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = createView()

        menuStackView = createStackView()
        view.addSubview(menuStackView)

        NSLayoutConstraint.activate([
            menuStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
            menuStackView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            menuStackView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            menuStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -100),
        ])
    }

    // MARK: - Objc Methods

    @objc private func startGame(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 2,
                       options: .allowUserInteraction) {
            sender.transform = CGAffineTransform.identity
        }

        showDetailViewController(GameViewController(), sender: self)
    }
}
