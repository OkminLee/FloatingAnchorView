//
//  AnchorPosition.swift
//  FloatingAnchorView
//
//  Created by okmin lee on 12/4/24.
//

import SwiftUI

struct AnchorPosition {
    var current: CGPoint
    let corners: [CGPoint]
    
    init(current: CGPoint = .zero, corners: [CGPoint] = []) {
        self.current = current
        self.corners = corners
    }
    
    mutating func updatePosition(with translation: CGSize) {
        current = CGPoint(
            x: current.x + translation.width,
            y: current.y + translation.height
        )
    }
    
    func nearestCorner() -> CGPoint {
        corners.min(by: { first, second in
            distance(from: current, to: first) < distance(from: current, to: second)
        }) ?? current
    }
    
    private func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        let dx = point1.x - point2.x
        let dy = point1.y - point2.y
        return sqrt(dx * dx + dy * dy)
    }
}
