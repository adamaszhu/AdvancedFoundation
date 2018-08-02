class NumberTimeFormattableSpecs: QuickSpec {
    
    override func spec() {
        let secondLength = 1
        let minuteLength = 60 * secondLength
        let hourLength = 60 * minuteLength
        let dayLength = 24 * hourLength
        let yearLength = 365 * dayLength
        let monthLength = yearLength / 12
        var number: NSNumber!
        describe("calls timeString(withPrecision:withAbbreviation)") {
            context("as 0") {
                beforeEach {
                    number = NSNumber(value: 0)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "0 Sec"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "0 Second"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "0 Second"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "0 Second"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year 1 month 1 day 1 hour 1 minute and 1 second") {
                let timeSpan = 365 * 24 * 60 * 60 * 13 / 12 + 24 * 60 * 60 + 60 * 60 + 60 + 1
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Yr 1 Mon 1 Day 1 Hr 1 Min 1 Sec"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second"
                    }
                }
                context("with over precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 100)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 2)) == "1 Year 1 Month"
                    }
                }
                context("with less precission") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Year"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year and 1 second") {
                let timeSpan = 365 * 24 * 60 * 60 + 1
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Yr 1 Sec"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Year 1 Second"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Year 1 Second"
                    }
                }
                context("with over precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 100)) == "1 Year 1 Second"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 2)) == "1 Year 1 Second"
                    }
                }
                context("with less precission") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Year"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 second") {
                let timeSpan = 1 * secondLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Sec"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Second"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Second"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Second"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 seconds") {
                let timeSpan = 2 * secondLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Secs"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Seconds"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Seconds"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Seconds"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 minute") {
                let timeSpan = 1 * minuteLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Min"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Minute"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Minute"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Minute"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 minutes") {
                let timeSpan = 2 * minuteLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Mins"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Minutes"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Minutes"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Minutes"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 hour") {
                let timeSpan = 1 * hourLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Hr"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Hour"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Hour"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Hour"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 hours") {
                let timeSpan = 2 * hourLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Hrs"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Hours"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Hours"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Hours"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 day") {
                let timeSpan = 1 * dayLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Day"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Day"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Day"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Day"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 days") {
                let timeSpan = 2 * dayLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Days"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Days"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Days"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Days"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 month") {
                let timeSpan = 1 * monthLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Mon"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Month"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Month"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Month"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 months") {
                let timeSpan = 2 * monthLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Mons"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Months"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Months"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Months"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year") {
                let timeSpan = 1 * yearLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "1 Yr"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "1 Year"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "1 Year"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "1 Year"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 years") {
                let timeSpan = 2 * yearLength
                beforeEach {
                    number = NSNumber(value: timeSpan)
                }
                context("with abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: true)) == "2 Yrs"
                    }
                }
                context("without abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString(withAbbreviation: false)) == "2 Years"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct time") {
                        expect(number.timeString()) == "2 Years"
                    }
                }
                context("with valid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 1)) == "2 Years"
                    }
                }
                context("with invalid precision") {
                    it("returns correct time") {
                        expect(number.timeString(withPrecision: 0)) == ""
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation
