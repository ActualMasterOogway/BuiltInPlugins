local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_createElement_0 = v2.createElement;
return function(v4) --[[ Line: 8 ]] --[[ Name: StudioMouseContextProvider ]]
    -- upvalues: v2 (copy), v1 (copy), l_createElement_0 (copy)
    local v5 = v2.useRef(v1.Signal.new());
    local v6 = v2.useCallback(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy)
        return v4.dockWidget:GetRelativeMousePosition();
    end, {
        v4.dockWidget
    });
    local v7 = v2.useRef(nil);
    local v8 = v2.useRef(0);
    local v13 = v2.useCallback(function() --[[ Line: 21 ]]
        -- upvalues: v7 (copy), v4 (copy), v5 (copy), v8 (copy)
        if v7.current == nil then
            v7.current = task.spawn(function() --[[ Line: 23 ]]
                -- upvalues: v4 (ref), v5 (ref)
                local l_RelativeMousePosition_0 = v4.dockWidget:GetRelativeMousePosition();
                while true do
                    local l_RelativeMousePosition_1 = v4.dockWidget:GetRelativeMousePosition();
                    if l_RelativeMousePosition_1 ~= l_RelativeMousePosition_0 then
                        v5.current:Fire();
                    end;
                    l_RelativeMousePosition_0 = l_RelativeMousePosition_1;
                    task.wait();
                end;
            end);
        end;
        local l_v8_0 = v8;
        l_v8_0.current = l_v8_0.current + 1;
        return function() --[[ Line: 41 ]]
            -- upvalues: v8 (ref), v7 (ref)
            local l_v8_1 = v8;
            l_v8_1.current = l_v8_1.current - 1;
            if v8.current == 0 then
                assert(v7.current ~= nil, "listenForMouseMove destructor called without an active task");
                task.defer(task.cancel, v7.current);
                v7.current = nil;
            end;
        end;
    end, {});
    return l_createElement_0(v1.Components.Contexts.MouseContextProvider, {
        getMousePosition = v6, 
        listenForMouseMove = v13, 
        mouseMoved = v5.current
    }, v4.children);
end;