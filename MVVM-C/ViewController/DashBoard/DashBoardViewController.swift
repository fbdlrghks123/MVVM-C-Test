//
//  DashBoardViewController.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/23.
//  Copyright © 2020 test. All rights reserved.
//

final class DashBoardViewController: BaseViewController, ServiceDependency {

    // MARK: UI
    
    // MARK: Property
    
    var navigator: IntroStepper!
    var reactor: EmptyReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .background
    }
    
    func bind(reactor: EmptyReactor) {
        
    }
}

extension DashBoardViewController {
    func initLayout() {
        
    }
}

