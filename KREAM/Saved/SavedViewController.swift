//
//  SavedViewController.swift
//  KREAM
//
//  Created by 오현민 on 9/26/24.
//

import UIKit

class SavedViewController: UIViewController {

    let data = dummySavedModel.savedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView = SavedView().then {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
    }

}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121
    }
    
}
