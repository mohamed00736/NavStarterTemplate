//
//  ProductDetailViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Combine
import SwiftUI

protocol ProductDetailNavDelegate: AnyObject {
    func onBackTapped()
}

extension ProductDetailView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        let product: Product
        
        weak var navDelegate: ProductDetailNavDelegate?
        
        init(product: Product) {
            self.product = product
        }
    }
    
}

// MARK: - Actions
extension ProductDetailView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onBackTapped()
    }
    
}

