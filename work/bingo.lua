--[[
通关100000次平均消耗多少个球（也就是play多少次）

]]

function BingoModel:bingo_start()
    local chassisArray = {}
    local judgeArray   = {}
    local storageArray = {}
    local totalCount   = 0
    local playCount    = 0
    local useCount     = 0

    --5
    local function judgeRow(array, x)
        local array = array
        local i = x
        for k=1,5 do
            if array[i][k] ~= 0 then
                return
            end
        end
        return true
    end
    local function judgeColumn(array,y)
        local array = array
        local j = y
        for k=1,5 do
            if array[k][j] ~= 0 then
                return 
            end
        end
        return true
    end
    local function judgeLeftTopToRightLow(array)
        local array = array
        for k=1,5 do
            if array[k][k] ~= 0 then
                return
            end
        end
        return true
    end
    local function judgeLeftLowToRightTop(array)
        local array = array
        local j = 5
        for i=1,5 do
            if array[i][j] ~= 0 then
                return
            end
            j = j-1
        end
        return true
    end
    local function judgeSpecial(array)
        if array[1][1] == 0 and array[5][5] == 0 and array[3][3] == 0 and array[1][5] == 0 and array[5][1] == 0 then
            return true
        end
    end

    --common
    local function judgeCommon_9_1(array)
        if array[2][2] == 0 and array[4][4] == 0 and array[2][4] == 0 and array[4][2] == 0 then
            return true
        end
    end

    local function judgeCommon_9_2(array)
        if array[2][3] == 0 and array[4][3] == 0 and array[3][2] == 0 and array[3][4] == 0 then
            return true
        end 
    end

    local function judgeCommon_10(array)
        if array[2][2] == 0 and array[2][3] == 0 and array[2][4] == 0 and 
           array[4][2] == 0 and array[4][3] == 0 and array[4][4] == 0 and 
           array[3][2] == 0 and array[3][4] == 0 then
            return true
        end 
    end

    local function judgeCommon_13(array)
        if array[1][2] == 0 and array[1][3] == 0 and array[1][4] == 0 and 
           array[5][2] == 0 and array[5][3] == 0 and array[5][4] == 0 and 
           array[2][1] == 0 and array[3][1] == 0 and array[4][1] == 0 and 
           array[2][5] == 0 and array[3][5] == 0 then
            return true
        end 
    end

    local function judgeCommonRow_A_B(array, row, a, b)
        local array = array
        local i = row
        for k=a,b do
            if array[i][k] ~= 0 then
                return
            end
        end
        return true
    end

    local function judgeCommonColumn_A_B(array, column, a, b)
        local temp = array
        local j = column
        for k=a,b do
            if temp[k][j] ~= 0 then
                return
            end
        end
        return true
    end

    --9
    local function judgeSpecial9_1(array)
        if judgeCommon_9_1(array) and array[1][1] == 0 and array[5][5] == 0 and array[1][5] == 0 and array[5][1] == 0 then
            return true
        end
    end
    local function judgeSpecial9_2(array)
        if judgeRow(array, 3) and array[1][3] == 0 and array[2][3] == 0 and array[4][3] == 0 and array[5][3] == 0 then
            return true
        end
    end
    local function judgeSpecial9_3(array)
        if judgeCommon_9_1(array) and array[2][1] == 0 and array[4][1] == 0 and array[2][5] == 0 and array[4][5] == 0 then
            return true
        end
    end
    local function judgeSpecial9_4(array)
        if judgeCommon_9_1(array) and array[1][2] == 0 and array[1][4] == 0 and array[5][2] == 0 and array[5][4] == 0 then
            return true
        end
    end
    local function judgeSpecial9_5(array)
        if judgeCommon_9_2(array) and array[1][2] == 0 and array[2][1] == 0 and array[4][5] == 0 and array[5][4] == 0 then
            return true
        end
    end
    local function judgeSpecial9_6(array)
        if judgeCommon_9_2(array) and array[1][4] == 0 and array[2][5] == 0 and array[4][1] == 0 and array[5][2] == 0 then
            return true
        end
    end
    local function judgeSpecial9_7(array)
        if judgeCommon_9_1(array) and array[3][1] == 0 and array[3][5] == 0 and array[1][3] == 0 and array[5][3] == 0 then
            return true
        end
    end
    local function judgeSpecial9_8(array)
        if judgeColumn(array, 3) and array[3][1] == 0 and array[3][5] == 0 and array[4][2] == 0 and array[4][4] == 0 then
            return true
        end
    end
    local function judgeSpecial9_9(array)
        if judgeRow(array, 3) and array[2][2] == 0 and array[4][2] == 0 and array[1][3] == 0 and array[5][3] == 0 then
            return true
        end
    end
    local function judgeSpecial9_10(array)
        if judgeRow(array, 3) and array[2][4] == 0 and array[4][4] == 0 and array[1][3] == 0 and array[5][3] == 0 then
            return true
        end
    end
    local function judgeSpecial9_11(array)
        if judgeColumn(array, 3) and array[3][1] == 0 and array[3][5] == 0 and array[2][2] == 0 and array[2][4] == 0 then
            return true
        end
    end

    -- 10
    local function judgeSpecial10_1(array)
        if array[1][3] == 0 and array[2][2] == 0 and array[2][4] == 0 and array[3][1] == 0 and array[3][5] == 0 and 
           array[4][1] == 0 and array[4][3] == 0 and array[4][5] == 0 and array[5][2] == 0 and array[5][4] == 0 then
            return true
        end
    end
    local function judgeSpecial10_2(array)
        if judgeCommon_10(array) and array[1][1] == 0 and array[5][5] == 0 then
            return true
        end
    end
    local function judgeSpecial10_3(array)
        if judgeCommon_10(array) and array[1][5] == 0 and array[5][1] == 0 then
            return true
        end
    end
    local function judgeSpecial10_4(array)
        if judgeCommon_9_1(array) and array[1][1] == 0 and array[3][1] == 0 and array[1][5] == 0 and array[3][5] == 0 and array[5][3] == 0 then
            return true
        end
    end

    -- 13
    local function judgeSpecial13_1(array)
        if judgeRow(array, 1) and judgeCommonColumn_A_B(array, 5, 2, 5) and 
            array[5][1] == 0 and array[4][2] == 0 and array[4][4] == 0 then
            return true
        end
    end
    local function judgeSpecial13_2(array)
        if judgeRow(array, 5) and judgeCommonColumn_A_B(array, 1, 1, 4) and 
            array[1][5] == 0 and array[2][4] == 0 and array[4][2] == 0 then
            return true
        end
    end
    local function judgeSpecial13_3(array)
        if judgeRow(array, 5) and judgeCommonColumn_A_B(array, 5, 1, 4) and 
            array[1][1] == 0 and array[2][2] == 0 and array[4][4] == 0 then
            return true
        end
    end
    local function judgeSpecial13_4(array)
        if judgeRow(array, 1) and judgeCommonColumn_A_B(array, 1, 2, 5) and 
            array[5][5] == 0 and array[2][2] == 0 and array[4][4] == 0 then
            return true
        end
    end
    local function judgeSpecial13_5(array)
        if judgeColumn(array, 2) and array[1][3] == 0 and array[1][4] == 0 and array[2][5] == 0 and
            array[3][4] == 0 and array[4][5] == 0 and array[5][3] == 0 and array[5][4] == 0 then
            return true
        end
    end
    local function judgeSpecial13_6(array)
        if judgeRow(array, 1) and judgeRow(array, 5) and array[2][3] == 0 and array[4][3] == 0 then
            return true
        end
    end
    local function judgeSpecial13_7(array)
        if judgeColumn(array, 1) and judgeColumn(array, 5) and array[2][4] == 0 and array[4][2] == 0 then
            return true
        end
    end
    local function judgeSpecial13_8(array)
        if judgeCommon_13(array) and array[3][4] == 0 then
            return true
        end
    end
    local function judgeSpecial13_9(array)
        if judgeCommon_13(array) and array[4][5] == 0 then
            return true
        end
    end

    local function judgeResultBy5(array, x, y) --5-5
        local situation1 = judgeRow(array, x)
        local situation2 = judgeColumn(array, y)
        local situation3 = judgeLeftTopToRightLow(array)
        local situation4 = judgeLeftLowToRightTop(array)
        local situation5 = judgeSpecial(array)
        if situation1 or situation2 or situation3 or situation4 or situation5 then
            return true
        end
    end
    local function judgeResultBy9(array) --9-11
        local s1 = judgeSpecial9_1(array)
        local s2 = judgeSpecial9_2(array)
        local s3 = judgeSpecial9_3(array)
        local s4 = judgeSpecial9_4(array)
        local s5 = judgeSpecial9_5(array)
        local s6 = judgeSpecial9_6(array)
        local s7 = judgeSpecial9_7(array)
        local s8 = judgeSpecial9_8(array)
        local s9 = judgeSpecial9_9(array)
        local s10 = judgeSpecial9_10(array)
        local s11 = judgeSpecial9_11(array)
        if s1 or s2 or s3 or s4 or s5 or s6 or s7 or s8 or s9 or s10 or s11 then
            return true
        end
    end
    local function judgeResultBy10(array) --10-4
        local s1 = judgeSpecial10_1(array)
        local s2 = judgeSpecial10_2(array)
        local s3 = judgeSpecial10_3(array)
        local s4 = judgeSpecial10_4(array)
        if s1 or s2 or s3 or s4 then
            return true
        end
    end
    local function judgeResultBy13(array) --13-9
        local s1 = judgeSpecial13_1(array)
        local s2 = judgeSpecial13_2(array)
        local s3 = judgeSpecial13_3(array)
        local s4 = judgeSpecial13_4(array)
        local s5 = judgeSpecial13_5(array)
        local s6 = judgeSpecial13_6(array)
        local s7 = judgeSpecial13_7(array)
        local s8 = judgeSpecial13_8(array)
        local s9 = judgeSpecial13_9(array)
        if s1 or s2 or s3 or s4 or s5 or s6 or s7 or s8 or s9 then
            return true
        end
    end
    -- 中bingo入口
    local function modifyChassis(ballNum)
        for i=1,5 do
            for j=1,5 do
                if judgeArray[i][j] == ballNum then
                    judgeArray[i][j] = 0
                    local index = 5 * (i - 1) + j
                    return judgeResultBy5(judgeArray, i, j), index
                    -- return judgeResultBy9(judgeArray), index
                    -- return judgeResultBy10(judgeArray), index
                    -- return judgeResultBy13(judgeArray), index
                end
            end
        end
    end
    -- 获得一个球
    local function getBall()
        local ballNum      = nil
        playCount          = playCount + 1
        useCount           = useCount + 1
        local ballNumArray = storageArray
        local num          = #ballNumArray
        local state        = true
        while (#ballNumArray < num + 1) do
            ballNum = math.random(75)
            for i,v in ipairs(ballNumArray) do
                if v == ballNum or ballNum == chassisArray[13] then
                    state = false
                end
            end
            if state then
                table.insert(storageArray, ballNum)
            end
            state = true
        end
        local isBingo, index = modifyChassis(ballNum)
        return ballNum, num, isBingo, index
    end
    -- 生成棋盘
    local function produceNum()
        local numArray = {}
        local state    = true
        while(#numArray < 25) do
            local mul = math.fmod(#numArray, 5)
            local num = math.random(15 * mul + 1, 15 * (mul + 1))
            for i,v in ipairs(numArray) do
                if v == num then
                    state = false
                    break
                end
            end
            if state then
                table.insert(numArray, num)
            end
            state = true
        end
        chassisArray = numArray
        local array = {}
        for i=1,5 do
            array[i] = {}
            for j=1,5 do
                local num = 5 * (i - 1) + j
                array[i][j] = numArray[num]
            end
        end
        judgeArray = array
    end
    local function reset()
        produceNum()
    end
    local function checkJudgeArray()
        local flag = nil
        for i=1,5 do
            for j=1,5 do
                if judgeArray[i][j] ~= 0 then
                    return flag
                end
            end
        end
        return flag
    end
    local function checkCensorshipData()
        storageArray = {}
        if not checkJudgeArray() then
            reset()
        end
    end
    local function main()
        local ballNum, num, isBingo, index = getBall()
        if index and isBingo then
            totalCount = totalCount + 1
            print(string.format("playCount=%d, totalCount=%d, useCount=%d", playCount, totalCount, useCount))
            checkCensorshipData()
            useCount = 0
        end
    end
    print("bingo start")
    reset()
    while(totalCount < 100000) do
        main()
    end
    print("bingo end")
    print(string.format("playCount=%d, totalCount=%d, avg=%f", playCount, totalCount, playCount / totalCount))
end


