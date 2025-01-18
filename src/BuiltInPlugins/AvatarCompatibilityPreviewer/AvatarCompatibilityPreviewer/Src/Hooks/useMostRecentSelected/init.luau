local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedAutoSetupTarget);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedAvatar);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
return function() --[[ Line: 24 ]] --[[ Name: useMostRecentSelected ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), v3 (copy), v1 (copy)
    if v6() and v5() then
        local v7, v8 = v4();
        local v9, v10 = v3(v7);
        if v7 and v8 then
            return {
                autoSetupTarget = nil, 
                avatar = v7, 
                isSelected = v8
            };
        elseif v9 and v10 then
            return {
                autoSetupTarget = v9, 
                avatar = nil, 
                isSelected = true
            };
        elseif v7 then
            return {
                autoSetupTarget = nil, 
                avatar = v7, 
                isSelected = v8
            };
        else
            return nil;
        end;
    else
        local v11 = nil;
        local v12 = nil;
        if v5() then
            local v13, v14 = v3();
            v11 = v13;
            v12 = v14;
        end;
        local v15, v16 = v4();
        local v17 = v1.useRef(nil);
        local v18 = v1.useRef(nil);
        local v19 = v1.useRef(nil);
        if v18.current ~= v11 or v12 then
            if v11 == nil and v19.current ~= nil and v19.current.autoSetupTarget ~= nil then
                v19.current = nil;
            elseif v11 ~= nil and (v19.current == nil or v19.current.autoSetupTarget ~= v11) then
                v19.current = {
                    avatar = nil, 
                    autoSetupTarget = v11, 
                    isSelected = false
                };
            end;
            v18.current = v11;
        end;
        if v17.current ~= v15 or v16 then
            if v15 == nil and v19.current ~= nil and v19.current.avatar ~= nil then
                v19.current = nil;
            elseif v15 ~= nil and (v19.current == nil or v19.current.avatar ~= v15) then
                v19.current = {
                    avatar = v15, 
                    autoSetupTarget = nil, 
                    isSelected = false
                };
            end;
            v17.current = v15;
        end;
        return v19.current;
    end;
end;