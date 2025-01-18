local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local _ = require(l_script_FirstAncestor_0.Src.Types);
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)() then
    return require(l_script_FirstAncestor_0.Packages.Framework).Util.StudioUri;
else
    local v3 = {};
    return {
        toString = function(v4) --[[ Line: 17 ]] --[[ Name: toString ]]
            -- upvalues: v3 (copy)
            local v5 = table.create(5);
            local v6 = v4 or v3;
            if not v6 then
                return "";
            else
                if v6.DataModel then
                    table.insert(v5, (("DataModel:%*"):format(v6.DataModel)));
                end;
                if v6.PluginType then
                    table.insert(v5, (("PluginType:%*"):format(v6.PluginType)));
                end;
                if v6.PluginId then
                    table.insert(v5, (("PluginId:%*"):format(v6.PluginId)));
                end;
                if v6.Category then
                    table.insert(v5, (("Category:%*"):format(v6.Category)));
                end;
                if v6.ItemId then
                    table.insert(v5, (("ItemId:%*"):format(v6.ItemId)));
                end;
                return table.concat(v5, ", ");
            end;
        end, 
        equals = function(v7, v8) --[[ Line: 45 ]] --[[ Name: equals ]]
            local v9 = false;
            if v7.DataModel == v8.DataModel then
                v9 = false;
                if v7.PluginType == v8.PluginType then
                    v9 = false;
                    if v7.PluginId == v8.PluginId then
                        v9 = false;
                        if v7.Category == v8.Category then
                            v9 = v7.ItemId == v8.ItemId;
                        end;
                    end;
                end;
            end;
            return v9;
        end, 
        child = function(v10, v11) --[[ Line: 53 ]] --[[ Name: child ]]
            -- upvalues: l_join_0 (copy)
            return l_join_0(v10, {
                ItemId = if v10.ItemId then ("%*/%*"):format(v10.ItemId, v11) else v11
            });
        end, 
        isNull = function(v12) --[[ Line: 59 ]] --[[ Name: isNull ]]
            return v12.DataModel == "Null";
        end, 
        isValid = function(v13) --[[ Line: 63 ]] --[[ Name: isValid ]]
            return type(v13) == "table";
        end, 
        fromAction = function(v14, v15) --[[ Line: 67 ]] --[[ Name: fromAction ]]
            return {
                DataModel = "Standalone", 
                PluginId = v14, 
                Category = "Actions", 
                ItemId = v15
            };
        end, 
        fromSetting = function(v16, v17) --[[ Line: 76 ]] --[[ Name: fromSetting ]]
            return {
                DataModel = "Standalone", 
                PluginId = v16, 
                Category = "Settings", 
                ItemId = v17
            };
        end
    };
end;