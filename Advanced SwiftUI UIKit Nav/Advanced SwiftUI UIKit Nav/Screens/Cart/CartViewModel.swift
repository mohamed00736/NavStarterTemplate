//
//  CartViewModel.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import Combine
import SwiftUI

protocol CartNavDelegate: AnyObject {
    func onCheckoutTapped()
    func onContinueShoppingTapped()
}

extension CartView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: CartNavDelegate?
        
    }
    
}

// MARK: - Actions
extension CartView.ViewModel {
    
    func onCheckoutTapped() {
        navDelegate?.onCheckoutTapped()
    }
    
    func onContinueShoppingTapped() {
        navDelegate?.onContinueShoppingTapped()
    }
    
}

