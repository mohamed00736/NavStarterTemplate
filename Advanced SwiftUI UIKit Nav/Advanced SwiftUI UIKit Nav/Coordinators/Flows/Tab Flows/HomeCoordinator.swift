//
//  HomeCoordinator.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import UIKit

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
    
}

// MARK: - Showing Screens
extension HomeCoordinator {
    
    func showHomeScreen() {
        let viewModel = HomeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = HomeView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Shop"
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showProductDetail(product: Product) {
        let viewModel = ProductDetailView.ViewModel(product: product)
        viewModel.navDelegate = self
        
        let view = ProductDetailView(viewModel: viewModel)
        let controller = ProductDetailHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
    
    func showCart() {
        let viewModel = CartView.ViewModel()
        viewModel.navDelegate = self
        
        let view = CartView(viewModel: viewModel)
        let controller = CartHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
    
}

// MARK: - HomeNavDelegate
extension HomeCoordinator: HomeNavDelegate {
    
    func onProductTapped(product: Product) {
        showProductDetail(product: product)
    }
    
    func onCategoryTapped(category: ProductCategory) {
        // Category filtering is handled in the view
    }
    
    func onCartTapped() {
        showCart()
    }
    
    func onSearchTapped() {
        // Search functionality
    }
    
}

// MARK: - ProductDetailNavDelegate
extension HomeCoordinator: ProductDetailNavDelegate {
    
    func onBackTapped() {
        presenter.popViewController(animated: true)
    }
    
}

// MARK: - CartNavDelegate
extension HomeCoordinator: CartNavDelegate {
    
    func onCheckoutTapped() {
        // Show checkout flow
        let alert = UIAlertController(
            title: "Order Placed!",
            message: "Your order has been successfully placed. Thank you for shopping with us!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            CartManager.shared.clearCart()
            self?.presenter.popToRootViewController(animated: true)
        })
        presenter.present(alert, animated: true)
    }
    
    func onContinueShoppingTapped() {
        presenter.popToRootViewController(animated: true)
    }
    
}

