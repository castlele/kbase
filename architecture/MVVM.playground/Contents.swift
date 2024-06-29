import UIKit
import Combine

enum PaymentMethodType: String {
    case bankCardOnline
    case bankCard
    case cash

    var description: String {
        rawValue
    }
}

protocol ChoosePaymentMethodViewModelProtocol {
    var selectedPayment: Published<PaymentMethodType>? { get set }
}

final class ChoosePaymentMethodViewModel: ChoosePaymentMethodViewModelProtocol {

    private let paymentMethods: [PaymentMethodType]

    var selectedPayment: Published<PaymentMethodType>?

    init(paymentMethods: [PaymentMethodType]) {
        self.paymentMethods = paymentMethods
    }

    func choosePaymentMethod(atIndex index: Int) {
        //        view?.choose(paymentMethod: paymentMethods[index])
    }
}

final class ChoosePaymentMethodViewController: UIViewController, UITableViewDelegate {

    private let paymentMethodsTableView = UITableView()
    private let chooseButton = UIButton()

    private var subscriptions = Set<AnyCancellable>()

    var viewModel: ChoosePaymentMethodViewModelProtocol?

    func subscribe() {
        viewModel?.selectedPayment?.projectedValue.sink { [weak self] paymentType in
            self?.choose(paymentMethod: paymentType)
        }
        .store(in: &subscriptions)
    }

    // MARK: - ChoosePaymentMethodView

    func choose(paymentMethod: PaymentMethodType) {
        chooseButton.isEnabled = true
        chooseButton.setTitle("Select \(paymentMethod.description)", for: .normal)
    }
}
