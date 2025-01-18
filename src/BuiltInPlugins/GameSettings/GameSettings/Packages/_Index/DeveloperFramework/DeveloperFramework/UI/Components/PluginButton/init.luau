local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v3 = require(l_Parent_0.SharedFlags.getFFlagPluginDropdownButton)();
local v4 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMaterialActionAsTool)();
local v5 = v1.PureComponent:extend("PluginButton");
l_Typecheck_0.wrap(v5, script);
local v6 = game:DefineFastFlag("DynamicPluginButtonIcon", false);
v5.createButton = function(v7) --[[ Line: 38 ]] --[[ Name: createButton ]]
    -- upvalues: v3 (copy)
    local l_props_0 = v7.props;
    local l_Toolbar_0 = l_props_0.Toolbar;
    local l_Title_0 = l_props_0.Title;
    local v11 = l_props_0.Id or l_Title_0;
    local v12 = l_props_0.Tooltip or "";
    local v13 = l_props_0.Icon or "";
    local l_OnClick_0 = l_props_0.OnClick;
    local v15 = if v3 then l_props_0.OnDropdownClick else nil;
    assert(typeof(l_Title_0) == "string", string.format("PluginButton requires Title to be of type string not %s", (typeof(l_Title_0))));
    if v3 then
        v7.button = if l_props_0.ButtonType == "Dropdown" then l_Toolbar_0:CreatePopupButton(v11, v12, v13, l_Title_0) else l_Toolbar_0:CreateButton(v11, v12, v13, l_Title_0);
    else
        v7.button = l_Toolbar_0:CreateButton(v11, v12, v13, l_Title_0);
    end;
    v7.button.ClickableWhenViewportHidden = l_props_0.ClickableWhenViewportHidden == nil or l_props_0.ClickableWhenViewportHidden;
    v7.button.Click:Connect(function() --[[ Line: 64 ]]
        -- upvalues: l_OnClick_0 (copy), v7 (copy)
        l_OnClick_0();
        v7:updateButton();
    end);
    if v3 and l_props_0.ButtonType == "Dropdown" and v15 then
        v7.button.DropdownClick:Connect(v15);
    end;
end;
v5.updateButton = function(v16) --[[ Line: 84 ]] --[[ Name: updateButton ]]
    -- upvalues: v4 (copy), v6 (copy)
    local l_props_1 = v16.props;
    local l_Enabled_0 = l_props_1.Enabled;
    local l_Active_0 = l_props_1.Active;
    local v20 = if v4 then l_props_1.DropdownActive else nil;
    v16.button:SetActive(l_Active_0);
    if l_Enabled_0 ~= nil then
        v16.button.Enabled = l_Enabled_0;
    end;
    if v4 and v20 ~= nil then
        v16.button:SetDropdownActive(v20);
    end;
    if v6 then
        local v21 = l_props_1.Icon or "";
        if v21 ~= v16.button.Icon then
            v16.button.Icon = v21;
        end;
    end;
end;
v5.didMount = function(v22) --[[ Line: 109 ]] --[[ Name: didMount ]]
    v22:updateButton();
end;
v5.didUpdate = function(v23) --[[ Line: 113 ]] --[[ Name: didUpdate ]]
    v23:updateButton();
end;
v5.render = function(v24) --[[ Line: 117 ]] --[[ Name: render ]]
    if not v24.button then
        v24:createButton();
    end;
end;
v5.willUnmount = function(v25) --[[ Line: 123 ]] --[[ Name: willUnmount ]]
    if v25.button then
        v25.button:Destroy();
    end;
end;
return v5;