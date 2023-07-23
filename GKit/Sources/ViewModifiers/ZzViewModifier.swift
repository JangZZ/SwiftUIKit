//
//  ZzViewModifier.swift
//  GKit
//
//  Created by JangzZ on 23/07/2023.
//

import UIKit

public protocol ZzViewModififer {
    func modify(body: UIView)
}

extension UIView {
    func addModifer(_ modifier: ZzViewModififer) {
        let currentModifiers = self.viewModifers
        self.viewModifers = currentModifiers + [modifier]
    }
    
    func addModifers(_ modifiers: [ZzViewModififer]) {
        let currentModifers = self.viewModifers
        self.viewModifers = currentModifers + modifiers
    }
}
