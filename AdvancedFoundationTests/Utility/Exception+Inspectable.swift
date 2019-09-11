/// Exception+Inspectable inspect the error while doing unit tests.
///
/// - author: Adamas
/// - version: 1.6.0
/// - date: 30/03/2019
func expectException(in action: @escaping () throws -> Any) {
    do {
        _ = try action()
        expect("No exception") == "An exception"
    } catch {
        expect("An exception") == "An exception"
    }
}

import Nimble
