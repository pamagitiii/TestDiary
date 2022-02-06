//
//  String+.swift
//  TestDiary
//
//  Created by Anatoliy on 06.02.2022.
//

import Foundation

extension String {
    func isValid() -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedString != "" {
            return true
        } else {
            return false
        }
    }
}
