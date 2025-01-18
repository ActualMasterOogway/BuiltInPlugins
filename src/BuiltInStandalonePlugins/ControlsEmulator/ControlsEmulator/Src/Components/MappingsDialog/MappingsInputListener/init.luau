local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RootContainerInputContext);
local v3 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
return function(v5) --[[ Line: 20 ]] --[[ Name: MappingsDialog ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v6 = v1.useRef(nil);
    local v7 = v1.useContext(v2);
    local l_isUpdatingMappingForKey_0 = v1.useContext(v3).isUpdatingMappingForKey;
    local l_setMapping_0 = v1.useContext(v4).setMapping;
    v1.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v7 (copy), v6 (copy), l_isUpdatingMappingForKey_0 (copy), l_setMapping_0 (copy)
        if v7.InputBegan and v7.InputChanged and v7.InputEnded then
            v6.current = v7.InputEnded:Connect(function(v10) --[[ Line: 35 ]]
                -- upvalues: l_isUpdatingMappingForKey_0 (ref), l_setMapping_0 (ref)
                if v10.UserInputType == Enum.UserInputType.Keyboard and l_isUpdatingMappingForKey_0 and l_setMapping_0 then
                    l_setMapping_0({
                        v10.KeyCode
                    });
                end;
            end);
        end;
        return function() --[[ Line: 44 ]]
            -- upvalues: v6 (ref)
            if v6.current then
                v6.current:Disconnect();
            end;
        end;
    end, {
        v7, 
        l_isUpdatingMappingForKey_0, 
        l_setMapping_0
    });
    return v1.createElement("Frame", {
        [v1.Tag] = v5[v1.Tag]
    }, v5.children);
end;