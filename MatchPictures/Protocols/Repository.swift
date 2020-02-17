//
//  Repository.swift
//  MatchPictures
//
//  Created by Денис on 15.02.2020.
//  Copyright © 2020 Денис. All rights reserved.
//

import Foundation
import PromiseKit

protocol Repository {
    associatedtype ObjectType
    func fetchObject() -> Promise<ObjectType>
}
