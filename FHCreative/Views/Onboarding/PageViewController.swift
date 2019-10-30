//
//  PageViewController.swift
//  FHCreative
//
//  Created by Admin on 09/10/2019.
//  Copyright © 2019 MontiRed. All rights reserved.
//

//  Code used from BLCKBIRDS
//  How to create an onboarding screen in swiftUI #1 Embedding a UIPageViewController

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    var viewControllers : [UIViewController]
    
    @Binding var currentPageIndex: Int
    
    func makeCoordinator() -> PageViewController.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController:UIPageViewController, context:Context) {
        pageViewController.setViewControllers([viewControllers[currentPageIndex]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController){
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            //retrieve the index of the currently displayed view controller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            //shows the last view controller when the user swipes from the inital view controller
            if index == 0 {
                return parent.viewControllers.last
            }
            
            //show the view controller before the currenly displayed view controller
            return parent.viewControllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            //Retrieves the index of the currenly displayed view controller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            //Shows the first view controllers when the user swipes further from the last view controller
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            return parent.viewControllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.viewControllers.firstIndex(of: visibleViewController){
                parent.currentPageIndex = index
            }
        }
    }
}
