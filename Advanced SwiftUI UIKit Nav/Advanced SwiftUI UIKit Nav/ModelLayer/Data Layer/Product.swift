//
//  Product.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Foundation

// Product model
struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let category: ProductCategory
    let price: Double
    let originalPrice: Double?
    let description: String
    let specifications: [String: String]
    let imageName: String
    let rating: Double
    let reviewCount: Int
    let inStock: Bool
    let isFeatured: Bool
    let colors: [String]
    
    var discountPercentage: Int? {
        guard let originalPrice = originalPrice else { return nil }
        return Int(((originalPrice - price) / originalPrice) * 100)
    }
    
    var formattedPrice: String {
        "$\(String(format: "%.2f", price))"
    }
    
    var formattedOriginalPrice: String? {
        guard let originalPrice = originalPrice else { return nil }
        return "$\(String(format: "%.2f", originalPrice))"
    }
}

// Product category
enum ProductCategory: String, Codable, CaseIterable {
    case smartphones = "Smartphones"
    case laptops = "Laptops"
    case tablets = "Tablets"
    case headphones = "Headphones"
    case watches = "Smart Watches"
    case accessories = "Accessories"
    
    var icon: String {
        switch self {
        case .smartphones: return "iphone"
        case .laptops: return "laptopcomputer"
        case .tablets: return "ipad"
        case .headphones: return "headphones"
        case .watches: return "applewatch"
        case .accessories: return "cable.connector"
        }
    }
    
    var gradientColors: [String] {
        switch self {
        case .smartphones: return ["#667EEA", "#764BA2"]
        case .laptops: return ["#F093FB", "#F5576C"]
        case .tablets: return ["#4FACFE", "#00F2FE"]
        case .headphones: return ["#43E97B", "#38F9D7"]
        case .watches: return ["#FA709A", "#FEE140"]
        case .accessories: return ["#30CFD0", "#330867"]
        }
    }
}

// Cart item
struct CartItem: Identifiable {
    let id: String
    let product: Product
    var quantity: Int
    var selectedColor: String?
    
    var totalPrice: Double {
        product.price * Double(quantity)
    }
}

// Order history
struct Order: Identifiable {
    let id: String
    let date: Date
    let items: [CartItem]
    let totalAmount: Double
    let status: OrderStatus
    
    enum OrderStatus: String {
        case processing = "Processing"
        case shipped = "Shipped"
        case delivered = "Delivered"
        case cancelled = "Cancelled"
    }
}

