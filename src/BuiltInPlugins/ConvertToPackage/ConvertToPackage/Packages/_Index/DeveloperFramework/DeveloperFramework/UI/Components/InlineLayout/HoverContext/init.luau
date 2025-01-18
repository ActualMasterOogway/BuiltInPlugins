local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
if not (v1.Tag ~= nil) then
    return {};
else
    local function v2() --[[ Line: 43 ]]
        warn("Wrap the component using HoverContext with a HoverContext.Provider element");
    end;
    local v3 = v1.createContext({
        registerOnHoverCallback = v2, 
        onHover = v2
    });
    useHoverContext = function(v4) --[[ Line: 58 ]] --[[ Name: useHoverContext ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v5 = v1.useContext(v3);
        local v6, v7 = v1.useState(false);
        v1.useEffect(function() --[[ Line: 62 ]]
            -- upvalues: v5 (copy), v4 (copy), v7 (copy)
            v5.registerOnHoverCallback(v4, v7);
        end, {});
        return v6, (v1.useCallback(function(v8) --[[ Line: 66 ]]
            -- upvalues: v5 (copy), v4 (copy)
            v5.onHover(v4, v8);
        end, {
            v4
        }));
    end;
    Provider = function(v9) --[[ Line: 73 ]] --[[ Name: Provider ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v10 = v1.useRef({});
        local v15 = v1.useCallback(function(v11, v12) --[[ Line: 75 ]]
            -- upvalues: v10 (copy)
            for _, v14 in v10.current[v11] do
                v14(v12);
            end;
        end, {});
        local v19 = v1.useCallback(function(v16, v17) --[[ Line: 81 ]]
            -- upvalues: v10 (copy)
            local v18 = v10.current[v16];
            if v18 then
                table.insert(v18, v17);
                return;
            else
                v10.current[v16] = {
                    v17
                };
                return;
            end;
        end, {});
        return v1.createElement(v3.Provider, {
            value = {
                onHover = v15, 
                registerOnHoverCallback = v19
            }
        }, v9.children);
    end;
    return {
        useHoverContext = useHoverContext, 
        Provider = Provider
    };
end;