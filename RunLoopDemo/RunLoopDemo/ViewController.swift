//
//  ViewController.swift
//  RunLoopDemo
//
//  Created by wuqh on 2019/10/31.
//  Copyright © 2019 吴启晗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        return tableView
    }()
    
    deinit {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        test {
//          
//        }
//    }
//    
//    private func test(block: ()->Void) {
//        test2(block: block)
//    }
//    
//    private func test2(block: ()->Void) {
//        block()
//    }
    
    


}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.textLabel?.text = indexPath.row == 0 ? "常驻线程" : "卡顿监控"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(indexPath.row == 0 ? PermanentThreadTestViewController() : MonitorTestViewController(), animated: true)
    }
}
