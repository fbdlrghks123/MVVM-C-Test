//
//  EmptyReactor.swift
//  MVVM-C
//
//  Created by Ickhwan Ryu on 2020/08/18.
//  Copyright © 2020 test. All rights reserved.
//

class EmptyReactor: Reactor {
    
    enum Action { }
    
    struct State { }
    
    var initialState = State()
}
