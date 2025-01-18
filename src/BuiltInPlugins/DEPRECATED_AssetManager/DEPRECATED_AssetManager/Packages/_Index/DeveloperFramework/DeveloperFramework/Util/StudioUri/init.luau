local l_Parent_0 = script.Parent.Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local _ = require(l_Parent_0.Types);
local v3 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkRibbonHooks)();
local v4 = {};
if v3 then
    v4.toString = function(v5) --[[ Line: 14 ]] --[[ Name: toString ]]
        local v6 = table.create(5);
        if v5.DataModel then
            table.insert(v6, (("DataModel:%*"):format(v5.DataModel)));
        end;
        if v5.PluginType then
            table.insert(v6, (("PluginType:%*"):format(v5.PluginType)));
        end;
        if v5.PluginId then
            table.insert(v6, (("PluginId:%*"):format(v5.PluginId)));
        end;
        if v5.Category then
            table.insert(v6, (("Category:%*"):format(v5.Category)));
        end;
        if v5.ItemId then
            table.insert(v6, (("ItemId:%*"):format(v5.ItemId)));
        end;
        return table.concat(v6, ", ");
    end;
else
    v4.toString = function(v7) --[[ Line: 36 ]] --[[ Name: toString ]]
        return (("StudioUri(%*,%*,%*,%*,%*)"):format(v7.DataModel or "", v7.PluginType or "", v7.PluginId or "", v7.Category or "", v7.ItemId or ""));
    end;
end;
v4.equals = function(v8, v9) --[[ Line: 41 ]] --[[ Name: equals ]]
    local v10 = false;
    if v8.DataModel == v9.DataModel then
        v10 = false;
        if v8.PluginType == v9.PluginType then
            v10 = false;
            if v8.PluginId == v9.PluginId then
                v10 = false;
                if v8.Category == v9.Category then
                    v10 = v8.ItemId == v9.ItemId;
                end;
            end;
        end;
    end;
    return v10;
end;
v4.child = function(v11, v12) --[[ Line: 49 ]] --[[ Name: child ]]
    -- upvalues: l_join_0 (copy)
    return l_join_0(v11, {
        ItemId = if v11.ItemId then ("%*/%*"):format(v11.ItemId, v12) else v12
    });
end;
v4.isNull = function(v13) --[[ Line: 55 ]] --[[ Name: isNull ]]
    return v13.DataModel == "Null";
end;
v4.isValid = function(v14) --[[ Line: 59 ]] --[[ Name: isValid ]]
    return type(v14) == "table";
end;
v4.fromAction = function(v15, v16) --[[ Line: 63 ]] --[[ Name: fromAction ]]
    return {
        DataModel = "Standalone", 
        PluginId = v15, 
        Category = "Actions", 
        ItemId = v16
    };
end;
v4.fromSetting = function(v17, v18) --[[ Line: 72 ]] --[[ Name: fromSetting ]]
    return {
        DataModel = "Standalone", 
        PluginId = v17, 
        Category = "Settings", 
        ItemId = v18
    };
end;
return v4;