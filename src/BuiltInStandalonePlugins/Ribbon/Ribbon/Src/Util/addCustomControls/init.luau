local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_append_0 = require(l_script_FirstAncestor_0.Packages.Dash).append;
local v3 = {
    Type = "Separator", 
    Size = "Large"
};
addCustomControls = function(v4, v5, v6, v7) --[[ Line: 13 ]] --[[ Name: addCustomControls ]]
    -- upvalues: l_append_0 (copy), v3 (copy)
    if v7 == nil or #v7 == 0 then
        return;
    else
        table.sort(v7, function(v8, v9) --[[ Line: 22 ]]
            if v8.Uri.PluginId == v9.Uri.PluginId then
                return v8.Uri.ItemId < v9.Uri.ItemId;
            else
                return v8.Uri.PluginId < v9.Uri.PluginId;
            end;
        end);
        local v10 = false;
        for _, v12 in v7 do
            if v12.PreferredToolbarUri.PluginId == v4.PluginId and v12.PreferredToolbarUri.DataModel == v4.DataModel and v12.PreferredToolbarUri.PluginType == v4.PluginType and v12.PreferredToolbarUri.ItemId == ("Tabs/%*"):format(v5) then
                v10 = true;
                l_append_0(v6, v12.Controls);
                table.insert(v6, v3);
            end;
        end;
        if v10 then
            table.remove(v6);
        end;
        return;
    end;
end;
return addCustomControls;