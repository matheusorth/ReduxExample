//
//  ViewController.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var infoBoardStackView: UIStackView!
    @IBOutlet weak var producerCounterLabel: UILabel!
    @IBOutlet weak var productCounterLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var consumerCounterLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.subscribe(self) { $0.select { $0.mainViewState } }
        tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }

    @IBAction func addProducerButtonDidPress(_ sender: Any) {
        store.dispatch(MainAction.addProducer)
    }
    
    @IBAction func addConsumerButtonDidPress(_ sender: Any) {
        store.dispatch(MainAction.addConsumer)
    }
    
}


// MARK: - StoreSubscriber

extension ViewController: StoreSubscriber {
    
    typealias StoreSubscriberStateType = MainViewState
    
    func newState(state: MainViewState) {
        producerCounterLabel.text = state.producerCounterText
        consumerCounterLabel.text = state.consumerCounterText
        productCounterLabel.text = state.productCounterText
        productTitleLabel.text = state.productTitle
        
        tableView.tableFooterView = state.productCounter == 0
            ? UIView()
            : UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 80))
        
        switch state.productAction {
        case .insert(let indexPath):
            tableView.performBatchUpdates({
                tableView.insertRows(at: [indexPath], with: .automatic)
            })
        case .remove(let indexPath):
            if indexPath.row < 0 { return }
            tableView.performBatchUpdates({
                tableView.deleteRows(at: [indexPath], with: .automatic)
            })
        case .none:
            break
        }
    }
    
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.state.mainViewState.productCounter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "produceCell", for: indexPath)
    }
    
}
