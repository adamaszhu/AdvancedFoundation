class DateFormatterSpecs: QuickSpec {
    
    // Cannot extract date declaration since the test should be done right after the decleration.
    override func spec() {
        let secondLength = 1
        let minuteLength = 60 * secondLength
        let hourLength = 60 * minuteLength
        let dayLength = 24 * hourLength
        let yearLength = 365 * dayLength
        let monthLength = yearLength / 12
        var date: Date!
        describe("calls string(withPattern)") {
            beforeEach {
                date = Date()
            }
            context("with full year pattern") {
                it("returns 20xx") {
                    let string = date.string(withPattern: Date.fullYearPattern)
                    expect(string.hasPrefix("20")) == true
                    expect(string.count) == 4
                }
            }
            context("with abbr month pattern") {
                it("returns XXX") {
                    let string = date.string(withPattern: Date.abbrMonthPattern)
                    expect(string.count) == 3
                }
            }
            context("with day pattern") {
                it("returns XX") {
                    let string = date.string(withPattern: Date.dayPattern)
                    expect(string.count) == 2
                }
            }
            context("with month pattern") {
                it("returns XX") {
                    let string = date.string(withPattern: Date.monthPattern)
                    expect(string.count) == 2
                }
            }
        }
        describe("calls timeOffsetString(withPrecision:withAbbreviation)") {
            context("as now") {
                beforeEach {
                    date = Date()
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "Now"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "Now"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "Now"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "Now"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as later") {
                beforeEach {
                    date = Date().addingTimeInterval(1)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Sec Later"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Second Later"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Second Later"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Second Later"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year 1 month 1 day 1 hour 1 minute and 1 second before") {
                let timeOffset = TimeInterval(-365 * 24 * 60 * 60 * 13 / 12 - 24 * 60 * 60 - 60 * 60 - 60 - 1)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Yr 1 Mon 1 Day 1 Hr 1 Min 1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 2)) == "1 Year 1 Month Ago"
                    }
                }
                context("with over precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 100)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
                context("with less precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Year Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year and 1 second before") {
                let timeOffset = TimeInterval(-365 * 24 * 60 * 60 - 1)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Yr 1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Year 1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Year 1 Second Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 2)) == "1 Year 1 Second Ago"
                    }
                }
                context("with over precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 100)) == "1 Year 1 Second Ago"
                    }
                }
                context("with less precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Year Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 second before") {
                let timeOffset = TimeInterval(-1 * secondLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Second Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Second Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 seconds before") {
                let timeOffset = TimeInterval(-2 * secondLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Secs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Seconds Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Seconds Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Seconds Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 minute before") {
                let timeOffset = TimeInterval(-1 * minuteLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Min Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Minute Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Minute Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Minute Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 minutes before") {
                let timeOffset = TimeInterval(-2 * minuteLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Mins Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Minutes Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Minutes Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Minutes Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 hour before") {
                let timeOffset = TimeInterval(-1 * hourLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Hr Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Hour Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Hour Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Hour Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 hours before") {
                let timeOffset = TimeInterval(-2 * hourLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Hrs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Hours Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Hours Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Hours Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 day before") {
                let timeOffset = TimeInterval(-1 * dayLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Day Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Day Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Day Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Day Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 days before") {
                let timeOffset = TimeInterval(-2 * dayLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Days Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Days Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Days Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Days Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 month before") {
                let timeOffset = TimeInterval(-1 * monthLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Mon Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Month Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Month Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Month Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 months before") {
                let timeOffset = TimeInterval(-2 * monthLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Mons Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Months Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Months Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Months Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 1 year before") {
                let timeOffset = TimeInterval(-1 * yearLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "1 Yr Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "1 Year Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "1 Year Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "1 Year Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
            context("as 2 years before") {
                let timeOffset = TimeInterval(-2 * yearLength)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: true)) == "2 Yrs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withAbbreviation: false)) == "2 Years Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString()) == "2 Years Ago"
                    }
                }
                context("with valid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 1)) == "2 Years Ago"
                    }
                }
                context("with invalid precision") {
                    it("returns correct timeoffset") {
                        expect(date.timeOffsetString(withPrecision: 0)) == ""
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation








