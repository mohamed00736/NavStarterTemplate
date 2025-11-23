//
//  ProductDetailHostingController.swift
//  Advanced SwiftUI UIKit Nav
//
//  Created for Electronics Shop Demo
//

import SwiftUI
import UIKit

class ProductDetailHostingController: HostingController<ProductDetailView, ProductDetailView.ViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Product Details"
    }
    
}

