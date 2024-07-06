//
//  OpenIssueViewController.swift
//  Assignment3
//
//  Created by Yutong Sun on 1/23/24.
//

import UIKit

class OpenIssueViewController: UITableViewController {
    let githubClient = GitHubClient()
    var issues: [GithubIssue] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.red
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        Task {
            do {
                let issues = try await githubClient.fetchOpenIssues()
                self.issues = issues
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(refreshIssueData), for: .valueChanged)
                
        refreshIssueData()
    }
    
    @objc private func refreshIssueData() {
            Task {
                do {
                    let issues = try await githubClient.fetchOpenIssues()
                    self.issues = issues
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
                refreshControl?.endRefreshing()
            }
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issues.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IssueCell", for: indexPath) as! IssueTableViewCell
        // Configure the cell...
        
        cell.IssueTitle?.text = "\(issues[indexPath.row].title ?? "nil")"
        cell.Username?.text = "@\(issues[indexPath.row].user.login)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showIssueDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let issue = issues[indexPath.row]
                let detailViewController = segue.destination as! IssueDetailViewController
                detailViewController.issueDetail = issue
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
