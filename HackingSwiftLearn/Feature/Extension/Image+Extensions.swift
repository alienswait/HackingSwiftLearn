//
//  Image+Extensions.swift
//  HackingSwiftLearn
//
//  Created by Mertcan Ünek on 30.07.2024.
//

import Foundation
import SwiftUI


extension Image{
    
    func circleShapeWithBorder() -> some View {
        return self.clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 2))
    }
}
