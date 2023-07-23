//
//  Text.swift
//  GKit
//
//  Created by JangzZ on 23/07/2023.
//

import UIKit

typealias Text = ZzText

final public class ZzText: UILabel {
    
    required public init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZzText {
    func forgroundColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    func numberOfLine(_ value: Int) -> Self {
        self.numberOfLines = value
        return self
    }
    
    func zHugging(priority: UILayoutPriority) -> Self {
        self.setContentHuggingPriority(priority, for: .horizontal)
        return self
    }
    
    func vHugging(priority: UILayoutPriority) -> Self {
        self.setContentHuggingPriority(priority, for: .vertical)
        return self
    }
}
