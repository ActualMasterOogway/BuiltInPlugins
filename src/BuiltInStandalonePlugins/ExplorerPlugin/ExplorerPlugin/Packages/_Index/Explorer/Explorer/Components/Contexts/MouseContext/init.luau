local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.Signal);
local v4 = require(l_script_FirstAncestor_0.Util.onlyOnce);
local v5 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local v6 = require(l_script_FirstAncestor_0.Hooks.useIncrementedState);
local l_createElement_0 = v2.createElement;
local v8 = {
    getMousePosition = function() --[[ Line: 22 ]] --[[ Name: getMousePosition ]]
        return Vector2.new();
    end, 
    listenForMouseMove = function() --[[ Line: 26 ]] --[[ Name: listenForMouseMove ]]
        return function() --[[ Line: 27 ]]

        end;
    end, 
    mouseMoved = v3.new()
};
local v9 = v2.createContext(v8);
local function v12(v10) --[[ Line: 35 ]] --[[ Name: Provider ]]
    -- upvalues: l_createElement_0 (copy), v9 (copy)
    local v11 = {
        getMousePosition = v10.getMousePosition, 
        listenForMouseMove = v10.listenForMouseMove, 
        mouseMoved = v10.mouseMoved
    };
    return l_createElement_0(v9.Provider, {
        value = v11
    }, v10.children);
end;
return {
    Context = v9, 
    Provider = v12, 
    StandardProvider = function(v13) --[[ Line: 49 ]] --[[ Name: StandardProvider ]]
        -- upvalues: v2 (copy), v3 (copy), v6 (copy), v4 (copy), l_UserInputService_0 (copy), v5 (copy), l_createElement_0 (copy), v12 (copy)
        local v14 = v2.useRef(v3.new());
        local v15 = v6();
        local v16 = v2.useCallback(function() --[[ Line: 55 ]]
            -- upvalues: v15 (copy), v4 (ref)
            v15.increment();
            return v4(function() --[[ Line: 57 ]]
                -- upvalues: v15 (ref)
                v15.decrement();
            end);
        end, {});
        local v17 = v2.useCallback(function() --[[ Line: 62 ]]
            -- upvalues: l_UserInputService_0 (ref)
            return l_UserInputService_0:GetMouseLocation();
        end, {});
        v5(l_UserInputService_0.InputChanged, function(v18) --[[ Line: 66 ]]
            -- upvalues: v15 (copy), v14 (copy)
            if v18.UserInputType ~= Enum.UserInputType.MouseMovement then
                return;
            elseif v15.amount == 0 then
                return;
            else
                v14.current:Fire();
                return;
            end;
        end, {
            v15.amount == 0
        });
        return l_createElement_0(v12, {
            getMousePosition = v17, 
            listenForMouseMove = v16, 
            mouseMoved = v14.current
        }, v13.children);
    end
};