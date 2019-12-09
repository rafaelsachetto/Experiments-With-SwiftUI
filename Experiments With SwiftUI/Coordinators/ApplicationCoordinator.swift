//
//  ApplicationCoordinator.swift
//  Experiments With SwiftUI
//
//  Created by Rafael Sachetto on 08/12/19.
//  Copyright © 2019 Rafael Sachetto. All rights reserved.
//

import UIKit
import SwiftUI

protocol Coordinator {
    func start()
}

final class ApplicationCoordinator {
    private let window: UIWindow
    private let presenter: UINavigationController
    private var contentCoordinator: ContentCoordinator?

    init(with window: UIWindow) {
        self.window = window
        self.presenter = .init()
        self.window.rootViewController = presenter
    }

    private func showLaunchScreen() {
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            fatalError("Could not instantiate initial view controller from storyboard")
        }
        self.presenter.setNavigationBarHidden(true, animated: false)
        self.presenter.pushViewController(viewController, animated: true)
    }

    private func mainScreen() {
        let contentCoordinator: ContentCoordinator = .init(with: presenter)
        contentCoordinator.start()
        self.contentCoordinator = contentCoordinator
    }
}

extension ApplicationCoordinator: Coordinator {
    func start() {
        showLaunchScreen()

        DispatchQueue.main.async { [weak self] in
            self?.mainScreen()
        }
    }
}
