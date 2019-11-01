//
//  PermanentThreadTestViewController.swift
//  RunLoopDemo
//
//  Created by wuqh on 2019/10/31.
//  Copyright © 2019 吴启晗. All rights reserved.
//

import UIKit
//https://www.jianshu.com/p/582b7ad7fe4d
class Monitor {
    
    let semaphore: DispatchSemaphore
    
    init() {
        semaphore = DispatchSemaphore(value: 0)
    }
    
    func start() {
        let context = CFRunLoopObserverContext()
        //肉眼可见的卡顿肯定是在主线程，所以给主线程的runloop添加observer
        let observer = CFRunLoopObserverCreate(kCFAllocatorDefault, CFRunLoopActivity.allActivities, true, 0, <#T##callout: CFRunLoopObserverCallBack!##CFRunLoopObserverCallBack!##(CFRunLoopObserver?, CFRunLoopActivity, UnsafeMutableRawPointer?) -> Void#>, <#T##context: UnsafeMutablePointer<CFRunLoopObserverContext>!##UnsafeMutablePointer<CFRunLoopObserverContext>!#>)
        CFRunLoopAddObserver(CFRunLoopGetMain(), <#T##observer: CFRunLoopObserver!##CFRunLoopObserver!#>, <#T##mode: CFRunLoopMode!##CFRunLoopMode!#>)
    }

    
}

class PermanentThreadTestViewController: UIViewController {
    
    let permanentThread = PermanentThread()
    
    deinit {
        print("PermanentThreadTestViewController - dealloc")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        permanentThread.executeTask {
            print("executeTask")
        }
    }
    

}



