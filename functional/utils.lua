
utils = utils or {}

function utils.GetWeek( tm )
	local temp = os.date("*t", tm)
	local week = temp.wday - 1
	return week
end

-- 获取到当日凌晨的剩余时间 返回秒数
function utils.GetReaminSecondsTo24()
	local toYear = os.date("*t").year
    local toMonth = os.date("*t").month
    local toDay = os.date("*t").day
    local toTime = os.time({year =toYear, month = toMonth, day =toDay, hour =23, min =59, sec = 59})
    local time = os.time()
    return toTime - time
end

function utils.Second2DHMS( second )
	if second <= 0 then
        return 0,0,0,0
    end
    local d = math.floor(second / 86400)
    second = second - d * 86400

    local h = math.floor(second / 3600)
    second = second - h * 3600

    local m = math.floor(second / 60)
    second = second - m * 60

    local s = second

    return d, h, m, s
end

function utils.FormatWeekDay( tm )
    local weekDay = utils.GetWeek(tm)
    local ret = "星期{1}"
    local weekData = ""
    if weekDay == 1 then
        weekData = "一"
    elseif weekDay == 2 then
        weekData = "二"
    elseif weekDay == 3 then
        weekData = "三"
    elseif weekDay == 4 then
        weekData = "四"
    elseif weekDay == 5 then
        weekData = "五"
    elseif weekDay == 6 then
        weekData = "六"
    elseif weekDay == 7 then
        weekData = "七"
    end
    return utils.FormatText(ret, weekData)
end

function utils.FormatTime( _ls )
	local _d, _h, _m, _s = utils.Second2DHMS(_ls)
    local timeData = ""
    if _h < 10 then
        _h = "0".._h
    end
    if _m < 10 then
        _m = "0".._m
    end
    if _s < 10 then
        _s = "0".._s
    end
    if _d > 0 then
        timeData = _d.."天".._h..":".._m..":".._s
    else
        timeData = _h..":".._m..":".._s
    end
    return timeData
end

function utils.FormatText(s, ...)
    local ret = s
    local args = { ... }
    local len = table.nums(args)
    while(len > 0) do
        ret = string.gsub(ret, "{"..len.."}", tostring(args[len]))
        len = len - 1
    end
    return ret
end

