//
//  RootInteractor.swift
//  RIBsReactorKit
//
//  Created by Elon on 2021/01/17.
//  Copyright © 2021 Elon. All rights reserved.
//

import RIBs
import RxSwift

// MARK: - RootRouting

protocol RootRouting: Routing {
  func attachMainTabBarRIB()
  func cleanupViews()
}

protocol RootListener: AnyObject {}

// MARK: - RootInteractor

final class RootInteractor: Interactor, RootInteractable {

  weak var router: RootRouting?
  weak var listener: RootListener?

  override func didBecomeActive() {
    super.didBecomeActive()
    router?.attachMainTabBarRIB()
  }

  override func willResignActive() {
    super.willResignActive()
    router?.cleanupViews()
  }
}
