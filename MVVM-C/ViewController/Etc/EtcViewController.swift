//
//  EtcViewController.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/23.
//  Copyright © 2020 test. All rights reserved.
//

final class EtcViewController: BaseViewController, ServiceDependency {
    
    // MARK: UI
    
    // MARK: Property
    
    var navigator: EtcStepper!
    var reactor: EtcViewReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
    }
    
    func bind(reactor: EtcViewReactor) {
        
    }
}

extension EtcViewController {
    func initLayout() {
        
    }
}
