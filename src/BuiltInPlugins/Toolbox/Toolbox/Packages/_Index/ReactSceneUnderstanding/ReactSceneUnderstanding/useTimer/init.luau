local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
return function(v5, v6) --[[ Line: 10 ]] --[[ Name: useTimer ]]
    -- upvalues: l_useRef_0 (copy), l_useEffect_0 (copy), l_RunService_0 (copy)
    local v7 = l_useRef_0(0);
    l_useEffect_0(function() --[[ Line: 13 ]]
        -- upvalues: l_RunService_0 (ref), v7 (copy), v5 (copy), v6 (copy)
        local v10 = l_RunService_0.Heartbeat:Connect(function(v8) --[[ Line: 14 ]]
            -- upvalues: v7 (ref), v5 (ref), v6 (ref)
            local l_v7_0 = v7;
            l_v7_0.current = l_v7_0.current + v8;
            if v5 <= 0 or v7.current > v5 then
                v7.current = 0;
                v6();
            end;
        end);
        return function() --[[ Line: 23 ]]
            -- upvalues: v10 (copy)
            v10:Disconnect();
        end;
    end, {
        v5, 
        v6
    });
end;