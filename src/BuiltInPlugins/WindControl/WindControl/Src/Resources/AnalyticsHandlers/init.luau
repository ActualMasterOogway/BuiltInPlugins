local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local function v8(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v3 (copy)
        v6 = v6 or {};
        v5 = v5 or "WindControl";
        local v7 = v1.Dictionary.join({
            placeId = game.PlaceId
        }, v6);
        v3:SendEventDeferred("studio", v5, v4, v7);
    end;
    return {
        openedFromRibbon = function() --[[ Line: 20 ]] --[[ Name: openedFromRibbon ]]
            -- upvalues: v8 (copy)
            v8("windsockOrigin", "ribbon");
        end, 
        openedFromProperties = function() --[[ Line: 24 ]] --[[ Name: openedFromProperties ]]
            -- upvalues: v8 (copy)
            v8("windsockOrigin", "properties");
        end, 
        usageReport = function(v9) --[[ Line: 28 ]] --[[ Name: usageReport ]]
            -- upvalues: v2 (ref), v8 (copy)
            local v10 = v9 and "widgetDisabled" or "placeClosing";
            if v2:totalCount() > 0 then
                v8("windsockUsage", v10, {
                    textFieldCount = v2.textFieldCount, 
                    sliderCount = v2.sliderCount, 
                    greenCircleCount = v2.greenCircleCount
                });
                v2:reset();
            end;
        end
    };
end;