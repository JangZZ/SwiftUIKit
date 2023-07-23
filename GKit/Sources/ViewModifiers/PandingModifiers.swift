//
//  PandingModifiers.swift
//  GKit
//
//  Created by Andy on 23/07/2023.
//

import UIKit

extension UIView {
    
    public enum ZzAnchor: CaseIterable {
        case top
        case bottom
        case left
        case right
        case horiziontal
        case vertical
    }
    
    public func padding(_ value: CGFloat) -> Self {
        padding([.vertical, .horiziontal], value)
    }
    
    public func padding(_ anchor: ZzAnchor, _ value: CGFloat) -> Self {
        padding([anchor], value)
    }
    
    public func padding(_ anchors: [ZzAnchor], _ value: CGFloat) -> Self {
        let containerPaddingView = UIView()
        containerPaddingView.backgroundColor = .clear
        
        containerPaddingView.addSubview(self._paddingContainerView)
        
        var subtractAnchors = Set<ZzAnchor>([.top, .bottom, .left, .right])
        
        anchors.forEach { anchor in
            switch anchor {
            case .horiziontal:
                subtractAnchors.remove(.left)
                subtractAnchors.remove(.right)
            case .vertical:
                subtractAnchors.remove(.top)
                subtractAnchors.remove(.bottom)
            default:
                break
            }
        }
        
        anchors.forEach { updateConstraint(anchor: $0, value) }
        
        // Adding subtract anchors constraints
        subtractAnchors.subtract(anchors)
        subtractAnchors.forEach { updateConstraint(anchor: $0) }
        
        func updateConstraint(anchor: ZzAnchor, _ constant: CGFloat = 0) {
            self._paddingContainerView.snp.makeConstraints { make in
                switch anchor {
                case .top:
                    make.top.equalToSuperview().offset(constant)
                    
                case .bottom:
                    make.bottom.equalToSuperview().inset(constant)
                    
                case .left:
                    make.leading.equalToSuperview().offset(constant)
                    
                case .right:
                    make.trailing.equalToSuperview().inset(constant)
                    
                case .vertical:
                    make.top.equalToSuperview().offset(constant)
                    make.bottom.equalToSuperview().inset(constant)
                    
                case .horiziontal:
                    make.leading.equalToSuperview().offset(constant)
                    make.trailing.equalToSuperview().inset(constant)
                }
            }
        }
        
        // Saving panding container view
        self._paddingContainerView = containerPaddingView
        
        return self
    }
   
}
