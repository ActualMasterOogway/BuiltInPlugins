local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Components.SearchBox.Dropdown);
local v3 = require(l_script_FirstAncestor_0.Parent.Framework);
local v4 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local v5 = require(l_script_FirstAncestor_0.Parent.React);
local v6 = require(l_script_FirstAncestor_0.Components.Contexts.SettingsContext);
local l_createElement_0 = v5.createElement;
return function(v8) --[[ Line: 19 ]] --[[ Name: SettingsDropdown ]]
    -- upvalues: v5 (copy), v1 (copy), v3 (copy), v6 (copy), v4 (copy), l_createElement_0 (copy), v2 (copy)
    local v9 = v5.useContext(v1.AnalyticsContext);
    local v10 = v3.ContextServices.Localization:use();
    local v11 = v5.useContext(v6.Context);
    local v12, v13 = v5.useState(nil);
    local v17 = v5.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v12 (copy), v4 (ref)
        local v14 = {
            {
                displayText = v10:getText("SettingsDropdown", "SelectOnInsertion_v2"), 
                text = "SelectOnInsertion"
            }, 
            {
                displayText = v10:getText("SettingsDropdown", "IncrementNames_v2"), 
                text = "IncrementNames"
            }, 
            {
                displayText = v10:getText("SettingsDropdown", "ExpandHierarchy_v2"), 
                text = "ExpandHierarchy"
            }, 
            {
                displayText = v10:getText("SettingsDropdown", "ShowSelectionHierarchyHighlights"), 
                text = "ShowSelectionHierarchyHighlights"
            }
        };
        if v12 ~= nil then
            for _, v16 in v14 do
                if v12[v16.text] then
                    v16.icon = v4.standard("checkBox");
                    v16.keepIconColor = true;
                else
                    v16.icon = v4.standard("uncheckedBox");
                end;
            end;
        end;
        return v14;
    end, {
        v12, 
        v10
    });
    local v18 = v5.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v11 (copy)
        return {
            SelectOnInsertion = {
                getSettingAsync = v11.getSelectOnInsertionAsync, 
                setSetting = v11.setSelectOnInsertion
            }, 
            IncrementNames = {
                getSettingAsync = v11.getIncrementNamesAsync, 
                setSetting = v11.setIncrementNames
            }, 
            ExpandHierarchy = {
                getSettingAsync = v11.getExpandHierarchy, 
                setSetting = v11.setExpandHierarchy
            }, 
            ShowSelectionHierarchyHighlights = {
                getSettingAsync = v11.getShowSelectionHierarchyHighlights, 
                setSetting = v11.setShowSelectionHierarchyHighlights
            }
        };
    end, {
        v11
    });
    local v22 = v5.useCallback(function(v19) --[[ Line: 84 ]]
        -- upvalues: v12 (copy), v18 (copy), v13 (copy), v9 (copy)
        task.spawn(function() --[[ Line: 85 ]]
            -- upvalues: v12 (ref), v19 (copy), v18 (ref), v13 (ref), v9 (ref)
            local v20 = table.clone(v12);
            local v21 = not v12[v19];
            v20[v19] = v21;
            v18[v19].setSetting(v21);
            v13(v20);
            v9.logCounter({
                eventName = "LuaExplorerSettingsChanged", 
                backends = {
                    "RobloxTelemetryCounter"
                }, 
                throttlingPercentage = game:DefineFastInt("LuaExplorerSettingsChangedTelemetryThrottlingHundredthsPercent", 10000), 
                description = "Fired when a settings item is changed", 
                lastUpdated = "2024-12-03"
            }, {
                enabled = v21, 
                setting = v19
            });
        end);
    end, {
        v18, 
        v12, 
        v9.logCounter
    });
    v5.useEffect(function() --[[ Line: 110 ]]
        -- upvalues: v17 (copy), v18 (copy), v13 (copy)
        task.spawn(function() --[[ Line: 111 ]]
            -- upvalues: v17 (ref), v18 (ref), v13 (ref)
            local v23 = {};
            for _, v25 in v17 do
                v23[v25.text] = v18[v25.text].getSettingAsync();
            end;
            v13(v23);
        end);
    end, {});
    local v26 = false;
    if v12 ~= nil then
        v26 = l_createElement_0(v2, {
            dropdownRef = v8.dropdownRef, 
            itemData = v17, 
            onItemClicked = v22, 
            shouldIgnoreMaxHeight = true
        });
    end;
    return v26;
end;