//
//  EtcFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/09/13.
//  Copyright © 2020 test. All rights reserved.
//

final class EtcFlow: Flow {
    
    private let assembler = EtcAssembler()
    
    var root: Presentable {
        return navigationController
    }
    
    private let navigationController = UINavigationController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? EtcStep else { return .none }
        switch step {
        case .initEtc:
            return navigationToEtc()
        }
    }
}

extension EtcFlow {
    private func navigationToEtc() -> FlowContributors {
        let etcViewController: EtcViewController = assembler.resolve()
        
        navigationController.pushViewController(etcViewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: etcViewController,
                                                 withNextStepper: etcViewController.navigator))
    }
}
