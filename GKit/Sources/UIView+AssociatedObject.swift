//
//  UIView+Ext.swift
//  GKit
//
//  Created by JangzZ on 22/07/2023.
//

import UIKit

extension UIView {
    
    func backgroundColor(_ color: UIColor) -> Self {
        self._paddingContainerView.backgroundColor = color
        
        return self
    }
    
    struct PropertyKeys {
        static var viewModifersKey = "UIView_Key_ViewModifers"
        static var paddingContainerViewKey = "UIView_Key_PaddingContainerView"
    }
    
    var viewModifers: [ZzViewModififer] {
        get {
            if let viewModifiers = objc_getAssociatedObject(self, &PropertyKeys.viewModifersKey) as? [ZzViewModififer] {
                return viewModifiers
            }

            return []
        }
        set {
            objc_setAssociatedObject(self, &PropertyKeys.viewModifersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var _paddingContainerView: UIView {
        get {
            if let containerView = objc_getAssociatedObject(self, &PropertyKeys.paddingContainerViewKey) as? UIView {
                return containerView
            }

            return self
        }
        set {
            objc_setAssociatedObject(self, &PropertyKeys.paddingContainerViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
