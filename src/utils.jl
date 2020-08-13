yyyymmdd2yyyy(d) = div(d,10000)
yyyymmdd2yyyymm(d) = div(d,100)

function yyyymmdd2date(yyyymmdd::Number)
    yyyy=div(yyyymmdd,10000)
    mm=div(mod(yyyymmdd,10000),100)
    dd=mod(yyyymmdd,100)
    Date(yyyy,mm,dd)
end

function yyyymm2date(yyyymm::Number)
    yyyy=div(yyyymm,100)
    mm=mod(yyyymm,100)
    Dates.lastdayofmonth(Date(yyyy,mm,1))
end

const dduuuyyyydateformat = Dates.DateFormat("dduuuyyyy")
function dduuuyyyy2date(dduuuyyyy)
    Date(dduuuyyyy,dduuuyyyydateformat)
end

const uuuddyyyydateformat = Dates.DateFormat("uuu dd, yyyy")
function uuuddyyyy2date(uuuddyyyy)
    Date(uuuddyyyy,uuuddyyyydateformat)
end

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

function date2yyyymmdd(date)
    try
        Dates.year(date)*10000+Dates.month(date)*100+Dates.day(date)
    catch
        missing
    end
end

function date2yyyymm(date)
    try
        Dates.year(date)*100+Dates.month(date)
    catch
        missing
    end
end

function date2yyyy(date)
    try
        Dates.year(date)
    catch
        missing
    end
end

function datetimestring2yyyymmdd(str,datetimeformat)
    d = datetimestring2datetime(str,datetimeformat)
    if ismissing(d)
        missing
    else
        date2yyyymmdd(d)
    end
end

function date2yyyyqq(d)
  try
    date2yyyy(d)*100 + Dates.quarterofyear(d)
  catch
    missing
  end
end

function date2yyyyww(d)
  try
    date2yyyy(d)*100 + Dates.week(d)
  catch
    missing
  end
end

"""
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
convert something like 2018-11 into year month
`dlm` defines the string delimiter characters passed to split()
"""
function yearmonth2date(s, dlm="-")
  sp = split(s, dlm)
  y = parse(Int,sp[1])
  m = parse(Int,sp[2])
  Dates.lastdayofmonth(Date(y,m,1))
end
