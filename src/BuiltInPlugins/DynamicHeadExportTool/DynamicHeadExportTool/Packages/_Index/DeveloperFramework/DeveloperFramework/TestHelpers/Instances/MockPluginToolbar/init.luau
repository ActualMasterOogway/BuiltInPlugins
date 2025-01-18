local v0 = require(script.Parent.MockPluginToolbarButton);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = {
        _plugin = v2, 
        _id = v3, 
        Name = v3, 
        Text = v3, 
        _buttons = {}
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.getButtons = function(v5) --[[ Line: 21 ]] --[[ Name: getButtons ]]
    return v5._buttons;
end;
v1.Destroy = function(v6) --[[ Line: 25 ]] --[[ Name: Destroy ]]
    v6._plugin = nil;
    for _, v8 in pairs(v6._buttons) do
        v8:Destroy();
    end;
    v6._buttons = {};
end;
v1.CreateButton = function(v9, v10, v11, v12, v13) --[[ Line: 33 ]] --[[ Name: CreateButton ]]
    -- upvalues: v0 (copy)
    local v14 = v10 and #v10 > 0;
    local v15 = v11 and #v11 > 0;
    local v16 = v12 and #v12 > 0;
    local v17 = v13 and #v13 > 0;
    local v18 = v15 or v16 or v17;
    local v19 = nil;
    local v20 = nil;
    if v18 then
        v19 = v14 and v10 or v11;
        v20 = v17 and v13 or v14 and v10 or v11;
    else
        v19 = v10;
        v20 = v10;
        assert(#v19 > 0, ("Toolbar %s tried to create a button with empty id"):format(v9._id));
    end;
    assert(not v9._buttons[v19], ("Toolbar %s already has a button with id %s"):format(v9._id, v19));
    local v21 = v0.new(v9._plugin, v9, v19);
    v9._buttons[v19] = v21;
    v21.Text = v20;
    if v18 then
        v21.Tooltip = v11 or "";
        v21.Icon = v12 or "";
    end;
    return v21;
end;
return v1;