//
//  BannerAdView.swift
//  MovieSwift
//
//  Created by Akshat Goyal on 11/02/25.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//
import SwiftUI

struct BannerAdView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }

    let bannerView: UIView
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(bannerView)
        
        // Ensure containerView has its own size constraints
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: bannerView.frame.width),
            containerView.heightAnchor.constraint(equalToConstant: bannerView.frame.height)
        ])
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bannerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            bannerView.widthAnchor.constraint(equalToConstant: bannerView.frame.width),
            bannerView.heightAnchor.constraint(equalToConstant: bannerView.frame.height)
        ])
        return containerView
    }
}
