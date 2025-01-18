local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.TestInExperienceUtil);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
return function() --[[ Line: 7 ]] --[[ Name: TestInExperienceManager ]]
    -- upvalues: l_script_FirstAncestor_0 (copy), v1 (copy), v3 (copy), v2 (copy)
    local l_FocusedDataModelSession_0 = l_script_FirstAncestor_0.Parent.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
    assert(l_FocusedDataModelSession_0 ~= nil, "FocusedDataModelSession is nil");
    v1.useEffect(function() --[[ Line: 12 ]]
        -- upvalues: v3 (ref), v2 (ref), l_FocusedDataModelSession_0 (copy)
        if v3() then
            v2.reset();
        else
            v2.clearTestingAvatars();
        end;
        local v5 = l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 19 ]]
            -- upvalues: l_FocusedDataModelSession_0 (ref), v3 (ref), v2 (ref)
            if l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.Edit then
                if v3() then
                    v2.reset();
                    return;
                else
                    v2.clearTestingAvatars();
                end;
            end;
        end);
        return function() --[[ Line: 29 ]]
            -- upvalues: v3 (ref), v2 (ref), v5 (copy)
            if v3() then
                v2.reset();
            else
                v2.clearTestingAvatars();
            end;
            v5:Disconnect();
        end;
    end, {});
end;