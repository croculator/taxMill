//
//  HapticTapHelper.swift
//  MileBot11
//
//  Created by Michael Diaz on 5/29/21.
//

import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}
