local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy), l_HttpService_0 (copy)
    local function v8(v5, v6) --[[ Line: 12 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v4 (copy), v2 (ref), l_HttpService_0 (ref)
        local v7 = v6 or {};
        v7 = v1.Dictionary.join({
            studioSid = v4:GetSessionId(), 
            clientId = v4:GetClientId(), 
            placeId = game.PlaceId
        }, v7);
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("ExperimentalPlugin", v5, l_HttpService_0:JSONEncode(v7)));
        end;
        v4:SendEventDeferred("studio", "ExperimentalPlugin", v5, v7);
    end;
    return {
        counterClicked = function(_, v10) --[[ Line: 35 ]] --[[ Name: counterClicked ]]
            -- upvalues: v8 (copy)
            v8("CounterClicked", {
                action = v10
            });
        end
    };
end;