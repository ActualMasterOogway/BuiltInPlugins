local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuActionList);
local _ = require(l_script_FirstAncestor_0.Packages.Explorer);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local function v7(v8, v9, v10, v11) --[[ Line: 11 ]] --[[ Name: collectActions ]]
    -- upvalues: v7 (copy), l_HttpService_0 (copy), v6 (copy)
    for _, v13 in v10 do
        for _, v15 in v13 do
            if v15.source.type == "submenu" then
                v7(v8, v9, v15.source.submenuCategories, v11);
            elseif v15.source.type == "studioAction" then
                local l_v8_PluginAction_0 = v8:CreatePluginAction(("Explorer_%*_%*"):format(v15.key, (l_HttpService_0:GenerateGUID())), "TBD: Name", "", nil, false);
                l_v8_PluginAction_0.Triggered:Connect(function() --[[ Line: 30 ]]
                    -- upvalues: v9 (copy), v15 (copy)
                    v9:Fire(v15.key);
                end);
                v11[v15.key] = l_v8_PluginAction_0;
            else
                v6(v15.source.type);
            end;
        end;
    end;
end;
return function(v17) --[[ Line: 42 ]] --[[ Name: usePluginActions ]]
    -- upvalues: v4 (copy), v5 (copy), v7 (copy), v2 (copy)
    local v18 = v4.ContextServices.Plugin:use():get();
    return (v5.useState(function() --[[ Line: 45 ]]
        -- upvalues: v7 (ref), v18 (copy), v17 (copy), v2 (ref)
        local v19 = {};
        task.spawn(function() --[[ Line: 47 ]]
            -- upvalues: v7 (ref), v18 (ref), v17 (ref), v2 (ref), v19 (copy)
            local v20 = false;
            task.defer(function() --[[ Line: 49 ]]
                -- upvalues: v20 (ref)
                v20 = true;
            end);
            v7(v18, v17, v2, v19);
            if v20 then
                warn("collectActions yielded, which shouldn't be possible but is what I think is breaking");
            end;
        end);
        return v19;
    end));
end;