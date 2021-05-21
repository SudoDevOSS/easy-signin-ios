//
//  ApiResultPublisher.swift
//  Networking
//
//  Created by Sudo Dev OSS on 14/2/21.
//

import Combine
struct ApiResultPublisher<Output>: Publisher {
    public typealias Failure = Never
    public let output: Output

    public init(_ output: Output) {
        self.output = output
    }

    func receive<S: Subscriber>(
        subscriber: S
    ) where S.Input == Output, S.Failure == Never {
        let subscription = Subscription(output: output, subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}

private extension ApiResultPublisher {
    final class Subscription<S: Subscriber> : Combine.Subscription where S.Input == Output, S.Failure == Failure {
        func request(_ demand: Subscribers.Demand) {
            if demand > 0 {
                let _ = self.subscriber?.receive(self.output)
            }
        }

        func cancel() {
            self.subscriber = nil
        }

        private let output: Output
        private var subscriber: S?

        init(output: Output, subscriber: S) {
            self.output = output
            self.subscriber = subscriber
        }
    }
}
