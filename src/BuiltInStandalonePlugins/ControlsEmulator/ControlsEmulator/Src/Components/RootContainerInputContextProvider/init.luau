local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RootContainerInputContext);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
RootContainerInputContextProvider = function(v4) --[[ Line: 14 ]] --[[ Name: RootContainerInputContextProvider ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5 = v1.useRef(nil);
    local _, v7 = v1.useState(false);
    return v1.createElement(v2.Provider, {
        value = if v5.current then {
            InputChanged = v5.current.InputChanged, 
            InputEnded = v5.current.InputEnded, 
            InputBegan = v5.current.InputBegan
        } else v3.DEFAULT_ROOT_CONTAINER_INPUT_CONTEXT_STATE
    }, {
        ListenerComponent = v1.createElement("Frame", {
            [v1.Tag] = "Component-RootContainerInputContextProvider X-Fill", 
            ref = function(v8) --[[ Line: 29 ]] --[[ Name: ref ]]
                -- upvalues: v5 (copy), v7 (copy)
                v5.current = v8;
                v7(true);
            end
        }, v4.children)
    });
end;
return v1.memo(RootContainerInputContextProvider);