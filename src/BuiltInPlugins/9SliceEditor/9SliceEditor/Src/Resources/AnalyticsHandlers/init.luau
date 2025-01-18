local l_game_FastInt_0 = game:GetFastInt("9SliceEditorAnalyticsReportingHundrethsPercent");
return function(v1) --[[ Line: 4 ]]
    -- upvalues: l_game_FastInt_0 (copy)
    local v2 = Random.new();
    local function _() --[[ Line: 7 ]] --[[ Name: shouldReport ]]
        -- upvalues: v2 (copy), l_game_FastInt_0 (ref)
        return v2:NextNumber() < l_game_FastInt_0 / 10000;
    end;
    local function _(v4) --[[ Line: 11 ]] --[[ Name: report1Count ]]
        -- upvalues: v2 (copy), l_game_FastInt_0 (ref), v1 (copy)
        if v2:NextNumber() < l_game_FastInt_0 / 10000 then
            v1:ReportCounter(v4, 1);
        end;
    end;
    local function _(v6, v7) --[[ Line: 17 ]] --[[ Name: reportStat ]]
        -- upvalues: v2 (copy), l_game_FastInt_0 (ref), v1 (copy)
        if v2:NextNumber() < l_game_FastInt_0 / 10000 then
            v1:ReportStats(v6, v7);
        end;
    end;
    return {
        sliceEditorOpened = function() --[[ Line: 24 ]] --[[ Name: sliceEditorOpened ]]
            -- upvalues: v2 (copy), l_game_FastInt_0 (ref), v1 (copy)
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportCounter("Studio9SliceEditorOpened", 1);
            end;
        end, 
        sliceEditorImageLoadedIntoEditor = function() --[[ Line: 28 ]] --[[ Name: sliceEditorImageLoadedIntoEditor ]]
            -- upvalues: v2 (copy), l_game_FastInt_0 (ref), v1 (copy)
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportCounter("Studio9SliceEditorImageLoadedIntoEditor", 1);
            end;
        end, 
        sliceEditorOpenTime = function(_, v10) --[[ Line: 32 ]] --[[ Name: sliceEditorOpenTime ]]
            -- upvalues: v2 (copy), l_game_FastInt_0 (ref), v1 (copy)
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportStats("Studio9SliceEditorOpenTime", v10);
            end;
        end
    };
end;