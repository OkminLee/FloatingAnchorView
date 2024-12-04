//
//  FloatingConfiguration.swift
//  FloatingAnchorView
//
//  Created by okmin lee on 12/4/24.
//

import SwiftUI

struct FloatingConfiguration {
    let viewSize: CGSize
    let screenPadding: CGFloat
    
    var horizontalPadding: CGFloat { viewSize.width / 2 + screenPadding }
    var verticalPadding: CGFloat { viewSize.height / 2 + screenPadding }
}
