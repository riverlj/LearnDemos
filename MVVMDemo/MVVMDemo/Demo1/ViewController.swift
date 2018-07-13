//
//  ViewController.swift
//  MVVMDemo
//
//  Created by RiverLi on 2018/7/12.
//  Copyright © 2018年 RiverLi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var textfiled1: UITextField!
    let person = Person.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo1"
        self.bind1()
    }
    
    /**
     引入<->操作符，见Operators.swift文件
     */
    private func bind2() {
        _ =  self.textfiled1.rx.textInput <-> self.person.userName
    }
    
    /**
     基本的绑定方法
     */
    private func bind1() {
        self.person.userName.asObservable().debug("riverli---")
            .bind(to: self.textfiled1.rx.text)
            .disposed(by: disposeBag)
        
        self.textfiled1.rx.text.orEmpty.debug("riverli000----")
            .bind(to: self.person.userName)
            .disposed(by: disposeBag)

    }
    
    @IBAction func printAction(_ sender: Any) {
        print("\(self.person.userName.value)")
    }
    
    @IBAction func changeValue(_ sender: Any) {
        self.person.userName.value = "lijiang"
    }
}

