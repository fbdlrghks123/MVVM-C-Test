//
//  AppDelegate.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/16.
//  Copyright © 2020 test. All rights reserved.
//

import Gedatsu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var coordinator = FlowCoordinator()
    
    let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = self.window else { return false }
        
#if DEBUG
        Gedatsu.open()
#endif
    
        let appStepper = AppStepper()
        
        let appFlow = AppFlow(withWindow: window)
        
        coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
             print("will navigate to flow=\(flow) and step=\(step)")
         }).disposed(by: self.disposeBag)
        
         coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
             print("did navigate to flow=\(flow) and step=\(step)")
         }).disposed(by: self.disposeBag)
        
        coordinator.coordinate(flow: appFlow, with: appStepper)
        
        return true
    }
}

