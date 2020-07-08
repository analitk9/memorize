//
//  Array+Identifiable.swift
//  memorize
//
//  Created by Denis Evdokimov on 27.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element)-> Int? {
        for indx in 0..<self.count {
            if matching.id == self[indx].id {
                return indx
            }
        }
        return nil
    }
}
