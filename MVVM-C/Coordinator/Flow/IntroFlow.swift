//
//  IntroFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

final class IntroFlow: Flow {
    
    var root: Presentable {
        return navigationController
    }
    
    private let assembler = IntroAssembler()
    
    private let navigationController = UINavigationController().then {
        $0.setNavigationBarHidden(true, animated: false)
    }
    
    func adapt(step: Step) -> Single<Step> {
        switch step {
        case AppStep.introRequired:
            if LocalConfiguration.user.value != nil {
                return .just(AppStep.tabBarRequired)
            }
            return .just(step)
            
        case AppStep.introComplete:
            return .just(AppStep.loginRequired)
        default:
            return .just(step)
        }
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .introRequired:
            return navigationToIntroViewController()
        case .loginRequired:
            return navigationToSignInViewController()
        case .tabBarRequired:
            return .end(forwardToParentFlowWithStep: step)
        default:
            return .none
        }
    }
}

extension IntroFlow {
    private func navigationToIntroViewController() -> FlowContributors {
        let introViewController: IntroViewController = assembler.resolve()
        
        navigationController.pushViewController(introViewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: introViewController,
                                                 withNextStepper: introViewController.navigator))
    }
    
    private func navigationToSignInViewController() -> FlowContributors {
        let signInViewController: SignInViewController = assembler.resolve()
        
        navigationController.pushViewController(signInViewController, animated: false)
        
        return .one(flowContributor: .contribute(withNextPresentable: signInViewController,
                                                 withNextStepper: signInViewController.navigator))
    }
}
