local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local function v6(v3, v4) --[[ Line: 8 ]] --[[ Name: sendPoint ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v5 = v4 or {};
        v5 = v1.Dictionary.join({
            placeId = game.PlaceId, 
            calledFrom = v3
        }, v5);
        v2:ReportInfluxSeries("TagEditorUsage", v5, game:GetFastInt("ReportTagEditorEventsThrottleHundrethsPercent2"));
    end;
    local function _(v7) --[[ Line: 23 ]] --[[ Name: reportCounter ]]
        -- upvalues: v2 (copy)
        v2:ReportCounter(v7);
    end;
    return {
        opened = function() --[[ Line: 28 ]] --[[ Name: opened ]]
            -- upvalues: v6 (copy)
            v6("Opened");
        end, 
        worldVisualization = function() --[[ Line: 32 ]] --[[ Name: worldVisualization ]]
            -- upvalues: v6 (copy)
            v6("WorldVisualization");
        end, 
        colorChanged = function() --[[ Line: 36 ]] --[[ Name: colorChanged ]]
            -- upvalues: v6 (copy)
            v6("ColorChanged");
        end, 
        iconChanged = function() --[[ Line: 40 ]] --[[ Name: iconChanged ]]
            -- upvalues: v6 (copy)
            v6("IconChanged");
        end, 
        tagCreated = function() --[[ Line: 44 ]] --[[ Name: tagCreated ]]
            -- upvalues: v6 (copy)
            v6("TagCreated");
        end, 
        objectTagged = function() --[[ Line: 48 ]] --[[ Name: objectTagged ]]
            -- upvalues: v6 (copy)
            v6("ObjectTagged");
        end, 
        toggleWidget = function() --[[ Line: 52 ]] --[[ Name: toggleWidget ]]
            -- upvalues: v2 (copy)
            v2:ReportCounter("TagEditorToggleWidget");
        end, 
        openWidget = function() --[[ Line: 56 ]] --[[ Name: openWidget ]]
            -- upvalues: v2 (copy)
            v2:ReportCounter("TagEditorOpenWidget");
        end, 
        closeWidget = function() --[[ Line: 60 ]] --[[ Name: closeWidget ]]
            -- upvalues: v2 (copy)
            v2:ReportCounter("TagEditorCloseWidget");
        end
    };
end;