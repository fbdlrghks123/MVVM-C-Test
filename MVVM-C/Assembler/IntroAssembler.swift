//
//  IntroAssembler.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

protocol IntroFlowAssembler {
    func resolve() -> IntroStepper
    
    // MARK: - IntroViewController
    
    func resolve() -> IntroViewController
    
    
    // MARK: - SignInViewController
    
    func resolve() -> SignInViewController
    
    func resolve() -> SignInViewReactor
}

extension IntroFlowAssembler {
    func resolve() -> IntroStepper {
        return IntroStepper()
    }
    
    // MARK: - IntroViewController
    
    func resolve() -> IntroViewController {
        return IntroViewController(navigator: resolve())
    }
    
    
    // MARK: - SignInViewController
    
    func resolve() -> SignInViewController {
        return SignInViewController(reactor: resolve(), navigator: resolve())
    }
    
    func resolve() -> SignInViewReactor {
        return SignInViewReactor()
    }
}

class IntroAssembler: IntroFlowAssembler {
    
}
