import UIKit
class CustomNavigationAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = true // Add this property to indicate the direction of the transition

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }

        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)

        if isPresenting {
            // For presenting (pushing), slide up
            toViewController.view.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
        } else {
            // For dismissing (popping), slide down
            toViewController.view.transform = CGAffineTransform(translationX: 0, y: -containerView.frame.height)
            containerView.sendSubviewToBack(toViewController.view)
        }

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            if self.isPresenting {
                toViewController.view.transform = .identity
                fromViewController.view.alpha = 0.5
            } else {
                fromViewController.view.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height)
                toViewController.view.alpha = 1
            }
        }, completion: { finished in
            fromViewController.view.transform = .identity
            fromViewController.view.alpha = 1
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

