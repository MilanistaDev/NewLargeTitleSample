//
//  ViewController.swift
//  NewLargeTitleSample
//
//  Created by Takuya Aso on 2019/10/04.
//  Copyright © 2019 Takuya Aso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let cellName = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setUpNavigationBar()
    }

    private func setUpNavigationBar() {
        // Large Title Basic Settings
        self.navigationItem.title = "Large Title"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .red
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
            appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
            //appearance.titlePositionAdjustment = UIOffset(horizontal: -UIScreen.main.bounds.width / 2 + 64 , vertical: 0.0)
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.standardAppearance = appearance
        } else {
            self.navigationController?.navigationBar.barTintColor = .red
        }
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName)
        cell?.textLabel?.text = "Cell " + String(indexPath.row)
        return cell!
    }
}
