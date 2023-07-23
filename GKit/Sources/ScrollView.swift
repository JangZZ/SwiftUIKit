//
//  ScrollView.swift
//  GKit
//
//  Created by Andy on 23/07/2023.
//

import UIKit

typealias ScrollView = ZzScrollView

public final class ZzScrollView: UIScrollView {
    
    // MARK: - Properties
    let conentVStack: VStack
    
    // MARK: - Initilizes
    init(_ childs: [UIView]) {
        conentVStack = VStack(childs)
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZzScrollView {
    private func setupUI() {
        self.addSubview(conentVStack)
        
        conentVStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
    }
}
