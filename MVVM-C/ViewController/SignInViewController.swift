//
//  SignInViewController.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/18.
//  Copyright © 2020 test. All rights reserved.
//

import AuthenticationServices

class SignInViewController: BaseViewController, ServiceDependency {
    
    // MARK: UI
    
    let titleLabel = UILabel().then {
        $0.text = "AppleLoginTest"
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.textColor = .defaultLabelColor
    }
    
    let appleLoginButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
    
    // MARK: Property
    
    var navigator: IntroStepper!
    var reactor: SignInViewReactor?
    
    func bind(reactor: SignInViewReactor) {
        bindAction(reactor)
    }
}

extension SignInViewController {
    private func addViews() {
        view.addSubview(titleLabel)
        view.addSubview(appleLoginButton)
    }
    
    func initLayout() {
        addViews()
        
        appleLoginButton.snp.makeConstraints {
            $0.leading.equalTo(25)
            $0.trailing.equalTo(-25)
            $0.center.equalTo(view.center)
            $0.height.equalTo(54)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.bottom.equalTo(appleLoginButton.snp.top).offset(-100)
        }
    }
    
    private func bindAction(_ reactor: SignInViewReactor) {
        appleLoginButton.rx
            .loginOnTap(scope: [.fullName, .email])
            .subscribe(onNext: { result in
                guard let auth = result.credential as? ASAuthorizationAppleIDCredential else { return }
                print(auth.user)
//                print(auth.email)
//                print(auth.fullName?.givenName)
//                print(auth.fullName?.familyName)
            })
            .disposed(by: disposeBag)
    }
}
