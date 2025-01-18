local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local v10 = require(script.FlushDetails);
local v11 = require(script.ReduceDetails);
local v12 = v2.PureComponent:extend("Details");
v12.render = function(v13) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v11 (copy), v2 (copy)
    local l_props_0 = v13.props;
    local v15 = l_props_0.Events[l_props_0.SelectedIndex];
    if not v15 then
        return nil;
    else
        local v16 = if v15.eventType == "Flush" then v10 else if v15.eventType == "Reduce" then v11 else nil;
        if not v16 then
            return nil;
        else
            return v2.createElement(v16, {
                Event = v15, 
                SelectedIndex = l_props_0.SelectedIndex, 
                OnSetState = l_props_0.OnSetState, 
                OnRedoAction = l_props_0.OnRedoAction, 
                OnUndoAction = l_props_0.OnUndoAction
            });
        end;
    end;
end;
v12 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12);
return v3.connect(function(v17, v18) --[[ Line: 74 ]]
    return {
        SelectedIndex = v18.SelectedIndex or v17.selectedIndex, 
        Events = v18.Events or v17.events
    };
end)(v12);