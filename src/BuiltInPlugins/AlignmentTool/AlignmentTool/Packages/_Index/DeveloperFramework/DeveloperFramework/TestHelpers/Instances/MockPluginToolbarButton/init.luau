local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = {
        _plugin = v3, 
        _toolbar = v4, 
        _id = v5, 
        Name = v5, 
        Tooltip = "", 
        Icon = "", 
        Text = "", 
        Enabled = true, 
        Active = false, 
        ClickableWhenViewportHidden = true, 
        Click = v1.new()
    };
    setmetatable(v6, v2);
    return v6;
end;
v2.getId = function(v7) --[[ Line: 28 ]] --[[ Name: getId ]]
    return v7._id;
end;
v2.Destroy = function(v8) --[[ Line: 32 ]] --[[ Name: Destroy ]]
    v8._toolbar = nil;
    v8._plugin = nil;
end;
v2.SetActive = function(v9, v10) --[[ Line: 37 ]] --[[ Name: SetActive ]]
    if v9._plugin and v9.Active and not v10 then
        v9._plugin:Deactivate();
    end;
    v9.Active = v10;
end;
return v2;