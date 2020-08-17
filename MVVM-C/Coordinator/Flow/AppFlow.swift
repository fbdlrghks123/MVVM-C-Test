//
//  AppFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

final class AppFlow: Flow {
    private let window: UIWindow
    
    var root: Presentable {
        return window
    }
    
    init(withWindow window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .introRequired:
            return windowToIntroFlow()
        default:
            return .none
        }
    }
}

extension AppFlow {
    private func windowToIntroFlow() -> FlowContributors {
        let introFlow = IntroFlow()

        Flows.use(introFlow, when: .ready) { [unowned self] root in
            self.window.rootViewController = root
        }

        return .one(flowContributor: .contribute(withNextPresentable: introFlow,
                                                 withNextStepper: OneStepper(withSingleStep: AppStep.introRequired)))
    }
}

