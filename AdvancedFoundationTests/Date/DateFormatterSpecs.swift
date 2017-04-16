class DateFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("Date") {
            describe("is converted to time offset string") {
                describe("as now") {
                    let date = Date()
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "Now"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "Now"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "Now"
                    }
                }
                describe("as later") {
                    let date = Date().addingTimeInterval(1)
                    
                    it("with abbreviation") {
                        print("here\n")
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Sec Later"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Second Later"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Second Later"
                    }
                }
                describe("as 1 year 1 month 1 day 1 hour 1 minute and 1 second before") {
                    let timeOffset = -365 * 24 * 60 * 60 * 13 / 12 - 24 * 60 * 60 - 60 * 60 - 60 - 1
                    let date = Date().addingTimeInterval(TimeInterval(timeOffset))
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr 1 Mon 1 Day 1 Hr 1 Min 1 Sec Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Year 1 Month 1 Day 1 Hour 1 Minute 1 Second Ago"
                    }
                }
                describe("as 1 year and 1 second before") {
                    let date = Date().addingTimeInterval(-365 * 24 * 60 * 60 - 1)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr 1 Sec Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year 1 Second Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Year 1 Second Ago"
                    }
                }
                describe("as 1 second before") {
                    let date = Date().addingTimeInterval(-1)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Sec Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Second Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Second Ago"
                    }
                }
                describe("as 2 seconds before") {
                    let date = Date().addingTimeInterval(-2)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Secs Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Seconds Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "2 Seconds Ago"
                    }
                }
                describe("as 1 minute before") {
                    let date = Date().addingTimeInterval(-60)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Min Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Minute Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Minute Ago"
                    }
                }
                describe("as 2 minutes before") {
                    let date = Date().addingTimeInterval(-120)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Mins Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Minutes Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "2 Minutes Ago"
                    }
                }
                describe("as 1 hour before") {
                    let date = Date().addingTimeInterval(-3600)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Hr Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Hour Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Hour Ago"
                    }
                }
                describe("as 2 hours before") {
                    let date = Date().addingTimeInterval(-7200)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Hrs Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Hours Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "2 Hours Ago"
                    }
                }
                describe("as 1 day before") {
                    let date = Date().addingTimeInterval(-24 * 3600)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Day Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Day Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Day Ago"
                    }
                }
                describe("as 2 days before") {
                    let date = Date().addingTimeInterval(-48 * 3600)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Days Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Days Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "2 Days Ago"
                    }
                }
                describe("as 1 month before") {
                    let date = Date().addingTimeInterval(-365 * 24 * 3600 / 12)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Mon Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Month Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Month Ago"
                    }
                }
                describe("as 2 months before") {
                    let date = Date().addingTimeInterval(-365 * 24 * 3600 / 6)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Mons Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Months Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "2 Months Ago"
                    }
                }
                describe("as 1 year before") {
                    let date = Date().addingTimeInterval(-365 * 24 * 3600)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "1 Yr Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "1 Year Ago"
                    }
                    it("with default abbreviation") {
                        expect(date.convertToTimeOffsetString()) == "1 Year Ago"
                    }
                }
                describe("as 2 years before") {
                    let date = Date().addingTimeInterval(-2 * 365 * 24 * 3600)
                    
                    it("with abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: true)) == "2 Yrs Ago"
                    }
                    it("without abbreviation") {
                        expect(date.convertToTimeOffsetString(withAbbreviation: false)) == "2 Years Ago"
                    }
                    it("with default abbreviation") {
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








