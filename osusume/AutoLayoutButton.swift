import UIKit

class AutoLayoutButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupAutolayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
