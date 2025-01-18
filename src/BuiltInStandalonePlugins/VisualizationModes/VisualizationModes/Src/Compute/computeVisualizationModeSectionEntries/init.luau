local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModeEntry);
local _ = require(l_script_FirstAncestor_0.Src.Hooks.useFuzzySearch);
local l_ContextServices_0 = v2.ContextServices;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
return function(v8) --[[ Line: 23 ]] --[[ Name: computeVisualizationModeSectionEntries ]]
    -- upvalues: l_ContextServices_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v4 (copy)
    local v9 = l_ContextServices_0.Analytics:use();
    local v10 = l_LayoutOrderIterator_0.new();
    local v11 = {};
    local v12 = 0;
    local v13 = 0;
    local v14 = 0;
    local v15 = 0;
    local v16 = 0;
    local function v18(v17) --[[ Line: 34 ]] --[[ Name: addCustomEntry ]]
        -- upvalues: v13 (ref), v12 (ref), v8 (copy), v11 (copy)
        v13 = v13 + 1;
        v12 = v12 + 1;
        v8.FuzzySearch.incrementEntryCount();
        table.insert(v11, v17);
    end;
    local function v20(v19) --[[ Line: 41 ]] --[[ Name: addEntry ]]
        -- upvalues: v13 (ref), v8 (copy), v12 (ref), v11 (copy), v3 (ref), v4 (ref)
        v13 = v13 + 1;
        v8.FuzzySearch.incrementEntryCount();
        if v19.Visible ~= false then
            v12 = v12 + 1;
        end;
        table.insert(v11, v3.createElement(v4, v19));
    end;
    local function v26(v21, v22) --[[ Line: 52 ]] --[[ Name: addVisualizationModeEntry ]]
        -- upvalues: v14 (ref), v8 (copy), v15 (ref), v16 (ref), v10 (copy), v9 (copy), v13 (ref), v12 (ref), v11 (copy), v3 (ref), v4 (ref)
        v14 = v14 + 1;
        local v23, v24 = v8.FuzzySearch.includeEntry(v22.title);
        if v8.ForceVisible then
            v23 = true;
        end;
        if v24 ~= nil then
            v15 = v15 + 1;
        end;
        if not v23 then
            v8.FuzzySearch.incrementFilteredCount();
        end;
        if v22.enabled then
            v16 = v16 + 1;
        end;
        local v25 = {
            key = v22.name, 
            Text = v22.title, 
            Visible = v23, 
            ToolTip = v22.toolTip, 
            Enabled = v22.enabled, 
            LayoutOrder = v10:getNextOrder(), 
            MatchIndexes = v24, 
            IsEditingEnabled = true, 
            OnToggle = function() --[[ Line: 84 ]] --[[ Name: OnToggle ]]
                -- upvalues: v9 (ref), v21 (copy), v22 (copy), v8 (ref)
                v9:report("visualizationModeToggled", {
                    actionSource = "button", 
                    visualizationModeCategory = v21.name, 
                    visualizationMode = v22.name, 
                    isEnabled = not v22.enabled
                });
                v8.OnVisualizationModeToggle(v21.name, v22.name, not v22.enabled, true);
            end
        };
        v13 = v13 + 1;
        v8.FuzzySearch.incrementEntryCount();
        if v25.Visible ~= false then
            v12 = v12 + 1;
        end;
        table.insert(v11, v3.createElement(v4, v25));
    end;
    local function v27() --[[ Line: 106 ]] --[[ Name: renderEntries ]]
        -- upvalues: v11 (copy)
        return v11;
    end;
    local function v28() --[[ Line: 110 ]] --[[ Name: hasVisibleEntries ]]
        -- upvalues: v12 (ref)
        return v12 > 0;
    end;
    local function v29() --[[ Line: 114 ]] --[[ Name: getEntryMatchCount ]]
        -- upvalues: v15 (ref)
        return v15;
    end;
    local function v30() --[[ Line: 118 ]] --[[ Name: getEntryCount ]]
        -- upvalues: v13 (ref)
        return v13;
    end;
    local function v31() --[[ Line: 122 ]] --[[ Name: getVisualizationModeEntryCount ]]
        -- upvalues: v14 (ref)
        return v14;
    end;
    local function v32() --[[ Line: 126 ]] --[[ Name: getEnabledCount ]]
        -- upvalues: v16 (ref)
        return v16;
    end;
    return {
        addEntry = v20, 
        addCustomEntry = v18, 
        addVisualizationModeEntry = v26, 
        renderEntries = v27, 
        hasVisibleEntries = v28, 
        getEntryCount = v30, 
        getVisualizationModeEntryCount = v31, 
        getEntryMatchCount = v29, 
        getEnabledCount = v32
    };
end;