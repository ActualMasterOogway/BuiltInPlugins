local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v6 = {};
local v7 = Vector2.new(1000000, 50);
v6.getTextWidth = function(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: getTextWidth ]]
    -- upvalues: l_TextService_0 (copy), v7 (copy)
    return l_TextService_0:GetTextSize(v8, v9, v10, v7).X;
end;
v6.split = function(v11, v12) --[[ Line: 21 ]] --[[ Name: split ]]
    local _ = v12 or ":";
    local v14 = {};
    v11:gsub(string.format("([^%s]+)", v12), function(v15) --[[ Line: 24 ]]
        -- upvalues: v14 (copy)
        v14[#v14 + 1] = v15;
    end);
    return v14;
end;
v6.parseTime = function(v16, v17, v18) --[[ Line: 30 ]] --[[ Name: parseTime ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy)
    if v5() then
        if v18 == v3.TIMELINE_UNITS.SecondsDecimal then
            local v19 = tonumber(v16);
            if v19 then
                return v19 * v3.TICK_FREQUENCY;
            else
                return nil;
            end;
        elseif v18 == v3.TIMELINE_UNITS.Frames then
            local v20 = tonumber(v16);
            if v20 then
                return v20 * v3.TICK_FREQUENCY / v17;
            else
                return nil;
            end;
        else
            local v21 = v6.split(v16, ":");
            local v22 = {};
            for _, v24 in ipairs(v21) do
                local v25 = tonumber(v24);
                if v25 then
                    table.insert(v22, v25);
                else
                    return nil;
                end;
            end;
            if #v22 == 1 then
                return v22[1] * v3.TICK_FREQUENCY / v17;
            elseif #v22 > 1 then
                return (v22[1] + v22[2] / v17) * v3.TICK_FREQUENCY;
            else
                return nil;
            end;
        end;
    else
        local v26 = v6.split(v16, ":");
        if #v26 == 0 then
            v26 = v6.split(v16, ";");
        end;
        local v27 = {};
        for _, v29 in ipairs(v26) do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                -- upvalues: v29 (copy)
                return (tonumber(v29));
            end);
            if l_status_0 then
                table.insert(v27, l_result_0);
            else
                return 0;
            end;
        end;
        if #v27 == 1 then
            return v27[1] * v3.TICK_FREQUENCY / v17;
        elseif #v27 > 1 then
            return (v27[1] + v27[2] / v17) * v3.TICK_FREQUENCY;
        else
            return nil;
        end;
    end;
end;
v6.formatTime = function(v32, v33, v34) --[[ Line: 84 ]] --[[ Name: formatTime ]]
    -- upvalues: v3 (copy), v4 (copy), l_Math_0 (copy)
    if v34 == v3.TIMELINE_UNITS.Frames then
        return (tostring((math.floor(v32 * v33 / v3.TICK_FREQUENCY))));
    elseif v34 == v3.TIMELINE_UNITS.Seconds then
        local v35 = v4.getNearestTick(v32 * v33 / v3.TICK_FREQUENCY);
        if v33 == 0 then
            return (tostring("0:" .. string.format("%02d", 0)));
        else
            local v36 = math.floor(v35 / v33);
            local v37 = v35 - v36 * v33;
            return (tostring(v36 .. ":" .. string.format("%02d", v37)));
        end;
    elseif v34 == v3.TIMELINE_UNITS.SecondsDecimal then
        return l_Math_0.round(v32 / v3.TICK_FREQUENCY, 2);
    else
        return;
    end;
end;
v6.formatTime_DEPRECATED = function(v38, v39, v40) --[[ Line: 103 ]] --[[ Name: formatTime_DEPRECATED ]]
    -- upvalues: v3 (copy), v4 (copy)
    if not v40 then
        return (tostring((math.floor(v38 * v39 / v3.TICK_FREQUENCY))));
    else
        local v41 = v4.getNearestTick(v38 * v39 / v3.TICK_FREQUENCY);
        if v39 == 0 then
            return (tostring("0:" .. string.format("%02d", 0)));
        else
            local v42 = math.floor(v41 / v39);
            local v43 = v41 - v42 * v39;
            return (tostring(v42 .. ":" .. string.format("%02d", v43)));
        end;
    end;
end;
v6.formatTimeInSeconds = function(v44, v45) --[[ Line: 120 ]] --[[ Name: formatTimeInSeconds ]]
    -- upvalues: l_Math_0 (copy)
    if v45 == 0 then
        return (tostring("0s"));
    else
        return (tostring(l_Math_0.round(v44 / v45, 2) .. "s"));
    end;
end;
v6.getMaxTextWidth = function(v46, v47, v48) --[[ Line: 128 ]] --[[ Name: getMaxTextWidth ]]
    -- upvalues: v6 (copy)
    local v49 = 0;
    for _, v51 in ipairs(v46) do
        v49 = math.max(v49, (v6.getTextWidth(v51.Name, v47, v48)));
    end;
    return v49;
end;
return v6;