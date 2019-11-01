//
//  PermanentThread.swift
//  RunLoopDemo
//
//  Created by wuqh on 2019/10/31.
//  Copyright © 2019 吴启晗. All rights reserved.
//

import UIKit

class InnerThread: Thread {
    deinit {
        print("InnerThread Dealloc")
    }
}

class PermanentThread: NSObject {
    
    let thread: InnerThread
    
    override init() {
        thread = InnerThread.init {
            var context = CFRunLoopSourceContext()
            //Swift中 create 后不需要调用CFRelease
            let source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context)!
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, CFRunLoopMode.defaultMode)
            //设置为true的话，处理一次事件就会返回
            CFRunLoopRun()
            
            print("thread - end")
        }
        thread.start()
        super.init()
    }
    
    deinit {
        exit()
        print("PermanentThread Dealloc")
    }
    
    func executeTask(block: (()->Void)?) {
        perform(#selector(doExecuteTask(block:)), on: thread, with: block, waitUntilDone: false)
    }
    
    func exit() {
        if thread.isExecuting {
            perform(#selector(doExit), on: thread, with: nil, waitUntilDone: true)
        }
    }
    
    
}

extension PermanentThread {
    // 这里的参数不能写 ()->Void, 必须写Any。不然传过来的参数会被改变。调用block就会崩溃。
    @objc private func doExecuteTask(block: Any) {
        if let _block = block as? (()->Void) {
            _block()
        }
    }
    
    @objc private func doExit() {
        thread.cancel()
        CFRunLoopStop(CFRunLoopGetCurrent())
    }
}
