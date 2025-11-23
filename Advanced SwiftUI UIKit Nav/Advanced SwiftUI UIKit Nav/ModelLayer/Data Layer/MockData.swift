//
//  MockData.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Foundation

// Mock data for electronics shop
class MockData {
    
    static let products: [Product] = [
        // Smartphones
        Product(
            id: "1",
            name: "ProPhone 15 Ultra",
            category: .smartphones,
            price: 1199.99,
            originalPrice: 1399.99,
            description: "The ultimate smartphone experience with cutting-edge technology and stunning design.",
            specifications: [
                "Display": "6.7\" OLED Super Retina",
                "Processor": "A17 Pro Chip",
                "Camera": "48MP Triple Camera",
                "Battery": "4500mAh Fast Charging",
                "Storage": "256GB"
            ],
            imageName: "phone.fill",
            rating: 4.8,
            reviewCount: 2547,
            inStock: true,
            isFeatured: true,
            colors: ["Space Black", "Silver", "Deep Purple"]
        ),
        Product(
            id: "2",
            name: "Galaxy X Pro",
            category: .smartphones,
            price: 999.99,
            originalPrice: nil,
            description: "Premium Android flagship with exceptional performance and camera capabilities.",
            specifications: [
                "Display": "6.8\" Dynamic AMOLED",
                "Processor": "Snapdragon 8 Gen 3",
                "Camera": "200MP Quad Camera",
                "Battery": "5000mAh",
                "Storage": "512GB"
            ],
            imageName: "iphone",
            rating: 4.6,
            reviewCount: 1823,
            inStock: true,
            isFeatured: true,
            colors: ["Phantom Black", "Cream", "Green"]
        ),
        
        // Laptops
        Product(
            id: "3",
            name: "UltraBook Pro 16",
            category: .laptops,
            price: 2499.99,
            originalPrice: 2799.99,
            description: "Professional laptop with unprecedented performance for creators and developers.",
            specifications: [
                "Display": "16\" Liquid Retina XDR",
                "Processor": "M3 Max Chip",
                "RAM": "32GB Unified Memory",
                "Storage": "1TB SSD",
                "Battery": "Up to 22 hours"
            ],
            imageName: "laptopcomputer",
            rating: 4.9,
            reviewCount: 987,
            inStock: true,
            isFeatured: true,
            colors: ["Space Gray", "Silver"]
        ),
        Product(
            id: "4",
            name: "TechBook Air 13",
            category: .laptops,
            price: 1299.99,
            originalPrice: nil,
            description: "Ultra-portable laptop perfect for work and entertainment on the go.",
            specifications: [
                "Display": "13.6\" Retina Display",
                "Processor": "M2 Chip",
                "RAM": "16GB",
                "Storage": "512GB SSD",
                "Weight": "2.7 lbs"
            ],
            imageName: "laptopcomputer",
            rating: 4.7,
            reviewCount: 1456,
            inStock: true,
            isFeatured: false,
            colors: ["Midnight", "Starlight", "Silver", "Space Gray"]
        ),
        
        // Tablets
        Product(
            id: "5",
            name: "TechPad Pro 12.9",
            category: .tablets,
            price: 1099.99,
            originalPrice: 1299.99,
            description: "The ultimate tablet for creativity and productivity with stunning display.",
            specifications: [
                "Display": "12.9\" Liquid Retina XDR",
                "Processor": "M2 Chip",
                "Storage": "256GB",
                "Camera": "12MP Wide + 10MP Ultra Wide",
                "Apple Pencil": "2nd Gen Compatible"
            ],
            imageName: "ipad",
            rating: 4.8,
            reviewCount: 756,
            inStock: true,
            isFeatured: true,
            colors: ["Space Gray", "Silver"]
        ),
        
        // Headphones
        Product(
            id: "6",
            name: "AirMax Pro Wireless",
            category: .headphones,
            price: 349.99,
            originalPrice: 399.99,
            description: "Premium noise-cancelling headphones with spatial audio and transparency mode.",
            specifications: [
                "Audio": "Adaptive EQ & Spatial Audio",
                "Battery": "Up to 30 hours",
                "Connectivity": "Bluetooth 5.3",
                "Features": "Active Noise Cancellation",
                "Weight": "250g"
            ],
            imageName: "headphones",
            rating: 4.7,
            reviewCount: 3421,
            inStock: true,
            isFeatured: true,
            colors: ["Silver", "Space Gray", "Sky Blue", "Pink"]
        ),
        Product(
            id: "7",
            name: "SoundBuds Ultra",
            category: .headphones,
            price: 179.99,
            originalPrice: nil,
            description: "True wireless earbuds with premium sound quality and all-day comfort.",
            specifications: [
                "Audio": "Hi-Fi Sound Quality",
                "Battery": "8h + 24h case",
                "Charging": "USB-C & Wireless",
                "Features": "ANC & Transparency",
                "Water Resistance": "IPX4"
            ],
            imageName: "earbuds",
            rating: 4.5,
            reviewCount: 2134,
            inStock: true,
            isFeatured: false,
            colors: ["White", "Black", "Blue"]
        ),
        
        // Smart Watches
        Product(
            id: "8",
            name: "SmartWatch Series 9",
            category: .watches,
            price: 429.99,
            originalPrice: 499.99,
            description: "Advanced health and fitness tracking with always-on display and cellular connectivity.",
            specifications: [
                "Display": "1.9\" Always-On Retina",
                "Processor": "S9 SiP",
                "Sensors": "Blood Oxygen, ECG, Temperature",
                "Battery": "Up to 18 hours",
                "Water Resistance": "50m"
            ],
            imageName: "applewatch",
            rating: 4.8,
            reviewCount: 1987,
            inStock: true,
            isFeatured: true,
            colors: ["Midnight", "Starlight", "Pink", "Product Red"]
        ),
        
        // Accessories
        Product(
            id: "9",
            name: "MagSafe Charger Pro",
            category: .accessories,
            price: 49.99,
            originalPrice: nil,
            description: "Fast wireless charging pad with magnetic alignment for perfect charging every time.",
            specifications: [
                "Power": "15W Fast Charging",
                "Compatibility": "All Qi devices",
                "Cable": "2m USB-C",
                "Features": "Magnetic Alignment",
                "Material": "Premium Aluminum"
            ],
            imageName: "cable.connector",
            rating: 4.6,
            reviewCount: 892,
            inStock: true,
            isFeatured: false,
            colors: ["White", "Black"]
        ),
        Product(
            id: "10",
            name: "Protective Case Ultra",
            category: .accessories,
            price: 59.99,
            originalPrice: 79.99,
            description: "Military-grade protection with sleek design and MagSafe compatibility.",
            specifications: [
                "Protection": "Military Grade Drop",
                "Material": "TPU + Polycarbonate",
                "MagSafe": "Compatible",
                "Buttons": "Precision Cut",
                "Warranty": "Lifetime"
            ],
            imageName: "iphone.case",
            rating: 4.7,
            reviewCount: 1234,
            inStock: true,
            isFeatured: false,
            colors: ["Clear", "Black", "Navy", "Rose Gold"]
        ),
        Product(
            id: "11",
            name: "USB-C Hub Pro",
            category: .accessories,
            price: 89.99,
            originalPrice: nil,
            description: "7-in-1 USB-C hub with 4K HDMI, USB 3.0, SD card reader, and power delivery.",
            specifications: [
                "Ports": "7-in-1 Multiport",
                "HDMI": "4K@60Hz",
                "USB": "USB 3.0 (5Gbps)",
                "Power": "100W Pass-through",
                "Build": "Aluminum Alloy"
            ],
            imageName: "cable.connector.horizontal",
            rating: 4.5,
            reviewCount: 567,
            inStock: true,
            isFeatured: false,
            colors: ["Space Gray", "Silver"]
        ),
        
        // More Products
        Product(
            id: "12",
            name: "ProPhone 14 Standard",
            category: .smartphones,
            price: 799.99,
            originalPrice: 899.99,
            description: "Powerful smartphone with excellent camera and all-day battery life.",
            specifications: [
                "Display": "6.1\" OLED Display",
                "Processor": "A16 Bionic",
                "Camera": "12MP Dual Camera",
                "Battery": "3900mAh",
                "Storage": "128GB"
            ],
            imageName: "iphone",
            rating: 4.6,
            reviewCount: 4532,
            inStock: true,
            isFeatured: false,
            colors: ["Blue", "Purple", "Midnight", "Starlight", "Red"]
        )
    ]
    
    static var featuredProducts: [Product] {
        products.filter { $0.isFeatured }
    }
    
    static func products(for category: ProductCategory) -> [Product] {
        products.filter { $0.category == category }
    }
    
    static func product(withId id: String) -> Product? {
        products.first { $0.id == id }
    }
}

