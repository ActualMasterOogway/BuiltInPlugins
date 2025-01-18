local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v7 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v8 (copy)
    return (setmetatable({
        _ctrlDown = false, 
        _shiftDown = false, 
        _selected = {}, 
        _expanded = {}, 
        _onSelectedChanged = l_Signal_0.new(), 
        _onExpandedChanged = l_Signal_0.new()
    }, v8));
end;
v8.connectToExpandedChanged = function(v9, v10) --[[ Line: 29 ]] --[[ Name: connectToExpandedChanged ]]
    v9._onExpandedChanged:Connect(v10);
end;
v8.connectToSelectedChanged = function(v11, v12) --[[ Line: 33 ]] --[[ Name: connectToSelectedChanged ]]
    v11._onSelectedChanged:Connect(v12);
end;
v8.onKeyPressed = function(v13, v14) --[[ Line: 37 ]] --[[ Name: onKeyPressed ]]
    -- upvalues: v4 (copy)
    if v4:isShift(v14.KeyCode) then
        v13._shiftDown = true;
    elseif v4:isControl(v14.KeyCode) then
        v13._ctrlDown = true;
    end;
    if v13._ctrlDown and v13._shiftDown and v4:isLetterA(v14.KeyCode) then
        v13:selectAll(false);
    end;
end;
v8.onKeyReleased = function(v15, v16) --[[ Line: 48 ]] --[[ Name: onKeyReleased ]]
    -- upvalues: v4 (copy)
    if v4:isShift(v16.KeyCode) then
        v15._shiftDown = false;
        return;
    else
        if v4:isControl(v16.KeyCode) then
            v15._ctrlDown = false;
        end;
        return;
    end;
end;
v8.getItems = function(v17) --[[ Line: 56 ]] --[[ Name: getItems ]]
    return v17._items;
end;
v8.terminate = function(v18) --[[ Line: 60 ]] --[[ Name: terminate ]]
    v18._items = nil;
    v18._expanded = {};
    v18._selected = {};
    v18._previousSelected = nil;
    v18._shiftDown = false;
    v18._ctrlDown = false;
end;
v8.buildDiagnosticListForScript = function(_, v20, v21, _, v23) --[[ Line: 69 ]] --[[ Name: buildDiagnosticListForScript ]]
    -- upvalues: v5 (copy)
    local v24 = {};
    for v25, v26 in v21 do
        if not v23 or v23 == v26.instanceName then
            table.insert(v24, {
                key = v20 .. "." .. v25, 
                codeText = v26.code, 
                text = v26.message, 
                instanceName = v26.instanceName, 
                range = v26.range, 
                url = if v26.codeDescription then v26.codeDescription.href else "", 
                scriptId = v20, 
                suggestions = v26.suggestions, 
                statuses = if v26.severity == Enum.Severity.Warning then {
                    [v5.ScriptStatus.Warning] = 1
                } else {
                    [v5.ScriptStatus.Error] = 1
                }, 
                issueType = v26.issueType
            });
        end;
    end;
    return v24;
end;
v8.addScriptListItem = function(v27, v28, v29, v30, v31, v32, v33, v34, v35) --[[ Line: 93 ]] --[[ Name: addScriptListItem ]]
    -- upvalues: v7 (copy), v5 (copy)
    local v36 = v31:getScriptInstanceFromGUID(v30);
    local v37 = v7(v36:GetFullName());
    local v38 = if v29 then v27:buildDiagnosticListForScript(v30, v29:Get(), v31, v35) else nil;
    local v39 = {};
    if v32 then
        if v29 and v29:HasWarnings() then
            v39[v5.ScriptStatus.Warning] = v29:WarningCount();
        else
            v39[v5.ScriptStatus.Complete] = 1;
        end;
    else
        if v33 then
            v39[v5.ScriptStatus.Reverted] = 1;
        end;
        v39[v5.ScriptStatus.Error] = v29:ErrorCount(v35);
        v39[v5.ScriptStatus.Warning] = v29:WarningCount(v35);
    end;
    if not v35 or v35 and #v38 > 0 then
        table.insert(v28, {
            key = v30, 
            text = v37, 
            scriptId = v30, 
            children = v38, 
            initialIssueCount = v34, 
            statuses = v39
        });
    end;
end;
v8.buildTreeItems = function(v40, v41) --[[ Line: 137 ]] --[[ Name: buildTreeItems ]]
    v40._items = {};
    local l_diagnostics_0 = v41.diagnostics;
    local l_revertedScripts_0 = v41.revertedScripts;
    local l_completedScripts_0 = v41.completedScripts;
    local l_initialIssueCounts_0 = v41.initialIssueCounts;
    local l_filter_0 = v41.filter;
    local l_ScriptConversionContext_0 = v41.ScriptConversionContext;
    for v48, v49 in l_diagnostics_0 do
        v40:addScriptListItem(v40._items, v49, v48, l_ScriptConversionContext_0, l_completedScripts_0[v48], l_revertedScripts_0[v48], l_initialIssueCounts_0[v48], l_filter_0);
    end;
    table.sort(v40._items, function(v50, v51) --[[ Line: 160 ]]
        -- upvalues: l_ScriptConversionContext_0 (copy)
        if v50.scriptId and v51.scriptId then
            local v52 = l_ScriptConversionContext_0:getScriptInstanceFromGUID(v50.scriptId);
            local v53 = l_ScriptConversionContext_0:getScriptInstanceFromGUID(v51.scriptId);
            if v52:GetFullName() == v53:GetFullName() then
                return v50.scriptId < v51.scriptId;
            else
                return v52:GetFullName() < v53:GetFullName();
            end;
        else
            return false;
        end;
    end);
end;
v8.flattenItems = function(v54, v55) --[[ Line: 174 ]] --[[ Name: flattenItems ]]
    if not v54._items then
        return {};
    else
        local v56 = {};
        for _, v58 in v54._items do
            table.insert(v56, v58);
            if v55 or v54._expanded[v58.key] then
                for _, v60 in v58.children do
                    table.insert(v56, v60);
                    if (v55 or v54._expanded[v60.key]) and v60.children then
                        for _, v62 in v60.children do
                            table.insert(v56, v62);
                        end;
                    end;
                end;
            end;
        end;
        return v56;
    end;
end;
v8.getExpansionTable = function(v63) --[[ Line: 201 ]] --[[ Name: getExpansionTable ]]
    local v64 = {};
    for _, v66 in v63._items do
        if v63._expanded[v66.key] then
            v64[v66] = true;
        end;
    end;
    return v64;
end;
v8.getSelectionList = function(v67) --[[ Line: 211 ]] --[[ Name: getSelectionList ]]
    local v68 = {};
    for _, v70 in v67._items do
        if v67._selected[v70.key] then
            table.insert(v68, v70);
        end;
        for _, v72 in v70.children do
            if v67._selected[v72.key] then
                table.insert(v68, v72);
            end;
        end;
    end;
    return v68;
end;
v8.toggleExpanded = function(v73, v74) --[[ Line: 226 ]] --[[ Name: toggleExpanded ]]
    v73._expanded[v74.key] = not v73._expanded[v74.key];
    v73._onExpandedChanged:Fire();
end;
v8.resetSelected = function(v75) --[[ Line: 231 ]] --[[ Name: resetSelected ]]
    v75._selected = {};
    v75._onSelectedChanged:Fire();
end;
v8.findCurrentAndPreviousSelectionIndex = function(v76, v77, v78) --[[ Line: 236 ]] --[[ Name: findCurrentAndPreviousSelectionIndex ]]
    local v79 = nil;
    local v80 = nil;
    for v81, v82 in v77 do
        if v82.key == v78.key then
            v79 = v81;
            if v80 then
                break;
            end;
        end;
        if v82.key == v76._previousSelected then
            v80 = v81;
            if v79 then
                break;
            end;
        end;
    end;
    return v79, v80;
end;
v8.areAllSelected = function(v83, v84) --[[ Line: 256 ]] --[[ Name: areAllSelected ]]
    for _, v86 in (v83:flattenItems(v84)) do
        if not v83._selected[v86.key] then
            return false;
        end;
    end;
    return true;
end;
v8.selectAll = function(v87, v88) --[[ Line: 266 ]] --[[ Name: selectAll ]]
    for _, v90 in (v87:flattenItems(v88)) do
        v87._selected[v90.key] = true;
    end;
    v87._previousSelected = nil;
    v87._onSelectedChanged:Fire();
end;
v8.shiftSelectItem = function(v91, v92) --[[ Line: 276 ]] --[[ Name: shiftSelectItem ]]
    local v93 = v91:flattenItems(false);
    local v94, v95 = v91:findCurrentAndPreviousSelectionIndex(v93, v92);
    if not v94 then
        return;
    elseif not v95 then
        v91._selected = {
            [v92.key] = true
        };
        return;
    else
        for v96 = math.min(v94, v95), math.max(v94, v95) do
            v91._selected[v93[v96].key] = true;
        end;
        return;
    end;
end;
v8.toggleSelectItem = function(v97, v98) --[[ Line: 297 ]] --[[ Name: toggleSelectItem ]]
    v97._selected[v98.key] = not v97._selected[v98.key];
    if v98.children then
        for _, v100 in v98.children do
            v97._selected[v100.key] = v97._selected[v98.key];
        end;
    end;
end;
v8.hasMultiSelection = function(v101) --[[ Line: 306 ]] --[[ Name: hasMultiSelection ]]
    local v102 = 1;
    for _ in v101._selected do
        if v102 > 1 then
            return true;
        else
            v102 = v102 + 1;
        end;
    end;
    return false;
end;
v8.plainSelectItem = function(v104, v105, v106) --[[ Line: 318 ]] --[[ Name: plainSelectItem ]]
    if v104._selected[v105.key] and v106 then
        return;
    else
        if not v104._selected[v105.key] or v104:hasMultiSelection() then
            v104._selected = {
                [v105.key] = true
            };
        end;
        return;
    end;
end;
v8.itemIsSelected = function(v107, v108) --[[ Line: 330 ]] --[[ Name: itemIsSelected ]]
    return v107._selected[v108.key] == true;
end;
v8.onItemDoubleClicked = function(_, v110, v111) --[[ Line: 334 ]] --[[ Name: onItemDoubleClicked ]]
    -- upvalues: v6 (copy)
    v6.goToScript(v110.scriptId, v110.range, v111);
end;
v8.onItemClicked = function(v112, v113, v114) --[[ Line: 338 ]] --[[ Name: onItemClicked ]]
    if v112._shiftDown then
        v112:shiftSelectItem(v113);
    elseif v114 then
        v112:plainSelectItem(v113, v114);
    else
        v112:toggleSelectItem(v113);
    end;
    v112._previousSelected = v113.key;
    v112._onSelectedChanged:Fire();
end;
v8.getRightClickContextInfo = function(v115, v116, _) --[[ Line: 350 ]] --[[ Name: getRightClickContextInfo ]]
    -- upvalues: v1 (copy)
    local v118 = {};
    local v119 = {};
    for _, v121 in (v115:getSelectionList()) do
        if v121.range then
            table.insert(v119, v121);
        elseif v121.scriptId then
            table.insert(v118, v121);
        end;
    end;
    local v122 = {
        selectedScriptItems = v118, 
        selectedRangeItems = v119, 
        onScriptsReverted = function() --[[ Line: 366 ]] --[[ Name: onScriptsReverted ]]
            -- upvalues: v115 (copy)
            v115:resetSelected();
        end, 
        onSuggestionApplied = function() --[[ Line: 369 ]] --[[ Name: onSuggestionApplied ]]
            -- upvalues: v115 (copy)
            v115:resetSelected();
        end
    };
    return v1.Dictionary.join(v116, v122);
end;
return v8;