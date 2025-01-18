local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuActionList);
local _ = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuTypes);
local v4 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.React);
local v7 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.createContextMenuActionWatcher);
local v8 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v9 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.usePluginActions);
local l_Localization_0 = v5.ContextServices.Localization;
local l_createElement_0 = v6.createElement;
local v12 = {};
local v13 = 0;
local function _() --[[ Line: 29 ]] --[[ Name: nextOrder ]]
    -- upvalues: v13 (ref)
    v13 = v13 + 1;
    return v13;
end;
local function v15(v16, v17) --[[ Line: 34 ]] --[[ Name: unpackMenu ]]
    -- upvalues: v13 (ref), v12 (copy), v15 (copy)
    for _, v19 in v16 do
        v13 = v13 + 1;
        local l_v13_0 = v13;
        for _, v22 in v19 do
            local l_v12_0 = v12;
            local l_key_0 = v22.key;
            local v25 = {
                item = v22, 
                categoryIndex = l_v13_0, 
                submenusInside = v17
            };
            v13 = v13 + 1;
            v25.index = v13;
            l_v12_0[l_key_0] = v25;
            if v22.source.type == "submenu" then
                l_v12_0 = table.clone(v17);
                table.insert(l_v12_0, v22.key);
                v15(v22.source.submenuCategories, l_v12_0);
            end;
        end;
    end;
end;
v15(v2, {});
local function v35(v26) --[[ Line: 57 ]] --[[ Name: cleanHoles ]]
    local v27 = {};
    for v28, v29 in v26 do
        assert(v29 ~= nil, "Luau: Generalized iteration over T? can't give nil");
        table.insert(v27, {
            index = v28, 
            value = v29
        });
    end;
    table.sort(v27, function(v30, v31) --[[ Line: 67 ]]
        return v30.index < v31.index;
    end);
    local v32 = {};
    for _, v34 in v27 do
        table.insert(v32, v34.value);
    end;
    return v32;
end;
local function v54(v36, v37) --[[ Line: 94 ]] --[[ Name: actionKeysToStudioActionStates ]]
    -- upvalues: v12 (copy), v8 (copy)
    local v38 = {};
    local function v49(v39, v40) --[[ Line: 100 ]] --[[ Name: getCategory ]]
        -- upvalues: v38 (copy), v12 (ref)
        local l_v38_0 = v38;
        for _, v43 in v39 do
            local v44 = v12[v43];
            local v45 = l_v38_0[v44.categoryIndex];
            if v45 == nil then
                v45 = {};
                l_v38_0[v44.categoryIndex] = v45;
            end;
            assert(v45 ~= nil, "Luau");
            local v46 = v45[v44.index];
            if v46 == nil then
                v46 = {
                    key = v43, 
                    type = "submenu", 
                    items = {}
                };
                v45[v44.index] = v46;
            end;
            assert(v46 ~= nil, "Luau");
            assert(v46.type == "submenu", "Found submenu is not a submenu");
            l_v38_0 = v46.items;
        end;
        local v47 = l_v38_0[v40];
        if v47 == nil then
            local v48 = {};
            l_v38_0[v40] = v48;
            return v48;
        else
            return v47;
        end;
    end;
    for v50 in v36 do
        local v51 = v12[v50];
        if v51 == nil then
            error((("Couldn't find action that Studio gave: %*"):format(v50)));
        end;
        local v52 = v49(v51.submenusInside, v51.categoryIndex);
        if v51.item.source.type == "studioAction" then
            local v53 = v37.getStudioActionState(v51.item.source.uri);
            v52[v51.index] = {
                type = "action", 
                action = {
                    key = v50, 
                    state = v53
                }
            };
        elseif v51.item.source.type == "submenu" then
            error((("Submenu is being sent as something that is enabled, but this should just be real actions: %*"):format(v50)));
        else
            v8(v51.item.source.type);
        end;
    end;
    return v38;
end;
return function(v55) --[[ Line: 169 ]] --[[ Name: StudioContextMenuContextProvider ]]
    -- upvalues: v5 (copy), l_Localization_0 (copy), v6 (copy), v7 (copy), v4 (copy), v9 (copy), l_HttpService_0 (copy), v35 (copy), v54 (copy), l_createElement_0 (copy)
    local v56 = v5.ContextServices.Plugin:use():get();
    local v57 = l_Localization_0:use();
    local v58 = v6.useState(function() --[[ Line: 175 ]]
        -- upvalues: v7 (ref), v56 (copy)
        return v7(v56);
    end);
    v6.useEffect(function() --[[ Line: 179 ]]
        -- upvalues: v58 (copy)
        return function() --[[ Line: 180 ]]
            -- upvalues: v58 (ref)
            v58.destroy();
        end;
    end, {
        v58
    });
    local v59 = v6.useState(v4.Signal.new);
    local v60 = v9(v59);
    local v78 = v6.useCallback(function(v61) --[[ Line: 188 ]]
        -- upvalues: v56 (copy), l_HttpService_0 (ref), v35 (ref), v57 (copy), v60 (copy), v54 (ref), v58 (copy)
        task.spawn(function() --[[ Line: 189 ]]
            -- upvalues: v56 (ref), l_HttpService_0 (ref), v35 (ref), v57 (ref), v60 (ref), v54 (ref), v61 (copy), v58 (ref)
            local v62 = {};
            local function v63(v64) --[[ Line: 192 ]] --[[ Name: createPluginMenu ]]
                -- upvalues: v56 (ref), l_HttpService_0 (ref), v35 (ref), v63 (copy), v57 (ref), v60 (ref), v62 (copy)
                local l_v56_PluginMenu_0 = v56:CreatePluginMenu("Explorer_" .. l_HttpService_0:GenerateGUID());
                local v66 = v35(v64);
                for v67, v68 in v66 do
                    for _, v70 in (v35(v68)) do
                        if v70.type == "submenu" then
                            local v71 = v63(v70.items);
                            v71.Title = v57:getText("ContextMenu", v70.key);
                            l_v56_PluginMenu_0:AddMenu(v71);
                        elseif v70.type == "action" then
                            local v72 = v60[v70.action.key];
                            assert(v72 ~= nil, "Couldn't find plugin action");
                            v72.Text = v70.action.state.Text;
                            local v73 = v70.action.state.Shortcuts[1];
                            if v73 == nil then
                                v72.DefaultShortcut = "";
                            else
                                v72.DefaultShortcut = v73;
                                v72.Text = v72.Text .. "     ";
                            end;
                            l_v56_PluginMenu_0:AddAction(v72);
                        end;
                    end;
                    if v67 ~= #v66 then
                        l_v56_PluginMenu_0:AddSeparator();
                    end;
                end;
                table.insert(v62, l_v56_PluginMenu_0);
                return l_v56_PluginMenu_0;
            end;
            v63((v54(v61, v58))):ShowAsync();
            for _, v75 in v60 do
                assert(v75 ~= nil, "Luau");
                v75.DefaultShortcut = "";
            end;
            for _, v77 in v62 do
                v77:Destroy();
            end;
        end);
    end, {
        v57, 
        v60
    });
    return l_createElement_0(v4.Components.Contexts.ContextMenuContextProvider, {
        showContextMenu = v78, 
        actionTriggeredSignal = v59
    }, v55.children);
end;