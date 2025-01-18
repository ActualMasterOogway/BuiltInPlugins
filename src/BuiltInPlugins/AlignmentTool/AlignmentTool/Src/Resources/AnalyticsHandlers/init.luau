local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Src.Utility.DebugFlags);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local function v11(v5) --[[ Line: 14 ]] --[[ Name: uniqueClassNames ]]
    local v6 = {};
    local v7 = {};
    for _, v9 in ipairs(v5) do
        local l_ClassName_0 = v9.ClassName;
        if not v6[l_ClassName_0] then
            v6[l_ClassName_0] = true;
            table.insert(v7, l_ClassName_0);
        end;
    end;
    return table.concat(v7, ",");
end;
return function(v12) --[[ Line: 27 ]]
    -- upvalues: l_join_0 (copy), v3 (copy), l_HttpService_0 (copy), v11 (copy)
    local function v16(v13, v14) --[[ Line: 28 ]] --[[ Name: sendEvent ]]
        -- upvalues: l_join_0 (ref), v12 (copy), v3 (ref), l_HttpService_0 (ref)
        local v15 = v14 or {};
        v15 = l_join_0({
            studioSid = v12:GetSessionId(), 
            clientId = v12:GetClientId(), 
            placeId = game.PlaceId
        }, v15);
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("AlignTool", tostring(v13), l_HttpService_0:JSONEncode(v15)));
        end;
        v12:SendEventDeferred("studio", "AlignTool", v13, v15);
    end;
    local function _(v17, v18) --[[ Line: 50 ]] --[[ Name: reportCounter ]]
        -- upvalues: v3 (ref), v12 (copy)
        v18 = v18 or 1;
        if v3.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("AlignTool", tostring(v17), (tostring(v18))));
        end;
        v12:ReportCounter(v17, v18);
    end;
    return {
        alignToolOpen = function() --[[ Line: 65 ]] --[[ Name: alignToolOpen ]]
            -- upvalues: v16 (copy)
            v16("AlignToolOpen");
        end, 
        alignToolClose = function() --[[ Line: 69 ]] --[[ Name: alignToolClose ]]
            -- upvalues: v16 (copy)
            v16("AlignToolClose");
        end, 
        alignToolImpression = function() --[[ Line: 73 ]] --[[ Name: alignToolImpression ]]
            -- upvalues: v3 (ref), v12 (copy), v16 (copy)
            local v20 = nil or 1;
            if v3.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("AlignTool", tostring("AlignToolImpression"), (tostring(v20))));
            end;
            v12:ReportCounter("AlignToolImpression", v20);
            v16("AlignToolImpression");
        end, 
        useAlignTool = function(_, v22, v23) --[[ Line: 78 ]] --[[ Name: useAlignTool ]]
            -- upvalues: v11 (ref), v16 (copy)
            local v24 = v11(v22);
            local v25 = {
                mode = v23.Mode, 
                x = v23.Axes.X, 
                y = v23.Axes.Y, 
                z = v23.Axes.Z, 
                coordinateSpace = v23.CoordinateSpace, 
                relativeTo = v23.RelativeTo, 
                objectCount = #v22, 
                objectTypes = v24
            };
            v16("UseAlignTool", v25);
        end
    };
end;