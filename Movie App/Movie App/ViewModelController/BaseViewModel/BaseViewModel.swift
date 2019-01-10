//
//  BaseViewModel.swift
//  Movie App
//
//  Created by MAC193 on 1/9/19.
//  Copyright © 2019 MAC193. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel{
    let disposeBag  = DisposeBag()
    let alertDialog = PublishSubject<(String,String)>()
    let isLoading: ActivityIndicator =  ActivityIndicator();
}
