local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local function _(v2) --[[ Line: 4 ]] --[[ Name: getTitleNameId ]]
    local v3 = v2.Title or "";
    local v4 = v2.Name or v3:gsub("%s", "");
    return v3, v4, v2.Id or v4;
end;
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    local v8 = v1.PureComponent:extend(v6);
    v8.init = function(v9, v10) --[[ Line: 15 ]] --[[ Name: init ]]
        -- upvalues: v7 (copy), v1 (ref)
        local v11 = v10.Title or "";
        local v12 = v10.Name or v11:gsub("%s", "");
        local v13 = v10.Id or v12;
        local l_v11_0 = v11;
        local l_v12_0 = v12;
        v9.widget = v7(v9, v13);
        if v9.widget:IsA("PluginGui") then
            v9.widget.Title = l_v11_0;
        end;
        v9.widget.Name = l_v12_0;
        v9.widget.ZIndexBehavior = v10.ZIndexBehavior or Enum.ZIndexBehavior.Global;
        if v9.props[v1.Ref] then
            v9.props[v1.Ref](v9.widget);
        end;
        if v9.props[v1.Change.Enabled] then
            v9.changedConnection = v9.widget:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 31 ]]
                -- upvalues: v9 (copy), v1 (ref)
                v9.props[v1.Change.Enabled](v9.widget.Enabled);
            end);
        end;
    end;
    v8.didUpdate = function(v16, v17, _) --[[ Line: 37 ]] --[[ Name: didUpdate ]]
        local v19 = v17.Title or "";
        local v20 = v17.Name or v19:gsub("%s", "");
        local v21 = v17.Id or v20;
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        local _ = v21;
        local l_props_0 = v16.props;
        local v26 = l_props_0.Title or "";
        local v27 = l_props_0.Name or v26:gsub("%s", "");
        local v28 = l_props_0.Id or v27;
        v19 = v26;
        v20 = v27;
        v21 = v28;
        if v19 ~= l_v19_0 and v16.widget:IsA("PluginGui") then
            v16.widget.Title = v19;
        end;
        if v20 ~= l_v20_0 then
            v16.widget.Name = v20;
        end;
        if v16.props.ZIndexBehavior ~= v17.ZIndexBehavior then
            v16.widget.ZIndexBehavior = v16.props.ZIndexBehavior;
        end;
        if v16.props.Enabled ~= v17.Enabled then
            v16.widget.Enabled = v16.props.Enabled;
        end;
    end;
    v8.render = function(v29) --[[ Line: 58 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref)
        return v1.createElement(v1.Portal, {
            target = v29.widget
        }, v29.props[v1.Children]);
    end;
    v8.willUnmount = function(v30) --[[ Line: 64 ]] --[[ Name: willUnmount ]]
        if v30.changedConnection then
            v30.changedConnection:Disconnect();
        end;
        if v30.widget then
            v30.widget:Destroy();
        end;
    end;
    return v8;
end;