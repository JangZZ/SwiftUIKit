//
//  UIStackView+Ext.swift
//  GKit
//
//  Created by JangzZ on 22/07/2023.
//

import UIKit
import SnapKit

extension UIStackView {
    
    func add(
        _ childView: UIView,
        spacingAbove: CGFloat? = nil,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        self.addArrangedSubview(childView)
        
        constraintArrangedSubview(
            childView: childView,
            spacingAbove: spacingAbove,
            top: top,
            leading: leading,
            trailing: trailing,
            bottom: bottom,
            width: width,
            height: height
        )
    }
    
    private func constraintArrangedSubview(
        childView: UIView,
        spacingAbove: CGFloat? = nil,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        if let customSpacing = spacingAbove,
           let childIndex = self.arrangedSubviews.firstIndex(of: childView),
           let aboveView = self.arrangedSubviews[safe: childIndex - 1] {
            
            self.setCustomSpacing(customSpacing, after: aboveView)
        }
        
        childView.snp.makeConstraints { make in
            if let topConst = top {
                make.top.equalToSuperview().offset(topConst)
            }
            
            if let bottomConst = bottom {
                make.top.equalToSuperview().inset(bottomConst)
            }
            
            if let leadingConst = leading {
                make.leading.equalToSuperview().offset(leadingConst)
            }
            
            if let trailingConst = trailing {
                make.trailing.equalToSuperview().inset(trailingConst)
            }
            
            if let widthConst = width {
                make.width.equalTo(widthConst)
            }
            
            if let heightConst = height {
                make.height.equalTo(heightConst)
            }
        }
    }
    
    func insert(
        _ childView: UIView,
        below view: UIView,
        spacingAbove: CGFloat? = nil,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        arrangedSubviews.enumerated().forEach {
            if $0.1 == view {
                insertArrangedSubview(childView, at: $0.0 + 1)
            }
        }
        
        constraintArrangedSubview(
            childView: childView,
            spacingAbove: spacingAbove,
            top: top,
            leading: leading,
            trailing: trailing,
            bottom: bottom,
            width: width,
            height: height
        )
    }
    
    func insert(
        _ childView: UIView,
        above view: UIView,
        spacingAbove: CGFloat? = nil,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        arrangedSubviews.enumerated().forEach {
            if $0.1 == view {
                insertArrangedSubview(childView, at: $0.0)
            }
        }
        
        constraintArrangedSubview(
            childView: childView,
            spacingAbove: spacingAbove,
            top: top,
            leading: leading,
            trailing: trailing,
            bottom: bottom,
            width: width,
            height: height
        )
    }
}

