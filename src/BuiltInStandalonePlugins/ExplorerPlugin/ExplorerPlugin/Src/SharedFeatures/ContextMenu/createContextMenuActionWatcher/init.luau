local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuActionList);
local _ = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuTypes);
local v3 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
return function(v4) --[[ Line: 12 ]] --[[ Name: createContextMenuActionWatcher ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_v4_PluginComponent_0 = v4:GetPluginComponent("Actions");
    local v6 = {};
    local v7 = {};
    local v23 = task.spawn(function() --[[ Line: 18 ]]
        -- upvalues: v7 (copy), l_v4_PluginComponent_0 (copy), v6 (copy), v3 (ref), v1 (ref)
        local v8 = {};
        local function v9(v10) --[[ Line: 21 ]] --[[ Name: watchItem ]]
            -- upvalues: v8 (copy), v7 (ref), l_v4_PluginComponent_0 (ref), v6 (ref), v9 (copy), v3 (ref)
            if v10.source.type == "studioAction" then
                table.insert(v8, v10.source.uri);
                task.spawn(function() --[[ Line: 25 ]]
                    -- upvalues: v7 (ref), l_v4_PluginComponent_0 (ref), v10 (copy), v6 (ref)
                    table.insert(v7, l_v4_PluginComponent_0:BindToChangedAsync(v10.source.uri):Connect(function(v11) --[[ Line: 28 ]]
                        -- upvalues: v6 (ref), v10 (ref)
                        v6[v10.source.uri] = v11;
                    end));
                end);
                return;
            elseif v10.source.type == "submenu" then
                for _, v13 in v10.source.submenuCategories do
                    for _, v15 in v13 do
                        v9(v15);
                    end;
                end;
                return;
            else
                v3(v10.source.type);
                return;
            end;
        end;
        for _, v17 in v1 do
            for _, v19 in v17 do
                v9(v19);
            end;
        end;
        local l_l_v4_PluginComponent_0_Async_0 = l_v4_PluginComponent_0:GetAsync(v8);
        for v21, v22 in v8 do
            if v6[v22] == nil then
                v6[v22] = l_l_v4_PluginComponent_0_Async_0[v21];
            end;
        end;
    end);
    return {
        getStudioActionState = function(v24) --[[ Line: 58 ]] --[[ Name: getStudioActionState ]]
            -- upvalues: v6 (copy)
            local v25 = v6[v24];
            assert(v25 ~= nil, "state is nil. Either GetAsync is remarkably slow, or you are not passing in the same StudioUri that is in ContextMenuActionList.");
            return v25;
        end, 
        destroy = function() --[[ Line: 67 ]] --[[ Name: destroy ]]
            -- upvalues: v23 (copy), v7 (copy)
            task.cancel(v23);
            for _, v27 in v7 do
                v27:Disconnect();
            end;
        end
    };
end;