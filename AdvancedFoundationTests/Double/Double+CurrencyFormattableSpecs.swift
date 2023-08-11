final class DoubleCurrencyFormattableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls centString()") {
            context("as int") {
                let number = 999999.0
                it("returns the cent string") {
                    expect(number.centString()) == "00"
                }
            }
            context("as double") {
                let number = 999999.55
                it("returns the cent string") {
                    expect(number.centString()) == "55"
                }
            }
        }
        describe("calls dollarString()") {
            context("as int") {
                let number = 999999.0
                it("returns the dollar string") {
                    expect(number.dollarString()) == "999,999"
                }
            }
            context("as double") {
                let number = 999999.55
                it("returns the dollar string") {
                    expect(number.dollarString()) == "999,999"
                }
            }
        }
        describe("calls currencyString(withCent)") {
            context("with 0") {
                let number: Double = 0
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$0.00"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$0"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString()) == "$0"
                    }
                }
            }
            context("with positive integer") {
                let number: Double = 1000
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$1,000.00"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString()) == "$1,000"
                    }
                }
            }
            context("with positive decimal with one digit") {
                let number: Double = 1000.5
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$1,000.50"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString()) == "$1,000.50"
                    }
                }
            }
            context("with positive decimal with two digits") {
                let number: Double = 1000.55
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "$1,000.55"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString()) == "$1,000.55"
                    }
                }
            }
            context("with negative integer") {
                let number: Double = -1000
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "-$1,000.00"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "-$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString()) == "-$1,000"
                    }
                }
            }
            context("with negative decimal with one digit") {
                let number: Double = -1000.5
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "-$1,000.50"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "-$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString()) == "-$1,000.50"
                    }
                }
            }
            context("with negative decimal with two digits") {
                let number: Double = -1000.55
                context("with cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString(withCent: true)) == "-$1,000.55"
                    }
                }
                context("without cent") {
                    it("returns money string without cent") {
                        expect(number.currencyString(withCent: false)) == "-$1,000"
                    }
                }
                context("with default cent") {
                    it("returns money string with cent") {
                        expect(number.currencyString()) == "-$1,000.55"
                    }
                }
            }
        }
        describe("calls init(currency)") {
            context("with invalid currency string") {
                it("returns nil") {
                    expect(Double(currency: "Test")) == nil
                }
            }
            context("with dollar currency string") {
                it("creates the number") {
                    expect(Double(currency: "$1")) == 1
                }
            }
            context("with decimal currency string") {
                it("creates the number") {
                    expect(Double(currency: "$1.50")) == 1.5
                }
            }
            context("with long currency string") {
                it("creates the number") {
                    expect(Double(currency: "$1,000.50")) == 1000.5
                }
            }
            context("with currency symbol in another locale") {
                it("returns nil") {
                    expect(Double(currency: "$¥1")) == nil
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation
