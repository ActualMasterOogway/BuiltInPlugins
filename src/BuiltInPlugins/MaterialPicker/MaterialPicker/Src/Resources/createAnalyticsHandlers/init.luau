local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local l_join_0 = v2.join;
game:DefineFastInt("MaterialPickerAnalyticsThrottleHundrethsPercent", 0);
return function(v5) --[[ Line: 17 ]]
    -- upvalues: l_join_0 (copy), v3 (copy), l_HttpService_0 (copy)
    local function _(v6, v7) --[[ Line: 18 ]] --[[ Name: _sendEvent ]]
        -- upvalues: l_join_0 (ref), v5 (copy), v3 (ref), l_HttpService_0 (ref)
        local v8 = v7 or {};
        v8 = l_join_0({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId
        }, v8);
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialPicker", v6, l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "MaterialPicker", v6, v8);
    end;
    local function v13(v10, v11) --[[ Line: 40 ]] --[[ Name: _reportInfluxSeries ]]
        -- upvalues: v3 (ref), l_HttpService_0 (ref), v5 (copy)
        local l_game_FastInt_0 = game:GetFastInt("MaterialPickerAnalyticsThrottleHundrethsPercent");
        v11 = v11 or {};
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s throttlingPercent=%s"):format("MaterialPicker", tostring(v10), l_HttpService_0:JSONEncode(v11), (tostring(l_game_FastInt_0))));
        end;
        v5:ReportInfluxSeries(v10, v11, l_game_FastInt_0);
    end;
    return {
        MaterialApplied = function(_, v15, v16, v17, v18, v19) --[[ Line: 60 ]] --[[ Name: MaterialApplied ]]
            -- upvalues: l_join_0 (ref), v13 (copy)
            args = l_join_0({
                applicationMethod = v15, 
                instancesSelectedCount = v16, 
                materialIdentifier = v17, 
                materialType = v18
            }, v19 or {});
            v13("MaterialPicker_MaterialApplied", args);
        end, 
        MaterialGeneratorOpened = function() --[[ Line: 78 ]] --[[ Name: MaterialGeneratorOpened ]]
            -- upvalues: v13 (copy)
            v13("MaterialPicker_MaterialGeneratorOpened", {});
        end, 
        MaterialManagerOpened = function() --[[ Line: 82 ]] --[[ Name: MaterialManagerOpened ]]
            -- upvalues: v13 (copy)
            v13("MaterialPicker_MaterialManagerOpened", {});
        end, 
        PopupOpened = function() --[[ Line: 86 ]] --[[ Name: PopupOpened ]]
            -- upvalues: v13 (copy)
            v13("MaterialPicker_PopupOpened", {});
        end, 
        FilterChipToggled = function(_, v21, v22) --[[ Line: 90 ]] --[[ Name: FilterChipToggled ]]
            -- upvalues: v13 (copy)
            v13("MaterialPicker_FilterChipToggled", {
                filterChipName = v21, 
                toggleType = v22
            });
        end, 
        ViewTypeToggled = function(_, v24) --[[ Line: 97 ]] --[[ Name: ViewTypeToggled ]]
            -- upvalues: v13 (copy)
            v13("MaterialPicker_ViewTypeToggled", {
                viewType = v24
            });
        end
    };
end;