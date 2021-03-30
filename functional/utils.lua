
utils = utils or {}

-- 获取星期
-- @param tm number
-- @return number
function utils.GetWeek( tm )
	local temp = os.date("*t", tm)
	local week = temp.wday - 1
	return week
end

-- 获取到当日凌晨的剩余时间 返回秒数
-- @return number
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
    local day = math.floor(second / 86400)
    second = second - day * 86400
    local hour = math.floor(second / 3600)
    second = second - hour * 3600
    local min = math.floor(second / 60)
    second = second - min * 60
    local sec = second
    return day, hour, min, sec
end

function utils.Second2HMS( second )
    if second <= 0 then
        return 0,0,0
    end
    local hour = math.floor(second / 3600)
    local min = math.floor(second % 3600 / 60)
    local sec = second % 60
    return hour, min, sec
end

function utils.Second2HM( second )
    if second <= 0 then
        return 0,0
    end
    local hour = math.floor(second / 3600)
    local min = math.floor(second % 3600 / 60)
    return hour, min
end

function utils.Second2MS( second )
    if second <= 0 then
        return 0,0
    end
    local min = math.floor(second / 60)
    local sec = second % 60
    return min, sec
end

-- 格式化时间：x小时:x分钟:x秒
-- @param second number
-- @return string
function utils.FormatTimeHMS( second )
    local hour, min, sec = utils.Second2HMS(second)
    return string.format("%02d:%02d:%02d", hour, min, sec)
end

-- 格式化时间：x小时:x分钟
-- @param second number
-- @return string
function utils.FormatTimeHM( second )
    local hour, min = utils.Second2HM(second)
    return string.format("%02d:%02d", hour, min)
end

-- 格式化时间：x分钟:x秒
-- @param second number
-- @return string
function utils.FormatTimeMS( second )
    local min, sec = utils.Second2MS(second)
    return string.format("%02d:%02d", min, sec)
end

-- 格式化时间：x天x小时:x分钟:x秒
-- @param second number
-- @return string
function utils.FormatTime( second )
    local day, hour, min, sec = utils.Second2DHMS(second)
    if day > 0 then
        return string.format("%d天%d:%d:%d", day, hour, min, sec)
    end
    if hour > 0 then
        return string.format("%d:%d:%d", hour, min, sec)
    end
    if min > 0 then
        return string.format("%d:%d", min, sec)
    end
    return tonumber(sec)
end

-- 格式化星期：星期x
-- @param tm number
-- @return string
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

-- 格式化文本
-- @param s string
-- @return string
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

