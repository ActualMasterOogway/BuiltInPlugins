local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local v2 = require(l_Parent_0.Src.Util.MockActivityHistoryEvents);
local v3 = require(l_Parent_0.Packages.Framework);
local l_Promise_0 = v3.Util.Promise;
local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
local v6 = #v2;
local function _(v7) --[[ Line: 14 ]] --[[ Name: cursorToIndex ]]
    if string.sub(v7, 1, 1) == "p" then
        return tonumber((string.sub(v7, 2))) or -100;
    else
        return tonumber(v7) or 0;
    end;
end;
local function v15(v9) --[[ Line: 21 ]] --[[ Name: paginatedMockActivityHistoryEventsFromCursor ]]
    -- upvalues: v3 (copy), v2 (copy), v6 (copy), l_UnixTimestampMillis_0 (copy)
    local v10 = if string.sub(v9, 1, 1) == "p" then tonumber((string.sub(v9, 2))) or -100 else tonumber(v9) or 0;
    local v11 = {};
    for v12 = 1, 100 do
        local v13 = v10 + v12;
        local v14 = v3.Util.deepCopy(v2[v13 % v6 + 1]);
        v14.createdUnixTimeMs = l_UnixTimestampMillis_0 - 10800000 * v13;
        table.insert(v11, v14);
    end;
    return v11, tostring(v10 + 100), "p" .. tostring(v10);
end;
local function _(v16) --[[ Line: 38 ]] --[[ Name: paginatedMockActivityHistoryEventsFromDate ]]
    -- upvalues: l_UnixTimestampMillis_0 (copy), v15 (copy)
    local v17 = math.floor((l_UnixTimestampMillis_0 - v16) / 10800000);
    return v15((tostring(v17)));
end;
return {
    DEPRECATED_activityFeedRTEEffect = function(_) --[[ Line: 56 ]] --[[ Name: DEPRECATED_activityFeedRTEEffect ]]
        return function() --[[ Line: 58 ]]

        end;
    end, 
    activityFeedRTEEffect = function() --[[ Line: 49 ]] --[[ Name: activityFeedRTEEffect ]]
        return function() --[[ Line: 51 ]]

        end;
    end, 
    fetchActivityHistory = function(_, _, v22, v23, _, v25) --[[ Line: 63 ]] --[[ Name: fetchActivityHistory ]]
        -- upvalues: v15 (copy), l_UnixTimestampMillis_0 (copy)
        local v26 = nil;
        local v27 = nil;
        local v28 = nil;
        if v22 then
            local v29, v30, v31 = v15(v22);
            v26 = v29;
            v27 = v30;
            v28 = v31;
        elseif v23 then
            local v32 = math.floor((l_UnixTimestampMillis_0 - v23) / 10800000);
            local v33, v34, v35 = v15((tostring(v32)));
            local l_v33_0 = v33;
            local l_v34_0 = v34;
            local l_v35_0 = v35;
            v26 = l_v33_0;
            v27 = l_v34_0;
            v28 = l_v35_0;
        else
            local v39, v40, v41 = v15("0");
            v26 = v39;
            v27 = v40;
            v28 = v41;
        end;
        local v42 = {
            responseCode = 200, 
            responseBody = {
                events = v26, 
                nextCursor = v27, 
                hasMore = nil
            }
        };
        spawn(function() --[[ Line: 92 ]]
            -- upvalues: v25 (copy), v42 (copy)
            v25(v42);
        end);
    end, 
    fetchUsernames = function(v43, v44) --[[ Line: 97 ]] --[[ Name: fetchUsernames ]]
        -- upvalues: l_Promise_0 (copy)
        local v45 = {};
        local v46 = 0;
        for _, v48 in pairs(v43) do
            v46 = v46 + 1;
            table.insert(v45, (l_Promise_0.new(function(v49, _) --[[ Line: 103 ]]
                -- upvalues: v48 (copy)
                local v51 = tostring(v48) .. "mockusername";
                v49(v48, v51);
            end)));
        end;
        local v52 = {};
        local v53 = 0;
        local function _() --[[ Line: 114 ]]
            -- upvalues: v53 (ref), v46 (ref), v44 (copy), v52 (copy)
            if v53 == v46 then
                v44(v52);
            end;
        end;
        for _, v56 in pairs(v45) do
            v56:andThen(function(v57, v58) --[[ Line: 121 ]]
                -- upvalues: v53 (ref), v52 (copy), v46 (ref), v44 (copy)
                v53 = v53 + 1;
                v52[v57] = v58;
                if v53 == v46 then
                    v44(v52);
                end;
            end):catch(function(_) --[[ Line: 126 ]]
                -- upvalues: v53 (ref), v46 (ref), v44 (copy), v52 (copy)
                v53 = v53 + 1;
                if v53 == v46 then
                    v44(v52);
                end;
            end);
        end;
    end
};