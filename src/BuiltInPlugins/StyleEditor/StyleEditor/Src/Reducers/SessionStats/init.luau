local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v2.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SessionStats.PluginFocusEnd);
local v6 = require(l_Actions_0.SessionStats.PluginFocusStart);
local v7 = require(l_Actions_0.SessionStats.SetSessionStartTimestamp);
local v8 = require(l_Actions_0.SessionStats.TrackButtonPress);
local _ = require(l_Parent_0.Src.Types);
local v10 = {
    SessionStartTimestamp = 0, 
    TotalPluginFocusTimeSeconds = 0, 
    PluginFocusPeriodStartTimestamp = nil, 
    PluginFocusEndWithoutStartCount = 0, 
    ButtonPressCounts = {}
};
return v1.createReducer(v10, {
    [v8.name] = function(v11, v12) --[[ Line: 34 ]]
        -- upvalues: l_join_0 (copy)
        local v13 = v11.ButtonPressCounts[v12.buttonId] or 0;
        return l_join_0(v11, {
            ButtonPressCounts = l_join_0(v11.ButtonPressCounts, {
                [v12.buttonId] = v13 + 1
            })
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 44 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v14, {
            SessionStartTimestamp = v15.startTimestamp
        });
    end, 
    [v6.name] = function(v16, v17) --[[ Line: 50 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            PluginFocusPeriodStartTimestamp = v17.focusStartTimestamp
        });
    end, 
    [v5.name] = function(v18, v19) --[[ Line: 56 ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        local l_PluginFocusEndWithoutStartCount_0 = v18.PluginFocusEndWithoutStartCount;
        local v21 = 0;
        if v18.PluginFocusPeriodStartTimestamp then
            v21 = v19.focusEndTimestamp - v18.PluginFocusPeriodStartTimestamp;
        else
            l_PluginFocusEndWithoutStartCount_0 = l_PluginFocusEndWithoutStartCount_0 + 1;
        end;
        local v22 = v18.TotalPluginFocusTimeSeconds + v21;
        return l_join_0(v18, {
            PluginFocusPeriodStartTimestamp = v2.None, 
            TotalPluginFocusTimeSeconds = v22, 
            PluginFocusEndWithoutStartCount = l_PluginFocusEndWithoutStartCount_0
        });
    end
});