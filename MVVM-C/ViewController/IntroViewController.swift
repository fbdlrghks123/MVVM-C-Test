//
//  ViewController.swift
//  MVVM-C
//
//  Created by RIH on 2020/08/16.
//  Copyright © 2020 test. All rights reserved.
//

final class IntroViewController: BaseViewController, ServiceDependency {

    // MARK : UI
    
    private let titleLabel = UILabel().then {
        $0.text = "MVVM-C Test"
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.textColor = .defaultLabelColor
    }
    
    // MARK : Property
    
    var navigator: AppStepper!
    var reactor: IntroViewReactor?

    func bind(reactor: IntroViewReactor) {
        self.rx.viewDidLoad
            .subscribe(onNext: { [weak self] _ in
                self?.view.backgroundColor = .white
            })
            .disposed(by: disposeBag)
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
