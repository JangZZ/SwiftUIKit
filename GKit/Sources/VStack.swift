//
//  VStack.swift
//  GKit
//
//  Created by JangzZ on 22/07/2023.
//

import UIKit
import RxSwift
import RxCocoa

typealias VStack = ZzVStack
typealias HStack = ZzHStack
typealias Spacer = UIView

public final class ZzVStack: UIStackView, ZzStackable, ZzViewModifiable {
    
    var childs: [UIView]
    
    public init(
        alightment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        _ childs: [UIView]
    ) {
        self.childs       = childs
        super.init(frame: .zero)
        self.axis         = .vertical
        self.spacing      = spacing
        self.alignment    = alightment
        self.distribution = distribution
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        childs.forEach(addChild)
        childs.forEach(callModifiers)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public final class ZzHStack: UIStackView, ZzStackable, ZzViewModifiable {
    
    var childs: [UIView]
    
    public init(
        alightment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        _ childs: [UIView]
    ) {
        self.childs       = childs
        super.init(frame: .zero)
        self.spacing      = spacing
        self.alignment    = alightment
        self.distribution = distribution
        
        childs.forEach(addChild)
        childs.forEach(callModifiers)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ZzStackable {
    func addChild(_ child: UIView)
}

extension ZzStackable where Self: UIStackView {
    func addChild(_ child: UIView) {
        self.add(child._paddingContainerView)
    }
}

protocol ZzViewModifiable {
    func callModifiers(_ child: UIView)
}

extension ZzViewModifiable where Self: UIView {
    func callModifiers(_ child: UIView) {
        child.viewModifers.forEach { modifer in
            modifer.modify(body: child)
        }
    }
}
