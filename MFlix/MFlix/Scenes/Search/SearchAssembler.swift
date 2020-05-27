//
//  SearchAssembler.swift
//  MFlix
//
//  Created by Viet Anh on 5/22/20.
//  Copyright © 2020 VietAnh. All rights reserved.
//

protocol SearchAssembler {
    func resolve(navigationController: UINavigationController) -> SearchViewController
    func resolve(navigationController: UINavigationController) -> SearchViewModel
    func resolve(navigationController: UINavigationController) -> SearchNavigatorType
    func resolve() -> SearchUseCaseType
}

extension SearchAssembler {
    func resolve(navigationController: UINavigationController) -> SearchViewController {
        let viewController = SearchViewController.instantiate()
        let viewModel: SearchViewModel = resolve(navigationController: navigationController)
        viewController.bindViewModel(to: viewModel)
        return viewController
    }
    
    func resolve(navigationController: UINavigationController) -> SearchViewModel {
        return SearchViewModel(navigator: resolve(navigationController: navigationController),
                               useCase: resolve())
    }
}

extension SearchAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> SearchNavigatorType {
       return SearchNavigator(assembler: self,
                              navigationController: navigationController)
    }
    
    func resolve() -> SearchUseCaseType {
        return SearchUseCase(repository: resolve())
    }
}
