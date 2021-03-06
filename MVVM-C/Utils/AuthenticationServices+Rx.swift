//
//  AuthenticationServices+Rx.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/18.
//  Copyright © 2020 test. All rights reserved.
//

import AuthenticationServices

@available(iOS 13.0, *)
extension Reactive where Base: ASAuthorizationAppleIDProvider {
    public func login(scope: [ASAuthorization.Scope]? = nil, on window: UIWindow) -> Observable<ASAuthorization> {
        let request = base.createRequest()
        request.requestedScopes = scope

        let controller = ASAuthorizationController(authorizationRequests: [request])

        let proxy = ASAuthorizationControllerProxy.proxy(for: controller)
        proxy.presentationWindow = window

        controller.presentationContextProvider = proxy
        controller.performRequests()

        return proxy.didComplete
    }
}

@available(iOS 13.0, *)
extension Reactive where Base: ASAuthorizationAppleIDButton {
    public func loginOnTap(scope: [ASAuthorization.Scope]? = nil) -> Observable<ASAuthorization> {
        let window = UIApplication.shared.keyWindow!
        return controlEvent(.touchUpInside)
            .flatMap {
                ASAuthorizationAppleIDProvider().rx.login(scope: scope, on: window)
            }
    }

    public func login(scope: [ASAuthorization.Scope]? = nil) -> Observable<ASAuthorization> {
        return ASAuthorizationAppleIDProvider().rx.login(scope: scope, on: base.window!)
    }
}
