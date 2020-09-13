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
    
    var navigator: DashBoardStepper!
    var reactor: DashBoardViewReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
    
    func bind(reactor: DashBoardViewReactor) {
        
    }
}

extension DashBoardViewController {
    func initLayout() {
        
    }
}
