//
//  ConstraintModifier.swift
//  GKit
//
//  Created by JangzZ on 23/07/2023.
//

import UIKit

extension UIView {
    public enum ZzConstraintsAnchor {
        case top
        case bottom
        case leading
        case trailing
        case height
        case width
        case horizontal
        case vertical
    }
    
    public class ZzConstraintsModifer: ZzViewModififer {
        
        let value: CGFloat
        let anchor: ZzConstraintsAnchor
        
        public init(value: CGFloat, anchor: ZzConstraintsAnchor) {
            self.value = value
            self.anchor = anchor
        }
        
        public func modify(body: UIView) {
            body.snp.makeConstraints { make in
                switch anchor {
                case .top:
                    make.top.equalToSuperview().offset(value)
                    
                case .bottom:
                    make.bottom.equalToSuperview().inset(value)
                    
                case .leading:
                    make.leading.equalToSuperview().offset(value)
                    
                case .trailing:
                    make.trailing.equalToSuperview().inset(value)
                    
                case .width:
                    make.width.equalTo(value)
                    
                case .height:
                    make.height.equalTo(value)
                    
                case .horizontal:
                    make.leading.equalToSuperview().offset(value)
                    make.trailing.equalToSuperview().inset(value)
                    
                case .vertical:
                    make.top.equalToSuperview().offset(value)
                    make.bottom.equalToSuperview().inset(value)
                }
            }
        }
    }
}

public extension UIView {
    
    func height(_ value: CGFloat) -> Self {
        let modifier = ZzConstraintsModifer.init(value: value, anchor: .height)
        self.addModifer(modifier)
        return self
    }
    
    func width(_ value: CGFloat) -> Self {
        let modifier = ZzConstraintsModifer.init(value: value, anchor: .width)
        self.addModifer(modifier)
        return self
    }
    
    func const(_ anchor: ZzConstraintsAnchor, _ value: CGFloat) -> Self {
        let modifier = ZzConstraintsModifer.init(value: value, anchor: anchor)
        self.addModifer(modifier)
        return self
    }
    
    func const(_ anchors: [ZzConstraintsAnchor], _ value: CGFloat) -> Self {
        let modifiers = anchors.map { ZzConstraintsModifer.init(value: value, anchor: $0) }
        self.addModifers(modifiers)
        return self
    }
}


