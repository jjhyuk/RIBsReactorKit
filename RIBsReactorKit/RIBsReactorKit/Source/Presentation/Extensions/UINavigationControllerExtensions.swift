//
//  UINavigationControllerExtensions.swift
//  Smithsonian
//
//  Created by Elon on 2020/03/08.
//  Copyright © 2020 Elon. All rights reserved.
//

import UIKit

import RIBs

extension UINavigationController: ViewControllable {
  public var uiviewController: UIViewController { return self }
  
  public convenience init(root: ViewControllable) {
    self.init(rootViewController: root.uiviewController)
  }
}
