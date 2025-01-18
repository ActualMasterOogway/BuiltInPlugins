local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginAction);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: useUndoRedoActions ]]
    -- upvalues: v2 (copy), l_ChangeHistoryService_0 (copy), v3 (copy)
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref)
        l_ChangeHistoryService_0:SetEnabled(false);
        return function() --[[ Line: 14 ]]
            -- upvalues: l_ChangeHistoryService_0 (ref)
            l_ChangeHistoryService_0:SetEnabled(true);
        end;
    end, {});
    v3("Undo", v4);
    v3("Redo", v5);
end;