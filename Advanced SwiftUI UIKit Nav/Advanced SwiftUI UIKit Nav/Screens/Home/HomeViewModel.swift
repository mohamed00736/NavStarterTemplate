//
//  HomeViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Combine
import SwiftUI

protocol HomeNavDelegate: AnyObject {
    func onProductTapped(product: Product)
    func onCategoryTapped(category: ProductCategory)
    func onCartTapped()
    func onSearchTapped()
}

extension HomeView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var selectedCategory: ProductCategory? = nil
        @Published var searchText = ""
        @Published var showAlert = false
        var alertTitle = ""
        var alertMessage = ""
        
        weak var navDelegate: HomeNavDelegate?
        
        var featuredProducts: [Product] {
            MockData.featuredProducts
        }
        
        var filteredProducts: [Product] {
            if let category = selectedCategory {
                return MockData.products(for: category)
            }
            
            if !searchText.isEmpty {
                return MockData.products.filter {
                    $0.name.localizedCaseInsensitiveContains(searchText) ||
                    $0.category.rawValue.localizedCaseInsensitiveContains(searchText)
                }
            }
            
            return MockData.products
        }
    }
    
}

// MARK: - Actions
extension HomeView.ViewModel {
    
    func onProductTapped(product: Product) {
        navDelegate?.onProductTapped(product: product)
    }
    
    func onCategorySelected(category: ProductCategory) {
        if selectedCategory == category {
            selectedCategory = nil
        } else {
            selectedCategory = category
        }
    }
    
    func onCartTapped() {
        navDelegate?.onCartTapped()
    }
    
    func onSearchTapped() {
        navDelegate?.onSearchTapped()
    }
    
}
