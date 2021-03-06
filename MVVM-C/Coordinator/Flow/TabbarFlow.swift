//
//  TabbarFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/24.
//  Copyright © 2020 test. All rights reserved.
//

final class TabbarFlow: Flow {
    
    var root: Presentable {
        return tabbarController
    }
    
    private let tabbarController = UITabBarController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .tabBarRequired:
            return navigationToTabbarController()
            
        default:
            return .none
        }
    }
}

extension TabbarFlow {
    private func navigationToTabbarController() -> FlowContributors {
        let dashBoardFlow = DashBoardFlow()
        let etcFlow = EtcFlow()
        
        let flows: [Flow] = [dashBoardFlow, etcFlow]

        let tabBarItems = [
            UITabBarItem(title: "대시보드",
                         image: UIImage(named: "gnbDashboardOff"),
                         selectedImage: UIImage(named: "gnbDashboardOn")),
            UITabBarItem(title: "더보기",
                         image: UIImage(named: "gnbAdminOff"),
                         selectedImage: UIImage(named: "gnbAdminOn"))
        ]

        let flowContributors: [FlowContributor] = [
            .contribute(withNextPresentable: dashBoardFlow,
                        withNextStepper: OneStepper(withSingleStep: DashBoardStep.initDashBoard)),
            .contribute(withNextPresentable: etcFlow,
                        withNextStepper: OneStepper(withSingleStep: EtcStep.initEtc))
        ]

        Flows.use(flows, when: .ready) { [unowned self] roots in
            roots.enumerated().forEach {
                $0.element.tabBarItem = tabBarItems[$0.offset]
            }
            
            self.tabbarController.setViewControllers(roots, animated: false)
        }

        return .multiple(flowContributors: flowContributors)
    }
}
