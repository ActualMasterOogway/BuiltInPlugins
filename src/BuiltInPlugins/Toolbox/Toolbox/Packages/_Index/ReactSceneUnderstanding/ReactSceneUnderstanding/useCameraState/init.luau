local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.enums);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
return function(v7) --[[ Line: 15 ]] --[[ Name: useCameraState ]]
    -- upvalues: l_useState_0 (copy), v2 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy)
    local v8, v9 = l_useState_0(v2.CameraState.Idle);
    local v10 = l_useRef_0(nil);
    local v12 = l_useCallback_0(function() --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v2 (ref), v10 (copy)
        v9(function(v11) --[[ Line: 20 ]]
            -- upvalues: v2 (ref)
            if v11 ~= v2.CameraState.Moving then
                return v2.CameraState.Moving;
            else
                return v11;
            end;
        end);
        if v10.current then
            task.cancel(v10.current);
        end;
        v10.current = task.delay(0.2, function() --[[ Line: 28 ]]
            -- upvalues: v9 (ref), v2 (ref)
            v9(v2.CameraState.Idle);
        end);
    end, {});
    l_useEffect_0(function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy), v12 (copy)
        local v13 = v7:GetPropertyChangedSignal("CFrame"):Connect(v12);
        return function() --[[ Line: 36 ]]
            -- upvalues: v13 (copy)
            v13:Disconnect();
        end;
    end, {
        v7
    });
    return v8;
end;