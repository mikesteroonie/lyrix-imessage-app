
import UIKit

class DetailViewController: UIViewController {
    
    var selectedArtist: String?
    var promptTitle: UILabel!
    var firstStageOneLiner: UILabel!
    var artistImageView: UIImageView!
    var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundGradient()
        setupViews()
    }
    
    func setupViews() {
            // Setup the title "Prompt"
            promptTitle = UILabel()
            promptTitle.translatesAutoresizingMaskIntoConstraints = false
            promptTitle.text = "\"PROMPT\""
            promptTitle.font = UIFont.boldSystemFont(ofSize: 36)
            view.addSubview(promptTitle)
            
            NSLayoutConstraint.activate([
                promptTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                promptTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            // Setup the firstStageOneLiner UILabel
            firstStageOneLiner = UILabel()
            firstStageOneLiner.translatesAutoresizingMaskIntoConstraints = false
            firstStageOneLiner.text = "What do you want them to say?"
            firstStageOneLiner.font = UIFont.systemFont(ofSize: 10)
            firstStageOneLiner.textColor = .black
            firstStageOneLiner.textAlignment = .center
            view.addSubview(firstStageOneLiner)
            
            NSLayoutConstraint.activate([
                firstStageOneLiner.topAnchor.constraint(equalTo: promptTitle.bottomAnchor, constant: 10),
                firstStageOneLiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                firstStageOneLiner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                firstStageOneLiner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            
            // Setup the artist image view to take up the whole width
            let artistImageName = "\(selectedArtist ?? "")pile"
            artistImageView = UIImageView()
            artistImageView.translatesAutoresizingMaskIntoConstraints = false
            artistImageView.contentMode = .scaleAspectFit
            artistImageView.image = UIImage(named: artistImageName)
            view.addSubview(artistImageView)
            
            NSLayoutConstraint.activate([
                artistImageView.topAnchor.constraint(equalTo: firstStageOneLiner.bottomAnchor, constant: 10),
                artistImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                artistImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                artistImageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: 0.5)
            ])
            
            // Setup the input text field
            inputTextField = UITextField()
            inputTextField.translatesAutoresizingMaskIntoConstraints = false
            inputTextField.borderStyle = .roundedRect
            inputTextField.placeholder = "Enter your thoughts..."
            view.addSubview(inputTextField)
            
            NSLayoutConstraint.activate([
                inputTextField.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 20),
                inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                inputTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                inputTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
        }


    func setupBackgroundGradient() {
        let bottomColor: CGColor
        switch selectedArtist {
        case "drake":
            bottomColor = UIColor(red: 143/255.0, green: 198/255.0, blue: 249/255.0, alpha: 1.0).cgColor // Blue
        case "kanye":
            bottomColor = UIColor(red: 201/255.0, green: 166/255.0, blue: 141/255.0, alpha: 1.0).cgColor // Red
        case "travis":
            bottomColor = UIColor(red: 199/255.0, green: 234/255.0, blue: 178/255.0, alpha: 1.0).cgColor // Green
        // Add more specific cases as needed.
        case "weeknd":
            bottomColor = UIColor(red: 229/255.0, green: 234/255.0, blue: 178/255.0, alpha: 1.0).cgColor // Green
        case "future":
            bottomColor = UIColor(red: 193/255.0, green: 193/255.0, blue: 193/255.0, alpha: 1.0).cgColor // Green
        case "olivia":
            bottomColor = UIColor(red: 255/255.0, green: 166/255.0, blue: 187/255.0, alpha: 1.0).cgColor // Green
            
        case "taylor":
            bottomColor = UIColor(red: 255/255.0, green: 163/255.0, blue: 163/255.0, alpha: 1.0).cgColor // Green
            
        case "sza":
            bottomColor = UIColor(red: 197/255.0, green: 124/255.0, blue: 209/255.0, alpha: 1.0).cgColor // Green
            
        default:
            bottomColor = UIColor.black.cgColor
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, bottomColor]
        gradientLayer.locations = [0.5, 1.0]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
