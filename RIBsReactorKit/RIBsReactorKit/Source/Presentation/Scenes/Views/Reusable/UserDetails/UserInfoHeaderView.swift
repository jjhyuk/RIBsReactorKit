//
//  UserInfoHeaderView.swift
//  RIBsReactorKit
//
//  Created by Elon on 2020/08/18.
//  Copyright © 2020 Elon. All rights reserved.
//

import UIKit

// MARK: - UserInfoHeaderView

final class UserInfoHeaderView:
  BaseCollectionReusableView,
  HasElementKind,
  HasConfigure,
  SkeletonAnimatable
{

  // MARK: - Constants

  private enum UI {
    // - titleLabel
    static let titleLabelTopMargin: CGFloat = 0
    static let titleLabelBottomMargin: CGFloat = 8
    static let titleLabelLeadingMargin: CGFloat = 16
    static let titleLabelTrailingMargin: CGFloat = 16

    // - skeleton
    static let linesCornerRadius: Int = 10

    enum Font {
      static let titleLabel = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
  }

  // MARK: - Properties

  static var elementKind: String = UICollectionView.elementKindSectionHeader

  private(set) var viewModel: UserInfoSectionHeaderViewModel?

  // for skeleton view animation
  private let dummyTitleString = String(repeating: " ", count: 30)

  // MARK: - UI Components

  private lazy var titleLabel = UILabel().builder
    .font(UI.Font.titleLabel)
    .textColor(.black)
    .text(dummyTitleString)
    .isSkeletonable(true)
    .linesCornerRadius(UI.linesCornerRadius)
    .build()

  private(set) lazy var views: [UIView] = [
    titleLabel
  ]

  // MARK: - Inheritance

  override func initialize() {
    super.initialize()
    setupUI()
  }

  override func setupConstraints() {
    super.setupConstraints()
    layout()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    initUI()
  }

  // MARK: - Internal methods

  func configure(by viewModel: UserInfoSectionHeaderViewModel) {
    self.viewModel = viewModel
    titleLabel.text = viewModel.title
  }

  // MARK: - Private methods

  private func initUI() {
    titleLabel.text = dummyTitleString
  }
}

// MARK: - Layout

extension UserInfoHeaderView {
  private func setupUI() {
    isSkeletonable = true
    views.forEach { self.addSubview($0) }

    initUI()
  }

  private func layout() {
    titleLabel.snp.makeConstraints {
      $0.top.greaterThanOrEqualToSuperview().offset(UI.titleLabelTopMargin)
      $0.bottom.equalToSuperview().offset(-UI.titleLabelBottomMargin)
      $0.leading.equalToSuperview().offset(UI.titleLabelLeadingMargin)
      $0.trailing.lessThanOrEqualToSuperview().offset(-UI.titleLabelTrailingMargin)
    }
  }
}

#if canImport(SwiftUI) && DEBUG
  import SwiftUI

  @available(iOS 13.0, *)
  struct UserInformationSectionHeaderViewPreview: PreviewProvider {
    static var previews: some SwiftUI.View {
      UIViewPreview {
        UserInfoHeaderView().builder
          .reinforce {
            $0.configure(by: UserInfoSectionHeaderViewModel(title: "test"))
          }
          .build()
      }
      .previewLayout(.fixed(width: 320, height: 50))
      .padding(10)
    }
  }
#endif