//
//  ProductDetailView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel: ViewModel
    @StateObject private var cartManager = CartManager.shared
    @State private var selectedColorIndex = 0
    @State private var quantity = 1
    @State private var showAddedToCart = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                // Product image with gradient
                productImageSection
                
                VStack(alignment: .leading, spacing: 20) {
                    // Category and rating
                    categoryAndRating
                    
                    // Product name
                    Text(viewModel.product.name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.primary)
                    
                    // Price section
                    priceSection
                    
                    // Color selection
                    if !viewModel.product.colors.isEmpty {
                        colorSelection
                    }
                    
                    // Quantity selector
                    quantitySection
                    
                    // Description
                    descriptionSection
                    
                    // Specifications
                    specificationsSection
                    
                    // Add to cart button
                    addToCartButton
                }
                .padding(20)
            }
        }
        .background(Color(UIColor.systemBackground))
        .navigationBarTitleDisplayMode(.inline)
        .overlay(
            // Added to cart notification
            addedToCartNotification
                .padding(.top, 60)
            , alignment: .top
        )
    }
    
    // Product image section
    private var productImageSection: some View {
        ZStack(alignment: .topTrailing) {
            // Gradient background with product image
            ZStack {
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                Image(systemName: viewModel.product.imageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white.opacity(0.9))
                    .padding(60)
            }
            .frame(height: 400)
            
            // Discount badge
            if let discount = viewModel.product.discountPercentage {
                Text("-\(discount)% OFF")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(12)
                    .padding(20)
            }
        }
    }
    
    // Category and rating
    private var categoryAndRating: some View {
        HStack {
            Text(viewModel.product.category.rawValue)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(8)
            
            Spacer()
            
            HStack(spacing: 4) {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(viewModel.product.rating) ? "star.fill" : "star")
                        .font(.system(size: 14))
                        .foregroundColor(.yellow)
                }
                Text(String(format: "%.1f", viewModel.product.rating))
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                Text("(\(viewModel.product.reviewCount))")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // Price section
    private var priceSection: some View {
        HStack(alignment: .bottom, spacing: 10) {
            Text(viewModel.product.formattedPrice)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.primary)
            
            if let originalPrice = viewModel.product.formattedOriginalPrice {
                Text(originalPrice)
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .strikethrough()
            }
            
            Spacer()
            
            // Stock status
            HStack(spacing: 6) {
                Circle()
                    .fill(viewModel.product.inStock ? Color.green : Color.red)
                    .frame(width: 8, height: 8)
                
                Text(viewModel.product.inStock ? "In Stock" : "Out of Stock")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(viewModel.product.inStock ? .green : .red)
            }
        }
    }
    
    // Color selection
    private var colorSelection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Available Colors")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(viewModel.product.colors.enumerated()), id: \.offset) { index, color in
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedColorIndex = index
                            }
                        }) {
                            Text(color)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(selectedColorIndex == index ? .white : .primary)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    selectedColorIndex == index ?
                                    LinearGradient(
                                        colors: gradientColors,
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    ) :
                                    LinearGradient(
                                        colors: [Color(UIColor.systemGray6), Color(UIColor.systemGray6)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
    
    // Quantity section
    private var quantitySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quantity")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
            
            HStack(spacing: 16) {
                Button(action: {
                    if quantity > 1 {
                        withAnimation {
                            quantity -= 1
                        }
                    }
                }) {
                    Image(systemName: "minus")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                        .frame(width: 40, height: 40)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(Circle())
                }
                
                Text("\(quantity)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                    .frame(width: 50)
                
                Button(action: {
                    withAnimation {
                        quantity += 1
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Circle())
                }
                
                Spacer()
            }
        }
    }
    
    // Description section
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Description")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
            
            Text(viewModel.product.description)
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
    }
    
    // Specifications section
    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Specifications")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.primary)
            
            VStack(spacing: 12) {
                ForEach(Array(viewModel.product.specifications.keys.sorted()), id: \.self) { key in
                    HStack {
                        Text(key)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(viewModel.product.specifications[key] ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                    .padding(12)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                }
            }
        }
    }
    
    // Add to cart button
    private var addToCartButton: some View {
        Button(action: {
            cartManager.addToCart(
                product: viewModel.product,
                quantity: quantity,
                color: viewModel.product.colors.isEmpty ? nil : viewModel.product.colors[selectedColorIndex]
            )
            
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                showAddedToCart = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    showAddedToCart = false
                }
            }
        }) {
            HStack {
                Image(systemName: "cart.badge.plus")
                    .font(.system(size: 20, weight: .bold))
                
                Text("Add to Cart")
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
                
                Text(viewModel.product.formattedPrice)
                    .font(.system(size: 18, weight: .bold))
            }
            .foregroundColor(.white)
            .padding(18)
            .background(
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .buttonStyle(ScaleButtonStyle())
        .padding(.top, 10)
    }
    
    // Added to cart notification
    private var addedToCartNotification: some View {
        Group {
            if showAddedToCart {
                HStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    
                    Text("Added to Cart!")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .background(
                    Capsule()
                        .fill(Color.green)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                )
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }
    
    private var gradientColors: [Color] {
        viewModel.product.category.gradientColors.map { Color(hex: $0) }
    }
}

#Preview {
    NavigationView {
        ProductDetailView(viewModel: .init(product: MockData.products[0]))
    }
}

