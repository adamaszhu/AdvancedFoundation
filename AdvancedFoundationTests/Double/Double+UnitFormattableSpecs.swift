class DoubleUnitFormattableSpecs: QuickSpec {
    
    override func spec() {
        describe("calls distanceString(withPrecision:withAbbr)") {
            context("as one meter") {
                let number = 1.0
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.000000M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.000000 Meter"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.00M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000M"
                    }
                }
            }
            context("as one more meter") {
                let number = 1.23
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.230000M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.230000 Meter"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.23M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000M"
                    }
                }
            }
            context("as several meters") {
                let number = 5.0
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "5.000000M"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "5.000000 Meters"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000M"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "5M"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "5.00M"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000M"
                    }
                }
            }
            context("as one kilometer") {
                let number = 1000.0
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.000000KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.000000 Kilometer"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.00KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.000000KM"
                    }
                }
            }
            context("as one more kilometer") {
                let number = 1230.0
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "1.230000KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "1.230000 Kilometer"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "1KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "1.23KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "1.230000KM"
                    }
                }
            }
            context("as several kilometers") {
                let number = 5000.0
                context("with abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: true)) == "5.000000KM"
                    }
                }
                context("without abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withAbbr: false)) == "5.000000 Kilometers"
                    }
                }
                context("with default abbr") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000KM"
                    }
                }
                context("with no precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 0)) == "5KM"
                    }
                }
                context("with precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString(withPrecision: 2)) == "5.00KM"
                    }
                }
                context("with default precision") {
                    it("returns corrent distance string") {
                        expect(number.distanceString()) == "5.000000KM"
                    }
                }
            }
        }
    }
}

import Quick
import Nimble
@testable import AdvancedFoundation

