//
//  ViewController.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/16.
//  Copyright © 2020 test. All rights reserved.
//

final class IntroViewController: BaseViewController, ServiceDependency {

    // MARK: UI
    
    private let titleLabel = UILabel().then {
        $0.text = "MVVM-C Test"
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.textColor = .defaultLabelColor
    }
    
    
    // MARK: Property
    
    var navigator: IntroStepper!
    var reactor: EmptyReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .background
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Observable.just(())
            .bind(to: navigator.introCompleteStepper)
            .disposed(by: disposeBag)
    }

    func bind(reactor: EmptyReactor) {
        
    }
}

extension IntroViewController {
    private func addViews() {
        self.view.addSubview(titleLabel)
    }
    
    func initLayout() {
        addViews()
        
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(self.view.snp.center)
        }
    }
}
