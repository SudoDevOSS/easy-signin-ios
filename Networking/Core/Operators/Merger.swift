//
//  Merger.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

public typealias Operation<T, U> = ((T, ((U) -> Void)?) -> Void)?
public typealias SingleParamOperation<U> = ((((U) -> Void)?) -> Void)?

public func merge<T, U, V>(_ lhs: Operation<T, U>, to rhs: Operation<U, V>) -> Operation<T, V> {
    return { (input, completion) in
        lhs?(input) { output in
            rhs?(output, completion)
        }

    }
}

public func singleMerge<T, V>(_ lhs: SingleParamOperation<T>, to rhs: SingleParamOperation<V>) -> SingleParamOperation<V> {
    return { (completion) in
        lhs? { output in
            rhs?(completion)
        }

    }
}


infix operator >>->>: LogicalConjunctionPrecedence // Precedence of &&

public func >>->><T, U, V>(lhs: Operation<T, U>, rhs: Operation<U, V>) -> Operation<T, V> {
    return merge(lhs, to: rhs)
}
