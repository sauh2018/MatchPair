//
//  Injection.swift
//  MatchPictures
//
//  Created by Денис on 14.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import UIKit

func registerService<T>(service: T) {
    ServiceLocator.shared.registerService(service: service)
}

func inject<T>() -> T {
    return ServiceLocator.shared.getService()
}
