class DateFormatterSpecs: QuickSpec {
    
    /**
     * All unit in second.
     */
    private static let yearLength = 365 * dayLength
    private static let monthLength = yearLength / 12
    private static let dayLength = 24 * hourLength
    private static let hourLength = 60 * minuteLength
    private static let minuteLength = 60 * secondLength
    private static let secondLength = 1
    
    // COMMENT: Cannot extract date declaration since the test should be done right after the decleration.
    override func spec() {
        describe("calls convertToTimeOffsetString(withAbbreviation)") {
            context("as now") {
                var date = Date()
                beforeEach {
                    date = Date()
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "Now"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "Now"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "Now"
                    }
                }
            }
            context("as later") {
                var date = Date().addingTimeInterval(1)
                beforeEach {
                    date = Date().addingTimeInterval(1)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Sec Later"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Second Later"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Second Later"
                    }
                }
            }
            context("as 1 year 1 month 1 day 1 hour 1 minute and 1 second before") {
                let timeOffset = TimeInterval(-365 * 24 * 60 * 60 * 13 / 12 - 24 * 60 * 60 - 60 * 60 - 60 - 1)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr 1 Mon 1 Day 1 Hr 1 Min 1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
            }
            context("as 1 year and 1 second before") {
                let timeOffset = TimeInterval(-365 * 24 * 60 * 60 - 1)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr 1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year 1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Year 1 Second Ago"
                    }
                }
            }
            context("as 1 second before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.secondLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Sec Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Second Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Second Ago"
                    }
                }
            }
            context("as 2 seconds before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.secondLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Secs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Seconds Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Seconds Ago"
                    }
                }
            }
            context("as 1 minute before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.minuteLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Min Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Minute Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Minute Ago"
                    }
                }
            }
            context("as 2 minutes before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.minuteLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Mins Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Minutes Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Minutes Ago"
                    }
                }
            }
            context("as 1 hour before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.hourLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Hr Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Hour Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Hour Ago"
                    }
                }
            }
            context("as 2 hours before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.hourLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Hrs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Hours Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Hours Ago"
                    }
                }
            }
            context("as 1 day before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.dayLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Day Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Day Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Day Ago"
                    }
                }
            }
            context("as 2 days before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.dayLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Days Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Days Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Days Ago"
                    }
                }
            }
            context("as 1 month before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.monthLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Mon Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Month Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Month Ago"
                    }
                }
            }
            context("as 2 months before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.monthLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Mons Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Months Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Months Ago"
                    }
                }
            }
            context("as 1 year before") {
                let timeOffset = TimeInterval(-1 * DateFormatterSpecs.yearLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "1 Year Ago"
                    }
                }
            }
            context("as 2 years before") {
                let timeOffset = TimeInterval(-2 * DateFormatterSpecs.yearLength)
                var date = Date().addingTimeInterval(timeOffset)
                beforeEach {
                    date = Date().addingTimeInterval(timeOffset)
                }
                context("with abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Yrs Ago"
                    }
                }
                context("without abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Years Ago"
                    }
                }
                context("with default abbreviation") {
                    it("returns correct timeoffset") {
                        expect(date.convertToTimeOffsetString()) == "2 Years Ago"
                    }
                }
            }
        }
    }
    
}

import Quick
import Nimble
@testable import AdvancedFoundation








