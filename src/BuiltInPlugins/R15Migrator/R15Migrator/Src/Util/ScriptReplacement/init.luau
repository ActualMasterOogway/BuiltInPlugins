local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_DraftsService_0 = game:GetService("DraftsService");
local l_Util_0 = script:FindFirstAncestor("R15Migrator").Src.Util;
local _ = require(l_Util_0.ScriptAnalysis.Constants);
local v4 = require(l_Util_0.ScriptHistory.ChunkUtil);
local v8 = {
    UNASSIGNED = "Unassigned", 
    goToScriptInstance = function(v5, v6) --[[ Line: 13 ]] --[[ Name: goToScriptInstance ]]
        -- upvalues: l_ScriptEditorService_0 (copy)
        if not v5 then
            return;
        else
            l_ScriptEditorService_0:OpenScriptDocumentAsync(v5);
            local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v5);
            if not l_l_ScriptEditorService_0_ScriptDocument_0 or not v6 then
                return;
            else
                l_l_ScriptEditorService_0_ScriptDocument_0:ForceSetSelectionAsync(v6.startLine, v6.startCharacter, v6.endLine, v6.endCharacter);
                return l_l_ScriptEditorService_0_ScriptDocument_0;
            end;
        end;
    end
};
v8.goToScript = function(v9, v10, v11) --[[ Line: 28 ]] --[[ Name: goToScript ]]
    -- upvalues: v8 (copy)
    if not v9 or not v11 then
        return;
    else
        local v12 = v11:getScriptInstanceFromGUID(v9);
        return v8.goToScriptInstance(v12, v10);
    end;
end;
local function _(v13, v14, v15) --[[ Line: 37 ]] --[[ Name: replaceSuggestionInDocument ]]
    if not v13 or not v14 then
        return false;
    else
        v13:EditTextAsync(v15, v14.startLine, v14.startCharacter, v14.endLine, v14.endCharacter);
        return true;
    end;
end;
v8.replaceWithSuggestion = function(v17, v18, v19, v20, v21, v22) --[[ Line: 46 ]] --[[ Name: replaceWithSuggestion ]]
    -- upvalues: v8 (copy)
    for _, v24 in v21._list do
        if v18 == v24.range then
            v22:getHandler("onScriptAutoReplacement")(v24.issueType);
        end;
    end;
    local v25 = v8.goToScript(v17, v18, v19);
    if not v25 or not v18 then
        return false;
    else
        v25:EditTextAsync(v20, v18.startLine, v18.startCharacter, v18.endLine, v18.endCharacter);
        return true;
    end;
end;
v8.diffScripts = function(v26, v27) --[[ Line: 56 ]] --[[ Name: diffScripts ]]
    -- upvalues: v4 (copy), l_DraftsService_0 (copy)
    local v28 = {};
    local v29 = {};
    for _, v31 in v26 do
        local v32 = v27:getScriptInstanceFromGUID(v31.scriptId);
        table.insert(v29, v32);
        table.insert(v28, (v4:GetScriptSourceFromChunks(v32)));
    end;
    l_DraftsService_0:ShowSourceDiffsAgainstCurrent(v28, v29);
end;
return v8;