//  Created by react-native-create-bridge

import Foundation


@objc class GroupChatTableView : UIView, UITableViewDelegate, UITableViewDataSource {
  private var tableView : UITableView
  private var config: String?
  
  override init(frame: CGRect) {
    self.tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    super.init(frame: frame);
    self.frame = self.bounds;
    setupTableView()
  }
  
  private func setupTableView(){
    tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    tableView.frame = self.bounds
    tableView.delegate = self
    tableView.dataSource = self
    self.addSubview(tableView)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  @objc func setConfig(config: String) {
    self.config = config
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = "Test"
    return cell
  }
}
