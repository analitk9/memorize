//
//  Array+Only.swift
//  memorize
//
//  Created by Denis Evdokimov on 27.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation
extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
