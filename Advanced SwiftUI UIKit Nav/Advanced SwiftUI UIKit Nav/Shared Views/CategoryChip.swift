//
//  CategoryChip.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI

// Modern category chip with gradient
struct CategoryChip: View {
    
    let category: ProductCategory
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 8) {
                Image(systemName: category.icon)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(category.rawValue)
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(isSelected ? .white : .primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Group {
                    if isSelected {
                        LinearGradient(
                            colors: category.gradientColors.map { Color(hex: $0) },
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    } else {
                        Color(UIColor.systemGray6)
                    }
                }
            )
            .cornerRadius(20)
            .shadow(color: isSelected ? Color.black.opacity(0.2) : Color.clear, radius: 8, x: 0, y: 4)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

