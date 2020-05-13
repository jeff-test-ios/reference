import UIKit
import PlaygroundSupport

let liveView = UIView()
liveView.frame.size = CGSize(width: 300, height: 300)
liveView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
PlaygroundPage.current.liveView = liveView

let blockView = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
blockView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
blockView.layer.cornerRadius = 15
liveView.addSubview(blockView)

UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: [], animations: {
    
    blockView.transform = CGAffineTransform(translationX: 100, y: 100)
    
}, completion: nil)
