local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local l_act_0 = v3.act;
return function(v5, v6, v7) --[[ Line: 14 ]] --[[ Name: renderHookWithStore ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_act_0 (copy)
    local v8 = {};
    local function v10(v9) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v6 (copy)
        v8.current = v6(v9);
        return nil;
    end;
    local function v13(v11) --[[ Line: 22 ]] --[[ Name: createRootElement ]]
        -- upvalues: v2 (ref), v10 (copy), v5 (copy), v1 (ref)
        local v12 = v2.createElement(v10, v11);
        if v5 ~= nil then
            v12 = v2.createElement(v1.StoreProvider, {
                store = v5
            }, {
                Wrapper = v12
            });
        end;
        return v12;
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v15 = v3.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 37 ]]
        -- upvalues: v15 (copy), v13 (copy), v7 (copy)
        v15:render((v13(v7 or {})));
    end);
    local function v17(v16) --[[ Line: 41 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v15 (copy), v13 (copy)
        l_act_0(function() --[[ Line: 42 ]]
            -- upvalues: v15 (ref), v13 (ref), v16 (copy)
            v15:render((v13(v16)));
        end);
    end;
    return {
        result = v8, 
        rerender = v17, 
        cleanup = function() --[[ Line: 47 ]] --[[ Name: cleanup ]]
            -- upvalues: v15 (copy)
            v15:unmount();
        end
    };
end;