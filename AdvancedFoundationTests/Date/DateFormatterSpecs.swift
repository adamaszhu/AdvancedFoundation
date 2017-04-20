class DateFormatterSpecs: QuickSpec {
    
    override func spec() {
        describe("calls convertToTimeOffsetString(withAbbreviation)") {
            context("as now") {
                let date = Date()
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
                let date = Date().addingTimeInterval(1)
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
                let timeOffset = -365 * 24 * 60 * 60 * 13 / 12 - 24 * 60 * 60 - 60 * 60 - 60 - 1
                let date = Date().addingTimeInterval(TimeInterval(timeOffset))
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
                let date = Date().addingTimeInterval(-365 * 24 * 60 * 60 - 1)
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
                let date = Date().addingTimeInterval(-1)
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
                let date = Date().addingTimeInterval(-2)
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
                let date = Date().addingTimeInterval(-60)
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
                let date = Date().addingTimeInterval(-120)
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
                let date = Date().addingTimeInterval(-3600)
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
                let date = Date().addingTimeInterval(-7200)
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
                let date = Date().addingTimeInterval(-24 * 3600)
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
                let date = Date().addingTimeInterval(-48 * 3600)
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
                let date = Date().addingTimeInterval(-365 * 24 * 3600 / 12)
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
                let date = Date().addingTimeInterval(-365 * 24 * 3600 / 6)
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
                let date = Date().addingTimeInterval(-365 * 24 * 3600)
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
                let date = Date().addingTimeInterval(-2 * 365 * 24 * 3600)
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








