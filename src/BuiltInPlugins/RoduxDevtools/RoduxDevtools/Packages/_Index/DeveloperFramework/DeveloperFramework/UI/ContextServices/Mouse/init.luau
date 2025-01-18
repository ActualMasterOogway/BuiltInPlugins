local v0 = game:DefineFastFlag("DevFrameworkDefaultMouseCursorFix", false) and "rbxasset://SystemCursors/Arrow" or "";
local function _(v1) --[[ Line: 9 ]] --[[ Name: getCursor ]]
    if string.find(v1, "rbxasset://textures/") or string.find(v1, "rbxasset://SystemCursors/") then
        return v1;
    else
        return "rbxasset://SystemCursors/" .. v1;
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v4 = require(l_Parent_0.UI.ContextServices.ContextItem):extend("Mouse");
v4.new = function(v5) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    assert(v5, "Mouse.new expects a PluginMouse instance.");
    local v6 = {
        mouse = v5, 
        cursors = {}
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.get = function(v7) --[[ Line: 34 ]] --[[ Name: get ]]
    return v7.mouse;
end;
v4.__updateCursor = function(v8) --[[ Line: 38 ]] --[[ Name: __updateCursor ]]
    -- upvalues: v0 (copy)
    local l_cursors_0 = v8.cursors;
    local v10 = -1e999;
    for v11, _ in pairs(l_cursors_0) do
        if v10 < v11 then
            v10 = v11;
        end;
    end;
    local v13 = l_cursors_0[v10];
    if v13 and #v13 > 0 then
        v8.mouse.Icon = v13[#v13];
        return;
    else
        v8.mouse.Icon = v0;
        return;
    end;
end;
v4.__pushCursor = function(v14, v15, v16) --[[ Line: 56 ]] --[[ Name: __pushCursor ]]
    v16 = v16 or 1;
    local v17 = v14.cursors[v16] or {};
    table.insert(v17, if not not string.find(v15, "rbxasset://textures/") or string.find(v15, "rbxasset://SystemCursors/") then v15 else "rbxasset://SystemCursors/" .. v15);
    v14.cursors[v16] = v17;
    v14:__updateCursor();
end;
v4.__popCursor = function(v18, v19) --[[ Line: 65 ]] --[[ Name: __popCursor ]]
    v19 = v19 or 1;
    local v20 = v18.cursors[v19];
    if v20 then
        table.remove(v20, #v20);
        if #v20 == 0 then
            v18.cursors[v19] = nil;
        end;
        v18:__updateCursor();
    end;
end;
v4.__resetCursor = function(v21) --[[ Line: 80 ]] --[[ Name: __resetCursor ]]
    -- upvalues: v0 (copy)
    v21.cursors = {};
    v21.mouse.Icon = v0;
end;
return v4;