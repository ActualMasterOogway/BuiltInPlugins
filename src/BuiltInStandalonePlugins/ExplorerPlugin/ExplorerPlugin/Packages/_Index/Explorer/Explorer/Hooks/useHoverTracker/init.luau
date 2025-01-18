local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.Contexts.MouseContext);
local v3 = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v7 = require(l_script_FirstAncestor_0.Components.Contexts.WindowInputContext);
local v8 = require(l_script_FirstAncestor_0.Hooks.useEventConnection);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
return function(v10, v11, v12, v13, v14) --[[ Line: 13 ]] --[[ Name: useHoverTracker ]]
    -- upvalues: v4 (copy), v7 (copy), v2 (copy), v3 (copy), v1 (copy), v5 (copy), v8 (copy)
    local v15 = v4.useContext(v7.Context);
    local v16 = v4.useContext(v2.Context);
    local v17 = v3.use(v15.windowHoveredObservable);
    local v18 = v4.useRef(nil);
    local v23 = v4.useCallback(function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy), v17 (copy), v10 (copy), v16 (copy), v12 (copy), v13 (copy), v11 (copy), v1 (ref)
        if v14.current == nil then
            return;
        elseif not v17 then
            v10.hoverId(nil);
            return;
        else
            local v19 = v16.getMousePosition() + Vector2.new(0, v12.get() - v13);
            for _, v21 in v11 do
                local v22 = v21.get();
                if v22.yPixels <= v19.Y and v19.Y <= v22.yPixels + v1.explorerRowHeight then
                    v10.hoverId(v22.datum.id);
                    return;
                end;
            end;
            v10.hoverId(nil);
            return;
        end;
    end, {
        v12, 
        v10.hoverId, 
        v16.getMousePosition, 
        v11, 
        v14, 
        v17, 
        v13
    });
    v4.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v11 (copy), v23 (copy)
        local v24 = {};
        local v25 = false;
        local v26 = {};
        for v27, v28 in v11 do
            v26[v27] = v28.get().datum.id;
            table.insert(v24, v28.changedSignal:Connect(function(v29) --[[ Line: 76 ]]
                -- upvalues: v26 (copy), v27 (copy), v25 (ref), v23 (ref)
                local v30 = v26[v27] ~= v29.datum.id;
                v26[v27] = v29.datum.id;
                if v25 then
                    return;
                else
                    if v30 then
                        v23();
                        task.defer(function() --[[ Line: 86 ]]
                            -- upvalues: v25 (ref)
                            v25 = false;
                        end);
                    end;
                    return;
                end;
            end));
        end;
        return function() --[[ Line: 94 ]]
            -- upvalues: v24 (copy)
            for _, v32 in v24 do
                v32:Disconnect();
            end;
        end;
    end, {
        v11, 
        v23
    });
    local v33 = v4.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v18 (copy), v16 (copy), v23 (copy)
        if v18.current == nil then
            v18.current = v16.listenForMouseMove();
            v23();
        end;
    end, {
        v16.listenForMouseMove, 
        v23
    });
    local v34 = v4.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v18 (copy), v10 (copy)
        if v18.current ~= nil then
            v18.current();
            v18.current = nil;
        end;
        v10.hoverId(nil);
    end, {
        v10.hoverId
    });
    v3.useEffect(v15.windowHoveredObservable, function(v35) --[[ Line: 117 ]]
        -- upvalues: v33 (copy), v34 (copy)
        if v35 then
            v33();
            return;
        else
            v34();
            return;
        end;
    end, {
        v33, 
        v34
    });
    local v36 = v5.useRefToState(v34);
    v4.useEffect(function() --[[ Line: 126 ]]
        -- upvalues: v36 (copy)
        return function() --[[ Line: 127 ]]
            -- upvalues: v36 (ref)
            v36.current();
        end;
    end, {});
    v8(v16.mouseMoved, v23, {
        v23
    });
    v4.useEffect(v23, {
        v23
    });
end;