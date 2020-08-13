@test yyyymmdd2yyyy(19240401) == 1924
@test yyyymmdd2yyyy(20240401) == 2024

@test yyyymmdd2yyyymm(19240401) == 192404
@test yyyymmdd2yyyymm(20240401) == 202404

@test yyyymmdd2date(19240401) == Date(1924,4,1)
@test yyyymmdd2date(20240401) == Date(2024,4,1)

@test dduuuyyyy2date("01Apr1924") == Date(1924,4,1)
@test dduuuyyyy2date("01Apr2024") == Date(2024,4,1)

@test uuuddyyyy2date("Apr 1, 1924") == Date(1924,4,1)
@test uuuddyyyy2date("Apr 1, 2024") == Date(2024,4,1)

@test datetimestring2datetime("Apr 1, 1924", dateformat"uuu dd, yyyy") == Date(1924,4,1)
@test datetimestring2datetime("Apr 1, 2024", dateformat"uuu dd, yyyy") == Date(2024,4,1)
@test datetimestring2datetime("Apr 1, 24", dateformat"uuu dd, yyyy") == Date(2024,4,1)
@test datetimestring2datetime("Apr 1, 71", dateformat"uuu dd, yyyy") == Date(1971,4,1)
@test ismissing(datetimestring2datetime("Bla 1, 71", dateformat"uuu dd, yyyy"))

@test date2yyyymmdd(Date(1924,4,1)) == 19240401
@test date2yyyymmdd(Date(2024,4,1)) == 20240401

@test date2yyyymm(Date(1924,4,1)) == 192404
@test date2yyyymm(Date(2024,4,1)) == 202404

@test date2yyyy(Date(1924,4,1)) == 1924
@test date2yyyy(Date(2024,4,1)) == 2024

@test datetimestring2yyyymmdd("Apr 1, 1924", dateformat"uuu dd, yyyy") == 19240401
@test datetimestring2yyyymmdd("Apr 1, 2024", dateformat"uuu dd, yyyy") == 20240401
@test datetimestring2yyyymmdd("Apr 1, 24", dateformat"uuu dd, yyyy") == 20240401
@test datetimestring2yyyymmdd("Apr 1, 71", dateformat"uuu dd, yyyy") == 19710401
@test ismissing(datetimestring2yyyymmdd("Bla 1, 71", dateformat"uuu dd, yyyy"))

@test date2yyyyqq(Date(1924,4,1)) == 192402
@test date2yyyyqq(Date(1924,3,31)) == 192401
@test date2yyyyqq(Date(1924,9,30)) == 192403
@test date2yyyyqq(Date(1924,10,01)) == 192404
@test date2yyyyqq(Date(1924,12,31)) == 192404
@test date2yyyyqq(Date(2024,4,1)) == 202402

@test yearqtr2date("1924-Q1") == Date(1924,3,31)
@test yearqtr2date("1924-Q2") == Date(1924,6,30)
@test yearqtr2date("1924-Q3") == Date(1924,9,30)
@test yearqtr2date("1924-Q4") == Date(1924,12,31)
