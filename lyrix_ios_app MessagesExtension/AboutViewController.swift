import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white // Set a background color to distinguish the view controller
        
        // Setup the view controller's UI elements here
        let label = UILabel()
        label.text = "About"
        label.font = UIFont.systemFont(ofSize: 24)
        label.sizeToFit()
        label.center = self.view.center
        self.view.addSubview(label)
    }
}
