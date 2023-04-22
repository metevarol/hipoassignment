//
//  StringExtensions.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import Foundation

extension String {
    func occurrences(of character: Character) -> Int {
        return self.reduce(0) { count, currentCharacter in
            return count + (currentCharacter == character ? 1 : 0)
        }
    }
}
