//
//  CornerRadiusModifiers.swift
//  GKit
//
//  Created by JangzZ on 23/07/2023.
//

import UIKit

extension UIView {
    
    public enum CornerPosition {
        case top
        case bottom
        case left
        case right
        case all
        
        var cACornerMask: CACornerMask? {
            switch self {
            case .top: return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            case .bottom: return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .left: return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            case .right: return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .all: return nil
            }
        }
    }
    
    public class CornerRadiusModifer: ZzViewModififer {
        
        let value: CGFloat
        let position: CornerPosition
        let isRounded: Bool
        
        public init(
            value: CGFloat,
            position: CornerPosition = .all,
            isRounded: Bool = false
        ) {
            self.value = value
            self.position = position
            self.isRounded = isRounded
        }
        
        public func modify(body: UIView) {
            body.layer.cornerRadius = value
            if let cACornerMask = position.cACornerMask {
                body.layer.maskedCorners = cACornerMask
            }
        }
    }
}

extension UIView {
    func cornerRadius(_ value: CGFloat, position: CornerPosition = .all) -> Self {
        self.addModifer(CornerRadiusModifer(value: value, position: position))
        
        return self
    }
    
    func rounded() -> Self {
        self.clipsToBounds = true
        return self
    }
}
