//
//  DropContainerModifier.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public struct DropContainerModifier: ViewModifier {
    @EnvironmentObject var manager: DragNDropManager
    public let elementId: UUID
    
    public func body(content: Content) -> some View {
        return content
            .overlay(GeometryReader { r in
                Color.clear
                    .onAppear {
                        self.manager.registerFor(drop: self.elementId, frame: r.frame(in: .global))
                }
            })
    }
}
