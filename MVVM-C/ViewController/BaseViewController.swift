//
//  BaseViewController.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/17.
//  Copyright © 2020 test. All rights reserved.
//

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    deinit {
        print("DEINIT: \(self.className)")
    }
    
    
    // MARK: Rx

    var disposeBag = DisposeBag()
}

protocol ServiceDependency: StoryboardView {
    associatedtype S: Stepper
    
    var navigator: S! { get set }
    
    init(reactor: Reactor?, navigator: S)
    
    func bindReactor(reactor: Reactor?, navigator: S)
    
    func initLayout()
}

extension ServiceDependency where Self: UIViewController {
    func bindReactor(reactor: Reactor? = nil, navigator: S) {
        self.reactor = reactor
        self.navigator = navigator
    }
    
    init(reactor:Reactor? = nil, navigator: S) {
        self.init()
        self.initLayout()
        self.bindReactor(reactor: reactor, navigator: navigator)
    }
}
