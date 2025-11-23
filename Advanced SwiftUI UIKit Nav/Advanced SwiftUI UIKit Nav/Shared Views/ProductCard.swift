//
//  ProductCard.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI

// Modern product card with gradient and animations
struct ProductCard: View {
    
    let product: Product
    let onTap: () -> Void
    @StateObject private var cartManager = CartManager.shared
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image section with discount badge
            ZStack(alignment: .topTrailing) {
                // Product image placeholder with gradient
                ZStack {
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    Image(systemName: product.imageName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white.opacity(0.9))
                        .padding(30)
                }
                .frame(height: 180)
                .cornerRadius(20)
                
                // Discount badge
                if let discount = product.discountPercentage {
                    Text("-\(discount)%")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(10)
                }
            }
            
            // Product info
            VStack(alignment: .leading, spacing: 6) {
                // Category
                Text(product.category.rawValue)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.gray)
                    .textCase(.uppercase)
                
                // Product name
                Text(product.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .frame(height: 40, alignment: .top)
                
                // Rating
                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                            .font(.system(size: 10))
                            .foregroundColor(.yellow)
                    }
                    Text(String(format: "%.1f", product.rating))
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text("(\(product.reviewCount))")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                
                // Price section
                HStack(alignment: .bottom, spacing: 6) {
                    Text(product.formattedPrice)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                    
                    if let originalPrice = product.formattedOriginalPrice {
                        Text(originalPrice)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                }
                
                // Add to cart button
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        cartManager.addToCart(product: product)
                    }
                }) {
                    HStack {
                        Image(systemName: cartManager.isInCart(productId: product.id) ? "checkmark.circle.fill" : "cart.badge.plus")
                        Text(cartManager.isInCart(productId: product.id) ? "In Cart" : "Add to Cart")
                            .font(.system(size: 13, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(
                            colors: cartManager.isInCart(productId: product.id) ? 
                                [Color.green, Color.green.opacity(0.8)] :
                                gradientColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(.top, 12)
        }
        .padding(12)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isPressed = false
                }
                onTap()
            }
        }
    }
    
    private var gradientColors: [Color] {
        product.category.gradientColors.map { Color(hex: $0) }
    }
}

// Scale button style for animations
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

// Color extension for hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

