local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = require(l_Parent_0.UI.ContextServices.ContextItem):extend("Design");
local function _(v3) --[[ Line: 19 ]] --[[ Name: verifyNewItem ]]
    local v4 = false;
    if typeof(v3) == "Instance" then
        v4 = v3:IsA("StyleSheet");
    end;
    assert(v4, "Design.new: Expected a StyleSheet as the target.");
end;
v2.new = function(v6) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v7 = false;
    if typeof(v6) == "Instance" then
        v7 = v6:IsA("StyleSheet");
    end;
    assert(v7, "Design.new: Expected a StyleSheet as the target.");
    local v8 = setmetatable({
        _obj = v6
    }, v2);
    v8._themeChangedSignal = v1.new();
    local v9;
    v7, v9 = pcall(function() --[[ Line: 30 ]]
        -- upvalues: v8 (copy)
        return settings().Studio.ThemeChanged:Connect(function() --[[ Line: 31 ]]
            -- upvalues: v8 (ref)
            v8._themeChangedSignal:Fire(v8);
        end);
    end);
    v8._themeChangedConnection = if v7 then v9 else nil;
    return v8;
end;
v2.get = function(v10) --[[ Line: 40 ]] --[[ Name: get ]]
    return v10._obj;
end;
v2.getSignal = function(v11) --[[ Line: 44 ]] --[[ Name: getSignal ]]
    return v11._themeChangedSignal;
end;
v2.getConsumerItem = function(v12) --[[ Line: 48 ]] --[[ Name: getConsumerItem ]]
    return table.clone(v12);
end;
v2.destroy = function(v13) --[[ Line: 52 ]] --[[ Name: destroy ]]
    if v13._themeChangedConnection then
        v13._themeChangedConnection:Disconnect();
        v13._themeChangedConnection = nil;
    end;
    v13._obj = nil;
end;
v2.getStudioThemeColor = function(v14) --[[ Line: 60 ]] --[[ Name: getStudioThemeColor ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 61 ]]
        return settings().Studio.Theme;
    end);
    if l_status_0 then
        return (l_result_0:GetColor(v14));
    else
        return nil;
    end;
end;
v2.mock = function(v17) --[[ Line: 67 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v18 = v2.new(v17);
    v18.getStudioThemeColor = function() --[[ Line: 69 ]]
        return Color3.fromRGB(0, 0, 0);
    end;
    return v18;
end;
return v2;