//
//  ViewController.swift
//  GKit
//
//  Created by JangzZ on 22/07/2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, Controller {
    
    lazy var body: UIView = {
        ScrollView([
            VStack([
                HStack([
                    UIView()
                        .backgroundColor(.green)
                        .height(300)
                        .padding(50)
                        .backgroundColor(.blue)
                        .width(100),
                    
                    Spacer()
                ]),
                
                HStack([
                    UIView()
                        .backgroundColor(.green)
                        .height(300)
                        .padding(50)
                        .backgroundColor(.blue)
                        .width(100),
                    
                    Spacer()
                ])
                .onTapGesture {
                    print("OK OK OK OK")
                }
                ,
                
                HStack([
                    UIView()
                        .backgroundColor(.green)
                        .height(300)
                        .padding(50)
                        .backgroundColor(.blue)
                        .width(100),
                    
                    Spacer()
                ]),
                
                Text("BBSBSBSBSB")
                    .onTapGesture {
                        print("OK OK OK OK 1111")
                    }
                ,
                
                Spacer()
            ])
        ])
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
}

protocol Controller {
    var body: UIView { get }
    func render()
}

extension Controller where Self: UIViewController {
    func render() {
        self.view.addSubview(body)
        
        body.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
