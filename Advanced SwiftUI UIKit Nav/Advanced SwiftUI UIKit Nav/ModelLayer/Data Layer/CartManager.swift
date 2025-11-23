//
//  CartManager.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Foundation
import Combine

// Shopping cart manager
class CartManager: ObservableObject {
    
    static let shared = CartManager()
    
    @Published var items: [CartItem] = []
    
    private init() {}
    
    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var subtotal: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
    
    var tax: Double {
        subtotal * 0.08
    }
    
    var total: Double {
        subtotal + tax
    }
    
    var formattedSubtotal: String {
        "$\(String(format: "%.2f", subtotal))"
    }
    
    var formattedTax: String {
        "$\(String(format: "%.2f", tax))"
    }
    
    var formattedTotal: String {
        "$\(String(format: "%.2f", total))"
    }
    
    // Add product to cart
    func addToCart(product: Product, quantity: Int = 1, color: String? = nil) {
        if let existingIndex = items.firstIndex(where: { $0.product.id == product.id && $0.selectedColor == color }) {
            items[existingIndex].quantity += quantity
        } else {
            let cartItem = CartItem(
                id: UUID().uuidString,
                product: product,
                quantity: quantity,
                selectedColor: color
            )
            items.append(cartItem)
        }
    }
    
    // Remove from cart
    func removeFromCart(item: CartItem) {
        items.removeAll { $0.id == item.id }
    }
    
    // Update quantity
    func updateQuantity(for item: CartItem, quantity: Int) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if quantity <= 0 {
                items.remove(at: index)
            } else {
                items[index].quantity = quantity
            }
        }
    }
    
    // Clear cart
    func clearCart() {
        items.removeAll()
    }
    
    // Check if product is in cart
    func isInCart(productId: String) -> Bool {
        items.contains { $0.product.id == productId }
    }
}

