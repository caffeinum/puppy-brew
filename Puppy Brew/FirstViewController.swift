//
//  FirstViewController.swift
//  Puppy Brew
//
//  Created by Aleksey Bykhun on 17.03.2018.
//  Copyright © 2018 caffeinum. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifier = "BrewCellIdentifier"
    var controller = BrewController()
    var brews: [Brewery] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        brews = controller.reload()
    }
}

extension FirstViewController: UITableViewDataSource {
    func add(brew: Brewery) {
        controller.store(brew: brew)
        brews = controller.reload()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return brews.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            fatalError("Cannot dequeue cell!")
        }

        cell.textLabel?.text = String(describing: brews[indexPath.row])
        cell.textLabel?.numberOfLines = 3

        return cell
    }
}
