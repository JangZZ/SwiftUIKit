//
//  UIView+Gesture.swift
//  GKit
//
//  Created by Andy on 23/07/2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import NSObject_Rx

typealias ZzGestureAction = () -> Void

extension UIView {
    
    func onTapGesture(_ action: @escaping ZzGestureAction) -> Self {
        if let button = self as? UIButton {
            button.rx.tap
                .bind(onNext: action)
                .disposed(by: rx.disposeBag)
        } else {
            self.rx.tapGesture()
                .when(.recognized)
                .bind(onNext: { _ in action() })
                .disposed(by: rx.disposeBag)
        }
        
        return self
    }
}
