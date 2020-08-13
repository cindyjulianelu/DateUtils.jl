"""
    yyyymmdd2yyyy(d)

Takes an Int64-formatted date and returns the year in Int64 format.
```@example
dt = 20100811
@show yyyymmdd2yyyy(dt)
```
"""
yyyymmdd2yyyy(d) = div(d,10000)

"""
    yyyymmdd2yyyymm(d)

Takes an Int64-formatted date and returns the year and month in Int64 format.
```@example
dt = 20110909
@show yyyymmdd2yyyymm(dt)
```
"""
yyyymmdd2yyyymm(d) = div(d,100)

"""
    yyyymmdd2date(yyyymmdd::Number)

Takes in an Int-64 formatted date and returns a Date object in y-m-d format.
```@example
dt = 19980430
@show yyyymmdd2date(dt)
```
"""
function yyyymmdd2date(yyyymmdd::Number)
    yyyy=div(yyyymmdd,10000)
    mm=div(mod(yyyymmdd,10000),100)
    dd=mod(yyyymmdd,100)
    Date(yyyy,mm,dd)
end

"""
    yyyymm2date(yyyymm::Number)

Takes in a Int64-formatted year and date and returns a Date object,
with the last day of the month attached.

# Example
```@example
dt = 199804
@show yyyymm2date(dt)
```
"""
function yyyymm2date(yyyymm::Number)
    yyyy=div(yyyymm,100)
    mm=mod(yyyymm,100)
    Dates.lastdayofmonth(Date(yyyy,mm,1))
end

const dduuuyyyydateformat = Dates.DateFormat("dduuuyyyy")
"""
    dduuuyyyy2date(dduuuyyyy)

Takes in a string of the form "31Jan1997" and returns a Date
object in the format y-m-d.
```@example
d = "31Jan1997"
@show dduuuyyyy2date(d)
```
"""
function dduuuyyyy2date(dduuuyyyy)
    Date(dduuuyyyy,dduuuyyyydateformat)
end

const uuuddyyyydateformat = Dates.DateFormat("uuu dd, yyyy")
"""
    uuuddyyyy2date(uuuddyyyy)

Takes in a string of the form "Month Day, Year" and returns a Date in the
format y-m-d
```@example
u = "Jan 31, 1891"
@show uuuddyyyy2date(u)
```
"""
function uuuddyyyy2date(uuuddyyyy)
    Date(uuuddyyyy,uuuddyyyydateformat)
end

"""
    datetimestring2datetime(str,datetimeformat)

Takes in a string of the form "" and converts it to the user-specified
DateTime format.
```@example
using Dates #hide
str = "1989-07-07"
dt_fmt = DateFormat("y-m-d")
@show datetimestring2datetime(str, dt_fmt)
```
"""
function datetimestring2datetime(str,datetimeformat)
  try
    dt=DateTime(str,datetimeformat)
    y=Dates.year(dt)
    if 70<=y<=99
      y+=1900
    elseif 0<=y<70
      y+=2000
    end
    dt=Dates.DateTime(y,Dates.month(dt),Dates.day(dt),Dates.hour(dt),Dates.minute(dt),Dates.second(dt))
  catch
    missing
  end
end

"""
    date2yyyymmdd(date)

Takes in a Date object and converts it back to Int64.
```@example
using Dates #hide
dt = Date(2014,1,29)
@show date2yyyymmdd(dt)
```
"""
function date2yyyymmdd(date)
    try
        Dates.year(date)*10000+Dates.month(date)*100+Dates.day(date)
    catch
        missing
    end
end

"""
    date2yyyymm(date)

Takes in a Date object and transforms it back to Int64.
```@example
using Dates #hide
dt = Date(2010,8,11)
@show date2yyyymm(dt)
```
"""
function date2yyyymm(date)
    try
        Dates.year(date)*100+Dates.month(date)
    catch
        missing
    end
end

"""
    date2yyyy(date)

Takes in a Date object and returns the year as an Int64 type.
```@example
using Dates #hide
dt = Date(2011,7,24)
@show date2yyyy(dt)
```
"""
function date2yyyy(date)
    try
        Dates.year(date)
    catch
        missing
    end
end

"""
    datetimestring2yyyymmdd(str,datetimeformat)

Takes in a string and a DateTime format, converts the date back into Int64 type.
```@example
using Dates #hide
str = "1999-07-24"
dt_fmt = DateFormat("y-m-d")
@show datetimestring2yyyymmdd(str,dt_fmt)
```
"""
function datetimestring2yyyymmdd(str,datetimeformat)
    d = datetimestring2datetime(str,datetimeformat)
    if ismissing(d)
        missing
    else
        date2yyyymmdd(d)
    end
end

"""
    date2yyyyqq(d)

Takes in a Date object, formatted as y-m-d, and returns the year and quarter in Int64 type.
```@example
using Dates #hide
dt = Date(2009,6,22)
@show date2yyyyqq(dt)
```
"""
function date2yyyyqq(d)
  try
    date2yyyy(d)*100 + Dates.quarterofyear(d)
  catch
    missing
  end
end

"""
    date2yyyyww(d)

Takes in a Date object, formatted as y-m-d, and returns the year and
week in Int64 format.
```@example
using Dates #hide
dt = Date(2011,9,8)
@show dt
@show date2yyyyww(dt)
```
"""
function date2yyyyww(d)
  try
    date2yyyy(d)*100 + Dates.week(d)
  catch
    missing
  end
end

"""
    yearqtr2date(s, dlm="-Q")

convert something like 2018-Q3 into end of quarter date
`dlm` defines the string delimiter characters passed to split()
"""
function yearqtr2date(s, dlm="-Q")
  sp = split(s, dlm)
  y = parse(Int,sp[1])
  q = parse(Int,sp[2])
  Dates.lastdayofquarter(Date(y) + Dates.Month(3*(q-1)))
end

"""
    yearmonth2date(s, dlm="-")

convert something like 2018-11 into year month
`dlm` defines the string delimiter characters passed to split()
"""
function yearmonth2date(s, dlm="-")
  sp = split(s, dlm)
  y = parse(Int,sp[1])
  m = parse(Int,sp[2])
  Dates.lastdayofmonth(Date(y,m,1))
end
