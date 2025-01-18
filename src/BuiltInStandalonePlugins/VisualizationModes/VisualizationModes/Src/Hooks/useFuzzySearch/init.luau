local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Fzy);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginSetting);
return function(v4) --[[ Line: 26 ]] --[[ Name: useFuzzySearch ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = v2.createConfig({
        caseSensitive = false
    });
    local v6 = v2.getScoreFloor(v5);
    local v7, v8 = v3(v4.SettingsKey, "");
    local function v12(v9) --[[ Line: 34 ]] --[[ Name: includeEntry ]]
        -- upvalues: v7 (copy), v2 (ref), v5 (copy), v6 (copy)
        if v7 == "" then
            return true, nil;
        else
            local v10, v11 = v2.positions(v5, v7, v9);
            if v6 < v11 then
                return true, v10;
            else
                return false, nil;
            end;
        end;
    end;
    local v13 = 0;
    local v14 = 0;
    local function v15() --[[ Line: 50 ]] --[[ Name: getFilteredCount ]]
        -- upvalues: v13 (ref)
        return v13;
    end;
    local function v16() --[[ Line: 54 ]] --[[ Name: incrementFilteredCount ]]
        -- upvalues: v13 (ref)
        v13 = v13 + 1;
    end;
    local function v17() --[[ Line: 58 ]] --[[ Name: incrementEntryCount ]]
        -- upvalues: v14 (ref)
        v14 = v14 + 1;
    end;
    local function v18() --[[ Line: 62 ]] --[[ Name: getAreAllEntriesHidden ]]
        -- upvalues: v13 (ref), v14 (ref)
        return v14 <= v13;
    end;
    return table.freeze({
        searchText = v7, 
        setSearchText = v8, 
        includeEntry = v12, 
        getFilteredCount = v15, 
        incrementFilteredCount = v16, 
        incrementEntryCount = v17, 
        getAreAllEntriesHidden = v18
    });
end;