//
//  ContentCoordinator.swift
//  Experiments With SwiftUI
//
//  Created by Rafael Sachetto on 09/12/19.
//  Copyright © 2019 Rafael Sachetto. All rights reserved.
//

import UIKit
import SwiftUI

final class ContentCoordinator {
    private let presenter: UINavigationController

    init(with presenter: UINavigationController) {
        self.presenter = presenter
    }
}

extension ContentCoordinator: Coordinator {
    func start() {
        let contentView: ContentView = .init()
        let controller = UIHostingController(rootView: contentView)
        controller.navigationItem.setHidesBackButton(true, animated: false)
        self.presenter.setNavigationBarHidden(false, animated: true)
        self.presenter.pushViewController(controller, animated: true)
    }
}
