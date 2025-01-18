local l_HttpService_0 = game:GetService("HttpService");
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v25 = {
    GetScriptBackupChunks = function(_, v6) --[[ Line: 10 ]] --[[ Name: GetScriptBackupChunks ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        local l_v6_Attribute_0 = v6:GetAttribute(v4.AttributeChunkCountName);
        if not l_v6_Attribute_0 then
            return;
        else
            local v8 = {};
            for v9 = 1, l_v6_Attribute_0 do
                local l_v6_Attribute_1 = v6:GetAttribute(v4.AttributeChunkNameBase .. tostring(v9));
                table.insert(v8, l_HttpService_0:JSONDecode(l_v6_Attribute_1).source);
            end;
            return v8;
        end;
    end, 
    HasScriptBackup = function(_, v12) --[[ Line: 27 ]] --[[ Name: HasScriptBackup ]]
        -- upvalues: v4 (copy)
        local l_v12_Attribute_0 = v12:GetAttribute(v4.AttributeChunkCountName);
        if not l_v12_Attribute_0 or l_v12_Attribute_0 == 0 then
            return false;
        else
            return true;
        end;
    end, 
    RemoveScriptBackupChunks = function(_, v15) --[[ Line: 35 ]] --[[ Name: RemoveScriptBackupChunks ]]
        -- upvalues: v4 (copy)
        local l_v15_Attribute_0 = v15:GetAttribute(v4.AttributeChunkCountName);
        if not l_v15_Attribute_0 then
            return;
        else
            v15:SetAttribute(v4.AttributeChunkCountName, nil);
            v15:SetAttribute(v4.AttributeInitialIssueCountName, nil);
            for v17 = 1, l_v15_Attribute_0 do
                v15:SetAttribute(v4.AttributeChunkNameBase .. tostring(v17), nil);
            end;
            return;
        end;
    end, 
    DidSourceChange = function(v18, v19, v20) --[[ Line: 49 ]] --[[ Name: DidSourceChange ]]
        -- upvalues: l_ScriptEditorService_0 (copy)
        if not v20 then
            v20 = v18:GetScriptBackupChunks(v19);
        end;
        if not v20 then
            return false;
        else
            local l_l_ScriptEditorService_0_EditorSource_0 = l_ScriptEditorService_0:GetEditorSource(v19);
            local v22 = "";
            for _, v24 in v20 do
                v22 = v22 .. v24;
            end;
            if string.gsub(l_l_ScriptEditorService_0_EditorSource_0, "\r\n", "\n") == string.gsub(v22, "\r\n", "\n") then
                return false;
            else
                return true;
            end;
        end;
    end
};
local function _(v26) --[[ Line: 75 ]] --[[ Name: getDoc ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v26);
    if not l_l_ScriptEditorService_0_ScriptDocument_0 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v26);
        l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v26);
    end;
    return l_l_ScriptEditorService_0_ScriptDocument_0;
end;
v25.AppendChunk = function(_, v30, v31) --[[ Line: 85 ]] --[[ Name: AppendChunk ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    local l_l_ScriptEditorService_0_ScriptDocument_1 = l_ScriptEditorService_0:FindScriptDocument(v30);
    if not l_l_ScriptEditorService_0_ScriptDocument_1 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v30);
        l_l_ScriptEditorService_0_ScriptDocument_1 = l_ScriptEditorService_0:FindScriptDocument(v30);
    end;
    local l_l_l_ScriptEditorService_0_ScriptDocument_1_0 = l_l_ScriptEditorService_0_ScriptDocument_1;
    if l_l_l_ScriptEditorService_0_ScriptDocument_1_0 then
        l_l_ScriptEditorService_0_ScriptDocument_1 = l_l_l_ScriptEditorService_0_ScriptDocument_1_0:GetLineCount();
        local v34 = string.len((l_l_l_ScriptEditorService_0_ScriptDocument_1_0:GetLine(l_l_ScriptEditorService_0_ScriptDocument_1)));
        l_l_l_ScriptEditorService_0_ScriptDocument_1_0:EditTextAsync(v31, l_l_ScriptEditorService_0_ScriptDocument_1, v34 + 1, l_l_ScriptEditorService_0_ScriptDocument_1, v34 + 1);
    end;
end;
v25.ReplaceWithChunk = function(_, v36, v37) --[[ Line: 94 ]] --[[ Name: ReplaceWithChunk ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    local l_l_ScriptEditorService_0_ScriptDocument_2 = l_ScriptEditorService_0:FindScriptDocument(v36);
    if not l_l_ScriptEditorService_0_ScriptDocument_2 then
        l_ScriptEditorService_0:OpenScriptDocumentAsync(v36);
        l_l_ScriptEditorService_0_ScriptDocument_2 = l_ScriptEditorService_0:FindScriptDocument(v36);
    end;
    local l_l_l_ScriptEditorService_0_ScriptDocument_2_0 = l_l_ScriptEditorService_0_ScriptDocument_2;
    if l_l_l_ScriptEditorService_0_ScriptDocument_2_0 then
        l_l_ScriptEditorService_0_ScriptDocument_2 = l_l_l_ScriptEditorService_0_ScriptDocument_2_0:GetLineCount();
        l_l_l_ScriptEditorService_0_ScriptDocument_2_0:EditTextAsync(v37, 1, 1, l_l_ScriptEditorService_0_ScriptDocument_2, (string.len((l_l_l_ScriptEditorService_0_ScriptDocument_2_0:GetLine(l_l_ScriptEditorService_0_ScriptDocument_2)))));
    end;
end;
v25.SplitIntoChunks = function(_, v41) --[[ Line: 103 ]] --[[ Name: SplitIntoChunks ]]
    -- upvalues: v4 (copy)
    local v42 = {};
    local l_v41_0 = v41;
    while string.len(l_v41_0) > v4.CharacterLimit do
        local v44 = #v42 * v4.CharacterLimit + 1;
        local v45 = (#v42 + 1) * v4.CharacterLimit;
        table.insert(v42, (string.sub(l_v41_0, v44, v45)));
        l_v41_0 = string.sub(l_v41_0, v45 + 1, (string.len(l_v41_0)));
    end;
    table.insert(v42, l_v41_0);
    return v42;
end;
v25.GetScriptSourceFromChunks = function(v46, v47) --[[ Line: 118 ]] --[[ Name: GetScriptSourceFromChunks ]]
    local l_v46_ScriptBackupChunks_0 = v46:GetScriptBackupChunks(v47);
    local v49 = "";
    for v50 = 1, #l_v46_ScriptBackupChunks_0 do
        v49 = v49 .. l_v46_ScriptBackupChunks_0[v50];
    end;
    return v49;
end;
v25.RemoveAllScriptBackups = function(v51) --[[ Line: 127 ]] --[[ Name: RemoveAllScriptBackups ]]
    -- upvalues: l_CollectionService_0 (copy), v4 (copy)
    for _, v53 in (l_CollectionService_0:GetTagged(v4.ScriptBackupTag)) do
        v51:RemoveScriptBackupChunks(v53);
        l_CollectionService_0:RemoveTag(v53, v4.ScriptBackupTag);
    end;
end;
v25.TrackBackup = function(_, v55) --[[ Line: 135 ]] --[[ Name: TrackBackup ]]
    -- upvalues: l_CollectionService_0 (copy), v4 (copy)
    l_CollectionService_0:AddTag(v55, v4.ScriptBackupTag);
end;
return v25;