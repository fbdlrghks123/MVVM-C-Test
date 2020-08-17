//
//  IntroAssembler.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

protocol IntroFlowAssembler {
    func resolve() -> AppStepper
    
    // MARK: - IntroViewController
    
    func resolve() -> IntroViewController
    
    func resolve() -> IntroViewReactor
}

extension IntroFlowAssembler {
    func resolve() -> AppStepper {
        return AppStepper()
    }
    
    // MARK: - IntroViewController
    
    func resolve() -> IntroViewController {
        return IntroViewController(reactor: resolve(), navigator: resolve())
    }
    
    func resolve() -> IntroViewReactor {
        return IntroViewReactor()
    }
}

class IntroAssembler: IntroFlowAssembler {
    
}
