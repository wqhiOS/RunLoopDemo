//
//  MonitorTestViewController.swift
//  RunLoopDemo
//
//  Created by wuqh on 2019/11/1.
//  Copyright © 2019 吴启晗. All rights reserved.
//

import UIKit

class MonitorTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        

//        //创建子线程监控
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            //子线程开启一个持续的 loop 用来进行监控
//            while (YES) {
//                long semaphoreWait = dispatch_semaphore_wait(dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC));
//                if (semaphoreWait != 0) {
//                    if (!runLoopObserver) {
//                        timeoutCount = 0;
//                        dispatchSemaphore = 0;
//                        runLoopActivity = 0;
//                        return;
//                    }
//                    //BeforeSources 和 AfterWaiting 这两个状态能够检测到是否卡顿
//                    if (runLoopActivity == kCFRunLoopBeforeSources || runLoopActivity == kCFRunLoopAfterWaiting) {
//                        //将堆栈信息上报服务器的代码放到这里
//                    } //end activity
//                }// end semaphore wait
//                timeoutCount = 0;
//            }// end while
//        });
    }
    
    private func MonitorStart() {
        DispatchQueue.global().async {
            while(true) {
//                let semaphoreWait = dispatch_semaphore_wait
            }
        }
    }
}
