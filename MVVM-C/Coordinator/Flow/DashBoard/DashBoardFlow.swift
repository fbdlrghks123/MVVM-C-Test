//
//  DashBoardFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/24.
//  Copyright © 2020 test. All rights reserved.
//

final class DashBoardFlow: Flow {
    
    private let assembler = DashBoardAssembler()
    
    var root: Presentable {
        return navigationController
    }
    
    private let navigationController = UINavigationController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DashBoardStep else { return .none }
        
        switch step {
        case .initDashBoard:
            return navigationToDashBoard()
        }
    }
}

extension DashBoardFlow {
    private func navigationToDashBoard() -> FlowContributors {
        let dashBoardViewController: DashBoardViewController = assembler.resolve()
        
        navigationController.pushViewController(dashBoardViewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: dashBoardViewController,
                                                 withNextStepper: dashBoardViewController.navigator))
    }
}
