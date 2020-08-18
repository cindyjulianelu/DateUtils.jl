# DateUtils.jl

# Overview
This package contains several utilities for working with dates.

## Adding ManelaLabRegistry
The private registry can be added in the REPL, restricted to users with access
to the ManelaLab GitLab account and with a SSH key (if there's no SSH key set
up, generate an RSA key first).
```@repl
] registry add git@gitlab.com:ManelaLab/ManelaLabRegistry.git
using ManelaLabRegistry
```
## Loading DateUtils
DateUtils.jl is a private repository.
```@repl
] add git@gitlab.com:ManelaLab/DateUtils.jl.git
using DateUtils
```
# Functions 
Documentation for DateUtils.jl functions. 

```@docs
yyyymmdd2yyyy(d)
```
```@docs
yyyymmdd2yyyymm(d)
```
```@docs
yyyymmdd2date(yyyymm::Number)
```
```@docs
yyyymm2date(yyyymm::Number)
```
```@docs
dduuuyyyy2date(dduuuyyyy)
```
```@docs
uuuddyyyy2date(uuuddyyyy)
```
```@docs
datetimestring2datetime(str,datetimeformat)
```
```@docs
date2yyyymmdd(date)
```
```@docs
date2yyyymm(date)
```
```@docs
date2yyyy(date)
```
```@docs
datetimestring2yyyymmdd(str,datetimeformat)
```
```@docs
date2yyyyqq(d)
```
```@docs
date2yyyyww(d)
```
```@docs
yearqtr2date(s, dlm="-Q")
```
```@docs
yearmonth2date(s, dlm="-")
```
