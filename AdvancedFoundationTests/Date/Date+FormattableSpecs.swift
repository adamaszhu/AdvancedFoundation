final class DateFormattableSpecs: QuickSpec {
    
    // Cannot extract date declaration since the test should be done right after the decleration.
    override func spec() {
        let secondLength = 1
        let minuteLength = 60 * secondLength
        let hourLength = 60 * minuteLength
        let dayLength = 24 * hourLength
        let yearLength = 365 * dayLength
        let monthLength = yearLength / 12
        var date: Date!
        describe("has date") {
            context("with the current date") {
                let date = Date()
                it("returns only the date") {
                    expect(date.date.string(with: DateFormat.utc).hasSuffix("00:00:00")) == true
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
                let timeOffsetSeconds = -365 * 24 * 60 * 60 * 13 / 12 - 24 * 60 * 60 - 60 * 60 - 60 - 1
                let timeOffset = TimeInterval(timeOffsetSeconds)
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
        describe("calls string(withPattern)") {
            beforeEach {
                date = Date()
            }
            context("with time 12 hour pattern") {
                it("returns xx:xxam/pm") {
                    let string = date.string(withPattern: Date.time12HourPattern)
                    expect(string.count) == 7
                }
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
            context("with year pattern") {
                it("returns XX") {
                    let string = date.string(withPattern: Date.yearPattern )
                    expect(string.count) == 2
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
        describe("calls string(with:)") {
            let date = Date(string: "01/01/2022", dateFormat: DateFormat.fullCalendarDate)
            context("as full calendar date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.fullCalendarDate)) == "01/01/2022"
                }
            }
            context("as short calendar date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.shortCalendarDate)) == "01/01/22"
                }
            }
            context("as reversed date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.reversedDate)) == "2022-01-01"
                }
            }
            context("as full date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.fullDate)) == "01 January 2022"
                }
            }
            context("as abbr date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.abbrDate)) == "01 Jan 2022"
                }
            }
            context("as expiry date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.expiryDate)) == "01/22"
                }
            }
            context("as formal date") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.formalDate)) == "Jan 01, 2022"
                }
            }
            context("as utc") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.utc)) == "2022-01-01T00:00:00"
                }
            }
            context("as long utc") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.longUTC)) == "2022-01-01T00:00:00.0"
                }
            }
            context("as zero utc") {
                it("returns the correct string") {
                    expect(date?.string(with: DateFormat.zeroUTC)) == "2022-01-01T00:00:00+1100"
                }
            }
        }
        describe("calls init(string:pattern)") {
            context("with invalid string") {
                let string = ""
                let pattern = Date.yearPattern
                it("returns nil") {
                    expect(Date(string: string, pattern: pattern)).to(beNil())
                }
            }
            context("with invalid pattern") {
                let string = "19"
                let pattern = ""
                it("returns nil") {
                    expect(Date(string: string, pattern: pattern)).to(beNil())
                }
            }
            context("with valid string and pattern") {
                let string = "19"
                let pattern = Date.yearPattern
                it("returns an date object") {
                    expect(Date(string: string, pattern: pattern)).toNot(beNil())
                }
            }
        }
        describe("calls init(string:format:)") {
            context("as full calendar date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "01/01/2022", dateFormat: DateFormat.fullCalendarDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.fullCalendarDate)).to(beNil())
                    }
                }
            }
            context("as short calendar date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "01/01/22", dateFormat: DateFormat.shortCalendarDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.shortCalendarDate)).to(beNil())
                    }
                }
            }
            context("as reversed date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "2022-01-01", dateFormat: DateFormat.reversedDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.reversedDate)).to(beNil())
                    }
                }
            }
            context("as full date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "01 January 2022", dateFormat: DateFormat.fullDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.fullDate)).to(beNil())
                    }
                }
            }
            context("as abbr date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "01 Jan 2022", dateFormat: DateFormat.abbrDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.abbrDate)).to(beNil())
                    }
                }
            }
            context("as expiry date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "01/22", dateFormat: DateFormat.expiryDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.expiryDate)).to(beNil())
                    }
                }
            }
            context("as formal date") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "Jan 01, 2022", dateFormat: DateFormat.formalDate)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.formalDate)).to(beNil())
                    }
                }
            }
            context("as utc") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "2022-01-01T00:00:00", dateFormat: DateFormat.utc)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.utc)).to(beNil())
                    }
                }
            }
            context("as long utc") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "2022-01-01T00:00:00.00000", dateFormat: DateFormat.longUTC)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.longUTC)).to(beNil())
                    }
                }
            }
            context("as zero utc") {
                context("with a valid string") {
                    it("parses the date") {
                        expect(Date(string: "2022-01-01T00:00:00+1100", dateFormat: DateFormat.zeroUTC)).toNot(beNil())
                    }
                }
                context("with an invalid string") {
                    it("returns nil") {
                        expect(Date(string: "", dateFormat: DateFormat.zeroUTC)).to(beNil())
                    }
                }
            }
        }
    }
}

import Foundation
import Quick
import Nimble
@testable import AdvancedFoundation
