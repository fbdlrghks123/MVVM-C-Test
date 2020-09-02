//
//  EtcStepper.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/18.
//  Copyright © 2020 test. All rights reserved.
//

final class EtcStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    let introCompleteStepper = PublishSubject<Void>()
    
    let disposeBag = DisposeBag()
    
    var initialStep: Step {
        return EtcStep.etcRequired
    }
}
