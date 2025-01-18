local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v2 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v5) --[[ Line: 14 ]]
    -- upvalues: l_join_0 (copy), l_StudioService_0 (copy), v2 (copy), l_HttpService_0 (copy)
    local function v9(v6, v7) --[[ Line: 15 ]] --[[ Name: _sendEvent ]]
        -- upvalues: l_join_0 (ref), v5 (copy), l_StudioService_0 (ref), v2 (ref), l_HttpService_0 (ref)
        local v8 = v7 or {};
        v8 = l_join_0({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v8);
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("AssetImporter", tostring(v6), l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "AssetImporter", v6, v8);
    end;
    local function _(v10, v11) --[[ Line: 38 ]] --[[ Name: _reportCounter ]]
        -- upvalues: v2 (ref), v5 (copy)
        v11 = v11 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("AssetImporter", tostring(v10), (tostring(v11))));
        end;
        v5:ReportCounter(v10, v11);
    end;
    return {
        ImportQueueEnabled = function(_) --[[ Line: 53 ]] --[[ Name: ImportQueueEnabled ]]
            -- upvalues: v9 (copy)
            v9("importQueueEnabled", {});
        end, 
        ImportQueueDisabled = function(_) --[[ Line: 56 ]] --[[ Name: ImportQueueDisabled ]]
            -- upvalues: v9 (copy)
            v9("importQueueDisabled", {});
        end, 
        ImportQueueHalted = function(_) --[[ Line: 59 ]] --[[ Name: ImportQueueHalted ]]
            -- upvalues: v9 (copy)
            v9("importQueueHalted", {});
        end, 
        ImportQueueStarted = function(_, v17) --[[ Line: 62 ]] --[[ Name: ImportQueueStarted ]]
            -- upvalues: v9 (copy)
            v9("importQueueStarted", {
                fileCount = v17
            });
        end
    };
end;