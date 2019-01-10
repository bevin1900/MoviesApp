//
//  RootViewController.swift
//  Movie App
//
//  Created by MAC193 on 1/9/19.
//  Copyright © 2019 MAC193. All rights reserved.
//

import UIKit
import RxSwift

class RootViewController: UINavigationController {
    private let disposeBag = DisposeBag()
    var viewModel: RootViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.navigationStackActions.subscribe(onNext: { [weak self] navigationStackAction in
            switch navigationStackAction {
                case .set(let viewModels, let animated):
                    let viewControllers = viewModels.compactMap { viewController(forViewModel: $0) }
                    self?.setViewControllers(viewControllers, animated: animated)
                    
                case .push(let viewModel, let animated):
                    guard let viewController = viewController(forViewModel: viewModel) else { return }
                    self?.pushViewController(viewController, animated: animated)
                    
                case .pop(let animated):
                    _ = self?.popViewController(animated: animated)
                }
        }).disposed(by: disposeBag)
    }
}
