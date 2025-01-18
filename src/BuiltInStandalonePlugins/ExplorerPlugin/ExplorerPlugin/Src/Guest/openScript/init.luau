local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
return function(v1) --[[ Line: 3 ]] --[[ Name: openScript ]]
    -- upvalues: l_ScriptEditorService_0 (copy)
    task.spawn(function() --[[ Line: 4 ]]
        -- upvalues: l_ScriptEditorService_0 (ref), v1 (copy)
        local v2, v3 = l_ScriptEditorService_0:OpenScriptDocumentAsync(v1);
        if v2 then
            return;
        else
            warn((("Couldn't open %*: %*"):format(v1.Name, v3)));
            return;
        end;
    end);
end;