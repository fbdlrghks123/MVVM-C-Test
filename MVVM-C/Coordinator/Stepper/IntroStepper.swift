//
//  IntroStepper.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/18.
//  Copyright © 2020 test. All rights reserved.
//

final class IntroStepper: Stepper {
    let steps = PublishRelay<Step>()
    
    let introCompleteStepper = PublishSubject<Void>()
    
    let disposeBag = DisposeBag()
    
    var initialStep: Step {
        return AppStep.introRequired
    }
    
    init() {
        introCompleteStepper
            .map { AppStep.introComplete }
            .bind(to: steps)
            .disposed(by: disposeBag)
        
        LocalConfigurationType.sStorage.rx
            .observe(String.self, LocalConfiguration.user.key.rawValue)
            .distinctUntilChanged()
            .observeOn(MainScheduler.asyncInstance)
            .filter { $0 != nil }
            .map { _ in AppStep.tabBarRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)
    }
}
