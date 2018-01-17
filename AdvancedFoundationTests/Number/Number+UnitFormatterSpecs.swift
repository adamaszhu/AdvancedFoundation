class NumberUnitFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls distanceString(withPrecision:withAbbr)") {
            context("as one meter") {
                let number = NSNumber(value: 1)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.000000 M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.000000 Meter"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000 M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1 M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.00 M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000 M"
                    }
                }
            }
            context("as one more meter") {
                let number = NSNumber(value: 1.23)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.230000 M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.230000 Meter"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000 M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1 M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.23 M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000 M"
                    }
                }
            }
            context("as several meters") {
                let number = NSNumber(value: 5)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "5.000000 M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "5.000000 Meters"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000 M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "5 M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "5.00 M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000 M"
                    }
                }
            }
            context("as one kilometer") {
                let number = NSNumber(value: 1000)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.000000 KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.000000 Kilometer"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000 KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1 KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.00 KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000 KM"
                    }
                }
            }
            context("as one more kilometer") {
                let number = NSNumber(value: 1230)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.230000 KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.230000 Kilometer"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000 KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1 KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.23 KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000 KM"
                    }
                }
            }
            context("as several kilometers") {
                let number = NSNumber(value: 5000)
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "5.000000 KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "5.000000 Kilometers"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000 KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "5 KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "5.00 KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000 KM"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation

