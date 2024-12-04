//
//  File.swift
//  FloatingAnchorView
//
//  Created by okmin lee on 12/4/24.
//

import SwiftUI

public extension View {
    func anchoredFloatingView<FloatingContent: View>(
        size: CGSize = .init(width: 160, height: 120),
        padding: CGFloat = 8,
        @ViewBuilder content: @escaping () -> FloatingContent
    ) -> some View {
        self.modifier(FloatingAnchorModifier(
            configuration: .init(viewSize: size, screenPadding: padding),
            floatingContent: content
        ))
    }
}

private struct FloatingAnchorModifier<FloatingContent: View>: ViewModifier {
    let configuration: FloatingConfiguration
    let floatingContent: () -> FloatingContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            FloatingAnchorView(
                configuration: configuration,
                content: floatingContent
            )
        }
    }
}
