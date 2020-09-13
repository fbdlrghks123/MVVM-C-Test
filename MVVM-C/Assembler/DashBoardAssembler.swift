//
//  IntroAssembler.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

protocol DashBoardFlowAssembler {
    func resolve() -> DashBoardStepper
    
    
    // MARK: - DashBoardViewController
    
    func resolve() -> DashBoardViewController
    
    func resolve() -> DashBoardViewReactor
}

extension DashBoardFlowAssembler {
    func resolve() -> DashBoardStepper {
        return DashBoardStepper()
    }
    
    
    // MARK: - DashBoardViewController

    func resolve() -> DashBoardViewController {
        return DashBoardViewController(reactor: resolve(), navigator: resolve())
    }
    
    func resolve() -> DashBoardViewReactor {
        return DashBoardViewReactor()
    }
}

class DashBoardAssembler: DashBoardFlowAssembler {
    
}
