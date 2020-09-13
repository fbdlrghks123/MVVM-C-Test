//
//  IntroAssembler.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

protocol EtcFlowAssembler {
    func resolve() -> EtcStepper
    
    
    // MARK: - SignInViewController
    
    func resolve() -> EtcViewController
    
    func resolve() -> EtcViewReactor
}

extension EtcFlowAssembler {
    func resolve() -> EtcStepper {
        return EtcStepper()
    }
    
    
    // MARK: - EtcViewController
    
    func resolve() -> EtcViewController {
        return EtcViewController(reactor: resolve(), navigator: resolve())
    }
    
    func resolve() -> EtcViewReactor {
        return EtcViewReactor()
    }
}

class EtcAssembler: EtcFlowAssembler {
    
}
