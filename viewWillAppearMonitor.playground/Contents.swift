//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
}


extension UIViewController {
    // monitor view will appear
    open class func createListenerToViewWillAppear() {
        
        // make sure this isn't a subclass
        guard self == UIViewController.self else {return}
        
        let originalSelector = #selector(UIViewController.viewWillAppear(_:))
        let selfSelector = #selector(UIViewController.self_viewWillAppear(animated:))
        
        guard let originalMethod = class_getInstanceMethod(self, originalSelector) else {return}
        guard let selfMethod = class_getInstanceMethod(self, selfSelector) else {return}
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(selfMethod), method_getTypeEncoding(selfMethod))
        
        if didAddMethod {
            class_replaceMethod(self, selfSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, selfMethod);
        }
    }
    
    // listener -> viewWillAppear
    @objc func self_viewWillAppear(animated: Bool) {
        self.self_viewWillAppear(animated: animated)
        print("viewWillAppear: \(self.description)")
    }
}
