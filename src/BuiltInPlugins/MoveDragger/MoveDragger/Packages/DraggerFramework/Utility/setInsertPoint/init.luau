local l_Workspace_0 = game:GetService("Workspace");
return function(v1) --[[ Line: 6 ]]
    -- upvalues: l_Workspace_0 (copy)
    pcall(function() --[[ Line: 7 ]]
        -- upvalues: l_Workspace_0 (ref), v1 (copy)
        l_Workspace_0:SetInsertPoint(v1, true);
    end);
end;