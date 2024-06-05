//
//  MoviesViewModel.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import Foundation

class MoviesViewModel: ObservableObject {
    
    func starColor(movieIndex: Double) -> Double {
        switch movieIndex {
        case 9...10:
            return 5
        case 7..<9:
            return 4
        case 5..<7:
            return 3
        case 3..<5:
            return 2
        default:
            return 1
        }
    }
    
}
