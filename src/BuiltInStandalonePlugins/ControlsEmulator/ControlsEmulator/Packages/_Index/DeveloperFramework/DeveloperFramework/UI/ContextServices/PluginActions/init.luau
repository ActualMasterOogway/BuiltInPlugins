local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices.ContextItem);
local v2 = require(l_Parent_0.Util.Typecheck.t);
local v3 = v1:extend("PluginActions");
v3.new = function(v4, v5) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(v4, "plugin must be provided");
    assert(v2.values(v2.strictInterface({
        id = v2.string, 
        text = v2.string, 
        statusTip = v2.optional(v2.string), 
        iconName = v2.optional(v2.string), 
        allowBinding = v2.optional(v2.boolean), 
        defaultShortcut = v2.optional(v2.string)
    }))(v5));
    local v6 = {
        plugin = v4
    };
    setmetatable(v6, v3);
    v6.actions = v6:__mapActionDefinitions(v5);
    return v6;
end;
v3.__mapActionDefinitions = function(v7, v8) --[[ Line: 38 ]] --[[ Name: __mapActionDefinitions ]]
    -- upvalues: v2 (copy)
    local l_Name_0 = v7.plugin.Name;
    assert(v2.string(l_Name_0), "plugin.Name must be a string");
    local v10 = {};
    for _, v12 in pairs(v8) do
        local l_id_0 = v12.id;
        assert(v10[l_id_0] == nil, "Duplicate action, ID: " .. l_id_0);
        local l_text_0 = v12.text;
        local v15 = v12.statusTip or "";
        local v16 = v12.iconName or "";
        local v17 = true;
        if v12.allowBinding ~= nil then
            v17 = v12.allowBinding;
        end;
        local l_PluginAction_0 = v7.plugin:CreatePluginAction(l_Name_0 .. "_" .. l_id_0, l_text_0, v15, v16, v17);
        l_PluginAction_0.Enabled = false;
        if v12.defaultShortcut then
            l_PluginAction_0.DefaultShortcut = v12.defaultShortcut;
        end;
        v10[l_id_0] = l_PluginAction_0;
    end;
    return v10;
end;
v3.get = function(v19, v20) --[[ Line: 69 ]] --[[ Name: get ]]
    -- upvalues: v2 (copy)
    assert(v2.string(v20), "id must be a string");
    return v19.actions[v20];
end;
return v3;