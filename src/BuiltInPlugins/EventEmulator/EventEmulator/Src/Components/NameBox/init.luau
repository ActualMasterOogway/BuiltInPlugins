local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local v6 = require(l_Components_0.TextInput);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.ChangeCurrentEventName);
local l_INPUT_PANE_LAYOUT_0 = require(l_Parent_0.Src.Util.Constants).INPUT_PANE_LAYOUT;
local v10 = v1.PureComponent:extend("NameBox");
v10.init = function(v11) --[[ Line: 20 ]] --[[ Name: init ]]
    v11.OnChange = function(v12) --[[ Line: 21 ]]
        -- upvalues: v11 (copy)
        v11.props.ChangeCurrentEventName(v12);
    end;
end;
v10.render = function(v13) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), l_INPUT_PANE_LAYOUT_0 (copy)
    local l_CurrentEventName_0 = v13.props.CurrentEventName;
    return v1.createElement(v6, {
        Label = "Name", 
        Text = l_CurrentEventName_0, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.NameBox, 
        OnChange = v13.OnChange
    });
end;
v10 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10);
return v2.connect(function(v15, _) --[[ Line: 40 ]]
    return {
        CurrentEventName = v15.Status.CurrentEventName
    };
end, function(v17) --[[ Line: 44 ]]
    -- upvalues: v8 (copy)
    return {
        ChangeCurrentEventName = function(v18) --[[ Line: 46 ]] --[[ Name: ChangeCurrentEventName ]]
            -- upvalues: v17 (copy), v8 (ref)
            v17(v8(v18));
        end
    };
end)(v10);