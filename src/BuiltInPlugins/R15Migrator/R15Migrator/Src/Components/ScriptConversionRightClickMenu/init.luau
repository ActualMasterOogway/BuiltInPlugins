local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Components.ConfirmRevertDialog);
local v3 = require(l_script_FirstAncestor_0.Src.Util.showDialog);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.selectionHasScriptBackups);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
local l_showContextMenu_0 = v1.UI.showContextMenu;
local v8 = {};
local function _(v9) --[[ Line: 17 ]] --[[ Name: oneScriptSelected ]]
    return v9.selectedScriptItems and #v9.selectedScriptItems == 1;
end;
local function _(v11) --[[ Line: 21 ]] --[[ Name: oneRangeSelected ]]
    return v11.selectedRangeItems and #v11.selectedRangeItems == 1;
end;
local function _(v13) --[[ Line: 25 ]] --[[ Name: noRangeSelected ]]
    return not v13.selectedRangeItems or #v13.selectedRangeItems == 0;
end;
local function _(v15) --[[ Line: 29 ]] --[[ Name: noScriptsSelected ]]
    return not v15.selectedScriptItems or #v15.selectedScriptItems == 0;
end;
v8.promptRevertScripts = function(_, v18) --[[ Line: 33 ]] --[[ Name: promptRevertScripts ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3(v18.Plugin, v18.Localization, v2, {
        OnConfirm = function() --[[ Line: 35 ]] --[[ Name: OnConfirm ]]
            -- upvalues: v18 (copy)
            v18.RevertScripts(v18.ScriptConversionContext, v18.Localization, v18.Analytics);
            v18.onScriptsReverted();
        end
    });
end;
v8.addGoToScriptItem = function(_, v20, v21) --[[ Line: 42 ]] --[[ Name: addGoToScriptItem ]]
    -- upvalues: v4 (copy)
    table.insert(v21, {
        Text = v20.Localization:getText("ScriptConversion", "GoToScript"), 
        OnItemClicked = function() --[[ Line: 45 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v20 (copy), v4 (ref)
            local l_v20_0 = v20;
            if l_v20_0.selectedRangeItems and #l_v20_0.selectedRangeItems == 1 then
                l_v20_0 = v20;
                if not l_v20_0.selectedScriptItems or #l_v20_0.selectedScriptItems == 0 then
                    local v23 = v20.selectedRangeItems[1];
                    v4.goToScript(v23.scriptId, v23.range, v20.ScriptConversionContext);
                    return;
                end;
            end;
            local v24 = v20.selectedScriptItems[1];
            v4.goToScript(v24.scriptId, nil, v20.ScriptConversionContext);
        end
    });
end;
v8.addSeparator = function(_, v26) --[[ Line: 61 ]] --[[ Name: addSeparator ]]
    table.insert(v26, {
        ShowSeparator = true
    });
end;
v8.addSuggestionItems = function(_, v28, v29) --[[ Line: 67 ]] --[[ Name: addSuggestionItems ]]
    local v30 = v28.selectedRangeItems[1];
    for _, v32 in v30.suggestions do
        table.insert(v29, {
            Text = v28.Localization:getText("ScriptConversion", "ReplaceWith", {
                part = v32
            }), 
            OnItemClicked = function() --[[ Line: 73 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v28 (copy), v30 (copy), v32 (copy)
                v28.ReplaceWithSuggestion(v30.scriptId, v30.range, v28.ScriptConversionContext, v32, v28.Localization, v30.instanceName, v28.Analytics);
                v28.onSuggestionApplied();
                v28.Analytics:getHandler("onScriptSuggestionApplied")();
            end
        });
    end;
end;
v8.addUndoRevertItem = function(_, v34, v35) --[[ Line: 90 ]] --[[ Name: addUndoRevertItem ]]
    table.insert(v35, {
        Text = v34.Localization:getText("ScriptConversion", "UndoRevert"), 
        OnItemClicked = function() --[[ Line: 93 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v34 (copy)
            v34.UndoRevert(v34.ScriptConversionContext, v34.Localization, v34.Analytics);
        end
    });
end;
v8.addRevertScriptItem = function(v36, v37, v38) --[[ Line: 99 ]] --[[ Name: addRevertScriptItem ]]
    local l_Localization_0 = v37.Localization;
    table.insert(v38, {
        Text = if v37.selectedScriptItems and #v37.selectedScriptItems == 1 then l_Localization_0:getText("ScriptConversion", "RevertScript") else l_Localization_0:getText("ScriptConversion", "RevertScripts"), 
        OnItemClicked = function() --[[ Line: 106 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v36 (copy), v37 (copy)
            v36:promptRevertScripts(v37);
        end
    });
end;
v8.addReplaceSelectedItem = function(_, v41, v42) --[[ Line: 112 ]] --[[ Name: addReplaceSelectedItem ]]
    table.insert(v42, {
        Text = v41.Localization:getText("ScriptConversion", "ReplaceWithRules"), 
        OnItemClicked = function() --[[ Line: 117 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v41 (copy)
            v41.ReplaceWithRules(v41.ScriptConversionContext, v41.Localization, v41.Analytics);
        end
    });
end;
v8.addDiffScriptItem = function(_, v44, v45) --[[ Line: 123 ]] --[[ Name: addDiffScriptItem ]]
    -- upvalues: v4 (copy)
    table.insert(v45, {
        Text = v44.Localization:getText("ScriptConversion", "DiffScripts"), 
        OnItemClicked = function() --[[ Line: 128 ]] --[[ Name: OnItemClicked ]]
            -- upvalues: v4 (ref), v44 (copy)
            v4.diffScripts(v44.selectedScriptItems, v44.ScriptConversionContext);
        end
    });
end;
local function _(v46) --[[ Line: 134 ]] --[[ Name: shouldShowSuggestions ]]
    if not (not v46.selectedScriptItems or #v46.selectedScriptItems == 0) then
        return false;
    elseif not (v46.selectedRangeItems and #v46.selectedRangeItems == 1) then
        return false;
    else
        local v47 = v46.selectedRangeItems[1];
        if not v47.suggestions or #v47.suggestions == 0 then
            return false;
        else
            return true;
        end;
    end;
end;
local function _(v49) --[[ Line: 151 ]] --[[ Name: shouldShowRevertItem ]]
    -- upvalues: v5 (copy)
    return v5(v49.selectedScriptItems, v49.ScriptConversionContext);
end;
local _ = function(v51) --[[ Line: 155 ]] --[[ Name: shouldShowUndoRevertItem ]]
    for _, v53 in v51.selectedScriptItems do
        if not v51.revertedScripts[v53.scriptId] then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v55) --[[ Line: 165 ]] --[[ Name: shouldShowReplaceSelected ]]
    for _, v57 in v55.selectedScriptItems do
        if v55.completedScripts[v57.scriptId] then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v59, _) --[[ Line: 175 ]] --[[ Name: shouldShowGoToScriptItem ]]
    if (not v59.selectedScriptItems or #v59.selectedScriptItems == 0) and v59.selectedRangeItems and #v59.selectedRangeItems == 1 or v59.selectedScriptItems and #v59.selectedScriptItems == 1 and (not v59.selectedRangeItems or #v59.selectedRangeItems == 0) then
        return true;
    else
        return false;
    end;
end;
local function v67(v62) --[[ Line: 186 ]] --[[ Name: shouldShowScriptDiffs ]]
    -- upvalues: v6 (copy)
    for _, v64 in v62.selectedScriptItems do
        local v65 = v62.ScriptConversionContext:getScriptInstanceFromGUID(v64.scriptId);
        local l_v6_ScriptBackupChunks_0 = v6:GetScriptBackupChunks(v65);
        if not l_v6_ScriptBackupChunks_0 then
            return false;
        elseif not v6:DidSourceChange(v65, l_v6_ScriptBackupChunks_0) then
            return false;
        end;
    end;
    return true;
end;
v8.show = function(v68, v69) --[[ Line: 200 ]] --[[ Name: show ]]
    -- upvalues: v5 (copy), v67 (copy), l_showContextMenu_0 (copy)
    local v70 = false;
    local v71 = false;
    local v72 = v69.Plugin:get();
    local _ = v69.Suggestions;
    local _ = v69.ScriptIds;
    local v75 = {};
    if ((not v69.selectedScriptItems or #v69.selectedScriptItems == 0) and v69.selectedRangeItems and #v69.selectedRangeItems == 1 or v69.selectedScriptItems and #v69.selectedScriptItems == 1 and (not v69.selectedRangeItems or #v69.selectedRangeItems == 0)) and true or false then
        v68:addGoToScriptItem(v69, v75);
    end;
    local v76;
    if not (not v69.selectedScriptItems or #v69.selectedScriptItems == 0) then
        v76 = false;
    elseif not (v69.selectedRangeItems and #v69.selectedRangeItems == 1) then
        v76 = false;
    else
        local v77 = v69.selectedRangeItems[1];
        v76 = if v77.suggestions then #v77.suggestions ~= 0 else false;
    end;
    if v76 then
        v68:addSeparator(v75);
        v68:addSuggestionItems(v69, v75);
    elseif not (not v69.selectedScriptItems or #v69.selectedScriptItems == 0) then
        for _, v79 in v69.selectedScriptItems do
            if not v69.revertedScripts[v79.scriptId] then
                v76 = false;
                v70 = true;
            end;
            if v70 then
                break;
            end;
        end;
        if not v70 then
            v76 = true;
        end;
        v70 = false;
        if v76 then
            v68:addSeparator(v75);
            v68:addUndoRevertItem(v69, v75);
        elseif v5(v69.selectedScriptItems, v69.ScriptConversionContext) then
            v68:addSeparator(v75);
            v68:addRevertScriptItem(v69, v75);
        end;
    end;
    for _, v81 in v69.selectedScriptItems do
        if v69.completedScripts[v81.scriptId] then
            v76 = false;
            v71 = true;
        end;
        if v71 then
            break;
        end;
    end;
    if not v71 then
        v76 = true;
    end;
    v71 = false;
    if v76 then
        v68:addSeparator(v75);
        v68:addReplaceSelectedItem(v69, v75);
    end;
    if v67(v69) then
        v68:addSeparator(v75);
        v68:addDiffScriptItem(v69, v75);
    end;
    l_showContextMenu_0(v72, v75);
end;
return v8;