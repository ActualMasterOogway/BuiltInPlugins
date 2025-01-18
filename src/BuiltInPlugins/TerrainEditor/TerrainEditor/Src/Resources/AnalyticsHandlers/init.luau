local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.ConvertForAnalytics);
local v4 = require(l_Util_0.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v8) --[[ Line: 41 ]]
    -- upvalues: l_StudioService_0 (copy), v3 (copy), l_join_0 (copy), v4 (copy), l_HttpService_0 (copy)
    local function v12(v9, v10) --[[ Line: 42 ]] --[[ Name: reportEvent ]]
        -- upvalues: v8 (copy), l_StudioService_0 (ref), v3 (ref), l_join_0 (ref), v4 (ref), l_HttpService_0 (ref)
        local v11 = {
            studioSid = v8:GetSessionId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        };
        v10 = v3(l_join_0(v11, v10));
        if v4.LogAnalytics() then
            print((("(EVENT) TerrainEditor reported event %* with payload %*"):format(tostring(v9), (l_HttpService_0:JSONEncode(v10)))));
        end;
        v8:SendEventDeferred("studio", "TerrainEditor", v9, v10);
    end;
    local function _(v13, v14) --[[ Line: 61 ]] --[[ Name: reportCounter ]]
        -- upvalues: v4 (ref), v8 (copy)
        v14 = v14 or 1;
        if v4.LogAnalytics() then
            print((("Terrain ReportCounter counterName=%* count=%*"):format(v13, v14)));
        end;
        v8:ReportCounter(v13, v14);
    end;
    local function _(v16, v17) --[[ Line: 70 ]] --[[ Name: reportStatistic ]]
        -- upvalues: v4 (ref), v8 (copy)
        if v4.LogAnalytics() then
            print((("Terrain ReportCounter counterName=%* count=%*"):format(v16, v17)));
        end;
        v8:ReportStats(v16, v17);
    end;
    return {
        Activated = function(_, v20, v21) --[[ Line: 79 ]] --[[ Name: Activated ]]
            -- upvalues: v4 (ref), v8 (copy)
            local v22 = ("%*ToolActivated"):format(v20);
            local v23 = v21 or 1;
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v22, v23)));
            end;
            v8:ReportCounter(v22, v23);
        end, 
        Usage = function(_, v25, v26) --[[ Line: 83 ]] --[[ Name: Usage ]]
            -- upvalues: v4 (ref), v8 (copy)
            local v27 = ("%*ToolUsage"):format(v25);
            local v28 = v26 or 1;
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v27, v28)));
            end;
            v8:ReportCounter(v27, v28);
        end, 
        Performance = function(_, v30, v31) --[[ Line: 87 ]] --[[ Name: Performance ]]
            -- upvalues: v4 (ref), v8 (copy)
            local v32 = ("%*ToolPerformance"):format(v30);
            if v4.LogAnalytics() then
                print((("Terrain ReportCounter counterName=%* count=%*"):format(v32, v31)));
            end;
            v8:ReportStats(v32, v31);
        end, 
        BrushProperties = function(_, v34) --[[ Line: 91 ]] --[[ Name: BrushProperties ]]
            -- upvalues: v12 (copy)
            v12("terrainEditorBrushProperties", v34);
        end, 
        RegionProperties = function(_, v36) --[[ Line: 95 ]] --[[ Name: RegionProperties ]]
            -- upvalues: v12 (copy)
            v12("terrainEditorRegionProperties", v36);
        end, 
        MaterialProperties = function(_, v38) --[[ Line: 99 ]] --[[ Name: MaterialProperties ]]
            -- upvalues: v12 (copy)
            v12("terrainEditorMaterialProperties", v38);
        end
    };
end;