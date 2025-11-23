//
//  CartView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: ViewModel
    @StateObject private var cartManager = CartManager.shared
    
    var body: some View {
        ZStack {
            if cartManager.items.isEmpty {
                emptyCartView
            } else {
                cartContentView
            }
        }
        .navigationTitle("Shopping Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Empty cart view
    private var emptyCartView: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart")
                .font(.system(size: 80))
                .foregroundColor(.gray.opacity(0.5))
            
            Text("Your cart is empty")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
            
            Text("Add some products to get started")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Button(action: {
                viewModel.onContinueShoppingTapped()
            }) {
                Text("Continue Shopping")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#667EEA"), Color(hex: "#764BA2")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
            }
            .buttonStyle(ScaleButtonStyle())
        }
    }
    
    // Cart content view
    private var cartContentView: some View {
        VStack(spacing: 0) {
            // Cart items list
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(cartManager.items) { item in
                        CartItemRow(
                            item: item,
                            onQuantityChanged: { newQuantity in
                                cartManager.updateQuantity(for: item, quantity: newQuantity)
                            },
                            onRemove: {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    cartManager.removeFromCart(item: item)
                                }
                            }
                        )
                    }
                }
                .padding(20)
            }
            
            // Order summary
            orderSummary
        }
    }
    
    // Order summary
    private var orderSummary: some View {
        VStack(spacing: 0) {
            Divider()
            
            VStack(spacing: 12) {
                // Subtotal
                HStack {
                    Text("Subtotal")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Spacer()
                    Text(cartManager.formattedSubtotal)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                
                // Tax
                HStack {
                    Text("Tax (8%)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Spacer()
                    Text(cartManager.formattedTax)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // Total
                HStack {
                    Text("Total")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                    Spacer()
                    Text(cartManager.formattedTotal)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                }
                
                // Checkout button
                Button(action: {
                    viewModel.onCheckoutTapped()
                }) {
                    HStack {
                        Text("Proceed to Checkout")
                            .font(.system(size: 18, weight: .bold))
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .padding(18)
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#667EEA"), Color(hex: "#764BA2")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding(20)
        }
        .background(Color(UIColor.systemBackground))
    }
}

// Cart item row
struct CartItemRow: View {
    
    let item: CartItem
    let onQuantityChanged: (Int) -> Void
    let onRemove: () -> Void
    
    var body: some View {
        HStack(spacing: 14) {
            // Product image
            ZStack {
                LinearGradient(
                    colors: item.product.category.gradientColors.map { Color(hex: $0) },
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                Image(systemName: item.product.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white.opacity(0.9))
                    .padding(20)
            }
            .frame(width: 90, height: 90)
            .cornerRadius(12)
            
            // Product info
            VStack(alignment: .leading, spacing: 6) {
                Text(item.product.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                if let color = item.selectedColor {
                    Text("Color: \(color)")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Text(item.product.formattedPrice)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primary)
                
                // Quantity controls
                HStack(spacing: 12) {
                    Button(action: {
                        onQuantityChanged(item.quantity - 1)
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color(UIColor.systemGray3))
                    }
                    
                    Text("\(item.quantity)")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(width: 30)
                    
                    Button(action: {
                        onQuantityChanged(item.quantity + 1)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color(hex: "#667EEA"))
                    }
                    
                    Spacer()
                    
                    // Remove button
                    Button(action: onRemove) {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .padding(12)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    NavigationView {
        CartView(viewModel: .init())
    }
}

