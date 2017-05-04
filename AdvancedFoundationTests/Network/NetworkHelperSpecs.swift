class NetworkHelperHelperSpecs: QuickSpec {
    
    override func spec() {
        describe("has isNetworkAvailable") {
            it("is true") {
                expect(NetworkHelper.isNetworkAvailable) == true
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation
