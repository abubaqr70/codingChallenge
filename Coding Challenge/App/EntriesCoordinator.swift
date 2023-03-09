//
//  Appcoordinator.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import UIKit
import SwiftUI

protocol Coordinator {
    func start()
}

class EntriesCoordinator: Coordinator {
    let window: UIWindow
    let navigationController: UINavigationController
    let networkService: NetworkService
    let entryService: EntryService
    let entryDataProvider: EntryDataProvider
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.networkService = NetworkService()
        self.entryService = EntryService(networkService: networkService)
        self.entryDataProvider = EntryDataProvider(entryService: entryService)
    }
    
    func start() {
        let viewModel = EntriesViewModel(dataLayer: entryDataProvider, minPriority: Priority.low)
        let entriesView = EntriesView(viewModel: viewModel)
        
        navigationController.pushViewController(UIHostingController(rootView: entriesView), animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
