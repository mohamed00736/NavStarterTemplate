//
//  HomeView.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: ViewModel
    @StateObject private var cartManager = CartManager.shared
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                // Header with cart button
                header
                
                // Search bar
                searchBar
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                // Categories
                categoriesSection
                    .padding(.top, 24)
                
                // Featured products
                if viewModel.selectedCategory == nil {
                    featuredSection
                        .padding(.top, 24)
                }
                
                // All products grid
                productsGrid
                    .padding(.top, 24)
            }
            .padding(.bottom, 30)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarHidden(true)
    }
    
    // Header
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Discover")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.primary)
                
                Text("Find your perfect tech")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Cart button with badge
            ZStack(alignment: .topTrailing) {
                Button(action: {
                    viewModel.onCartTapped()
                }) {
                    Image(systemName: "cart.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.primary)
                        .frame(width: 50, height: 50)
                        .background(Color(UIColor.systemGray6))
                        .clipShape(Circle())
                }
                
                if cartManager.totalItems > 0 {
                    Text("\(cartManager.totalItems)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 5, y: -5)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
    
    // Search bar
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search products...", text: $viewModel.searchText)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding(14)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    // Categories section
    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Categories")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(ProductCategory.allCases, id: \.self) { category in
                        CategoryChip(
                            category: category,
                            isSelected: viewModel.selectedCategory == category,
                            onTap: {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    viewModel.onCategorySelected(category: category)
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    // Featured products section
    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Featured Products")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.featuredProducts) { product in
                        ProductCard(product: product) {
                            viewModel.onProductTapped(product: product)
                        }
                        .frame(width: 280)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    // Products grid
    private var productsGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(viewModel.selectedCategory?.rawValue ?? "All Products")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 20)
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ],
                spacing: 16
            ) {
                ForEach(viewModel.filteredProducts) { product in
                    ProductCard(product: product) {
                        viewModel.onProductTapped(product: product)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NavigationView {
        HomeView(viewModel: .init())
    }
}
