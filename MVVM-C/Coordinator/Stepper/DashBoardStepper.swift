//
//  DashBoardStepper.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

final class DashBoardStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        return DashBoardStep.dashBoardRequired
    }
}
