// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

struct FloatingAnchorView<Content: View>: View {
    private let configuration: FloatingConfiguration
    private let content: () -> Content
    
    @State private var anchorPosition: AnchorPosition = .init()
    @GestureState private var dragOffset: CGSize = .zero
    
    init(
        configuration: FloatingConfiguration,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.configuration = configuration
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            content()
                .frame(width: configuration.viewSize.width, height: configuration.viewSize.height)
                .position(
                    x: anchorPosition.current.x + dragOffset.width,
                    y: anchorPosition.current.y + dragOffset.height
                )
                .gesture(dragGesture)
                .onAppear { setupInitialPosition(in: geometry) }
                .zIndex(999)
                .drawingGroup()
        }
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, state, _ in
                state = value.translation
            }
            .onEnded { value in
                anchorPosition.updatePosition(with: value.translation)
                snapToNearestCorner()
            }
    }
    
    private func setupInitialPosition(in geometry: GeometryProxy) {
        let corners = [
            CGPoint(x: configuration.horizontalPadding, y: configuration.verticalPadding),
            CGPoint(x: geometry.size.width - configuration.horizontalPadding, y: configuration.verticalPadding),
            CGPoint(x: configuration.horizontalPadding, y: geometry.size.height - configuration.verticalPadding),
            CGPoint(x: geometry.size.width - configuration.horizontalPadding, y: geometry.size.height - configuration.verticalPadding)
        ]
        
        anchorPosition = AnchorPosition(
            current: CGPoint(
                x: geometry.size.width - configuration.horizontalPadding,
                y: configuration.verticalPadding
            ),
            corners: corners
        )
    }
    
    private func snapToNearestCorner() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            anchorPosition.current = anchorPosition.nearestCorner()
        }
    }
}
