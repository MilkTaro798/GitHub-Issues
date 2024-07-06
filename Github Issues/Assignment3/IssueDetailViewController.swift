//
//  IssueDetailViewController.swift
//  Assignment3
//
//  Created by Yutong Sun on 1/23/24.
//

import UIKit

class IssueDetailViewController: UIViewController {
    var issueDetail: GithubIssue?
    @IBAction func openInSafari(_ sender: UIBarButtonItem) {
            if let urlString = issueDetail?.htmlUrl, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    @IBOutlet var IssueTitle: UILabel!
    @IBOutlet var IssueState: UIImageView!
    @IBOutlet var IssueBody: UITextView!
    @IBOutlet var Date: UILabel!
    @IBOutlet var Username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        IssueTitle.text = issueDetail?.title
        Username.text = "@\(issueDetail?.user.login ?? "nil")"
        IssueBody.text = issueDetail?.body
        let appearance = UINavigationBarAppearance()
        if issueDetail?.state == "open" {
            IssueState.image = UIImage(systemName: "envelope.open")
            IssueState.tintColor = UIColor.red
            appearance.backgroundColor = UIColor.red
        }
        else {
            
            IssueState.image = UIImage(systemName: "envelope")
            IssueState.tintColor = UIColor.green
            appearance.backgroundColor = UIColor.green
        }
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateStyle = .long
        dateFormatterPrint.timeStyle = .none

        if let dateString = issueDetail?.createdAt,
        let date = dateFormatter.date(from: dateString) {
            Date.text = dateFormatterPrint.string(from: date)
        } else {
            Date.text = "Unknown Date"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
