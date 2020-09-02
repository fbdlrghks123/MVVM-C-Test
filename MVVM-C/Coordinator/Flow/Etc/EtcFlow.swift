//
//  EtcFlow.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/09/02.
//  Copyright © 2020 test. All rights reserved.
//

final class EtcFlow: Flow {
    
    var root: Presentable {
        return navigationController
    }
    
    private let navigationController = UINavigationController()
    
    func navigate(to step: Step) -> FlowContributors {
        return .none
    }
}

extension DashBoardFlow {
    
}

