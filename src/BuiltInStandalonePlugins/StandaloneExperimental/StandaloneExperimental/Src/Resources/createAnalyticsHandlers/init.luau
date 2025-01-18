local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v5) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), l_StudioService_0 (copy), v2 (copy), l_HttpService_0 (copy)
    local function v9(v6, v7) --[[ Line: 14 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v5 (copy), l_StudioService_0 (ref), v2 (ref), l_HttpService_0 (ref)
        local v8 = v7 or {};
        v8 = v1.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v8);
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("StandaloneExperimentalPlugin", tostring(v6), l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "StandaloneExperimentalPlugin", v6, v8);
    end;
    local function _(v10, v11) --[[ Line: 37 ]] --[[ Name: _reportCounter ]]
        -- upvalues: v2 (ref), v5 (copy)
        v11 = v11 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("StandaloneExperimentalPlugin", tostring(v10), (tostring(v11))));
        end;
        v5:ReportCounter(v10, v11);
    end;
    return {
        counterClicked = function(_, v14) --[[ Line: 52 ]] --[[ Name: counterClicked ]]
            -- upvalues: v9 (copy)
            v9("CounterClicked", {
                action = v14
            });
        end
    };
end;