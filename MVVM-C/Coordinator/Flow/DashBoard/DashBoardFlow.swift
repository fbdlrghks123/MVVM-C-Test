//
//  DashBoardFlow.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/24.
//  Copyright © 2020 test. All rights reserved.
//

final class DashBoardFlow: Flow {
    
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
