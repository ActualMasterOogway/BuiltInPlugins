local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagExplorerIncrementNames);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagExplorerInsertObjectSettings);
local l_createElement_0 = v3.createElement;
return function(v7) --[[ Line: 15 ]] --[[ Name: StudioSettingsContextProvider ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), l_createElement_0 (copy), v1 (copy), v4 (copy)
    local v8 = v2.ContextServices.Plugin:use():get();
    local v9 = nil;
    if v5() then
        v9 = v8:GetPluginComponent("InsertObjectSettings");
    end;
    local v10 = v3.useRef({});
    local function _(v11) --[[ Line: 26 ]] --[[ Name: getSetting ]]
        -- upvalues: v10 (copy), v8 (copy)
        local v12 = v10.current[v11];
        if v12 ~= nil then
            return v12.value;
        else
            local l_v8_Setting_0 = v8:GetSetting(v11);
            v10.current[v11] = {
                value = l_v8_Setting_0
            };
            return l_v8_Setting_0;
        end;
    end;
    local function v18(v15, v16) --[[ Line: 38 ]] --[[ Name: setSetting ]]
        -- upvalues: v10 (copy), v8 (copy)
        local v17 = v10.current[v15];
        if v17 then
            if v17.value ~= v16 then
                v8:SetSetting(v15, v16);
                v17.value = v16;
                return;
            end;
        else
            v8:SetSetting(v15, v16);
            v10.current[v15] = {
                value = v16
            };
        end;
    end;
    return l_createElement_0(v1.Components.Contexts.SettingsContextProvider, {
        rememberedFields = {}, 
        addField = function() --[[ Line: 54 ]] --[[ Name: addField ]]

        end, 
        removeField = function() --[[ Line: 55 ]] --[[ Name: removeField ]]

        end, 
        getSearchHistory = function(v19) --[[ Line: 57 ]] --[[ Name: getSearchHistory ]]
            -- upvalues: v10 (copy), v8 (copy)
            local v20 = "ExplorerPluginSearchHistory" .. v19;
            local v21 = v10.current[v20];
            local v22;
            if v21 ~= nil then
                v22 = v21.value;
            else
                local l_v8_Setting_1 = v8:GetSetting(v20);
                v10.current[v20] = {
                    value = l_v8_Setting_1
                };
                v22 = l_v8_Setting_1;
            end;
            if not v22 then
                v22 = {};
            end;
            return v22;
        end, 
        saveSearchHistory = function(v24, v25) --[[ Line: 61 ]] --[[ Name: saveSearchHistory ]]
            -- upvalues: v18 (copy)
            v18("ExplorerPluginSearchHistory" .. v24, v25);
        end, 
        getSelectOnInsertionAsync = function() --[[ Line: 65 ]] --[[ Name: getSelectOnInsertionAsync ]]
            -- upvalues: v5 (ref), v9 (ref)
            if not v5() then
                return false;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
                    -- upvalues: v9 (ref)
                    return v9:GetSelectOnInsertionAsync();
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return false;
                end;
            end;
        end, 
        setSelectOnInsertion = function(v28) --[[ Line: 81 ]] --[[ Name: setSelectOnInsertion ]]
            -- upvalues: v5 (ref), v9 (ref)
            if not v5() then
                return;
            else
                task.spawn(function() --[[ Line: 86 ]]
                    -- upvalues: v9 (ref), v28 (copy)
                    v9:SetSelectOnInsertionAsync(v28);
                end);
                return;
            end;
        end, 
        getIncrementNamesAsync = function() --[[ Line: 91 ]] --[[ Name: getIncrementNamesAsync ]]
            -- upvalues: v5 (ref), v4 (ref), v9 (ref)
            if not v5() or not v4() then
                return false;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 96 ]]
                    -- upvalues: v9 (ref)
                    return v9:GetIncrementNamesAsync();
                end);
                if l_status_1 then
                    return l_result_1;
                else
                    return false;
                end;
            end;
        end, 
        setIncrementNames = function(v31) --[[ Line: 107 ]] --[[ Name: setIncrementNames ]]
            -- upvalues: v5 (ref), v4 (ref), v9 (ref)
            if not v5() or not v4() then
                return;
            else
                task.spawn(function() --[[ Line: 112 ]]
                    -- upvalues: v9 (ref), v31 (copy)
                    v9:SetIncrementNamesAsync(v31);
                end);
                return;
            end;
        end, 
        getExpandHierarchy = function() --[[ Line: 117 ]] --[[ Name: getExpandHierarchy ]]
            -- upvalues: v10 (copy), v8 (copy)
            local l_ExplorerPluginExpandHierarchy_0 = v10.current.ExplorerPluginExpandHierarchy;
            local v33;
            if l_ExplorerPluginExpandHierarchy_0 ~= nil then
                v33 = l_ExplorerPluginExpandHierarchy_0.value;
            else
                local l_v8_Setting_2 = v8:GetSetting("ExplorerPluginExpandHierarchy");
                v10.current.ExplorerPluginExpandHierarchy = {
                    value = l_v8_Setting_2
                };
                v33 = l_v8_Setting_2;
            end;
            l_ExplorerPluginExpandHierarchy_0 = true;
            if v33 ~= nil then
                l_ExplorerPluginExpandHierarchy_0 = v33;
            end;
            return l_ExplorerPluginExpandHierarchy_0;
        end, 
        setExpandHierarchy = function(v35) --[[ Line: 122 ]] --[[ Name: setExpandHierarchy ]]
            -- upvalues: v18 (copy)
            v18("ExplorerPluginExpandHierarchy", v35);
        end, 
        getShowSelectionHierarchyHighlights = function() --[[ Line: 126 ]] --[[ Name: getShowSelectionHierarchyHighlights ]]
            -- upvalues: v10 (copy), v8 (copy)
            local l_ExplorerPluginShowSelectionHierarchyHighlights_0 = v10.current.ExplorerPluginShowSelectionHierarchyHighlights;
            local v37;
            if l_ExplorerPluginShowSelectionHierarchyHighlights_0 ~= nil then
                v37 = l_ExplorerPluginShowSelectionHierarchyHighlights_0.value;
            else
                local l_v8_Setting_3 = v8:GetSetting("ExplorerPluginShowSelectionHierarchyHighlights");
                v10.current.ExplorerPluginShowSelectionHierarchyHighlights = {
                    value = l_v8_Setting_3
                };
                v37 = l_v8_Setting_3;
            end;
            l_ExplorerPluginShowSelectionHierarchyHighlights_0 = true;
            if v37 ~= nil then
                l_ExplorerPluginShowSelectionHierarchyHighlights_0 = v37;
            end;
            return l_ExplorerPluginShowSelectionHierarchyHighlights_0;
        end, 
        setShowSelectionHierarchyHighlights = function(v39) --[[ Line: 131 ]] --[[ Name: setShowSelectionHierarchyHighlights ]]
            -- upvalues: v18 (copy)
            v18("ExplorerPluginShowSelectionHierarchyHighlights", v39);
        end
    }, v7.children);
end;