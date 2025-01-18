local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local _ = require(l_Parent_0.Shared);
local l_REACT_LAZY_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_LAZY_TYPE;
lazyInitializer = function(v5) --[[ Line: 72 ]] --[[ Name: lazyInitializer ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy)
    if v5._status == -1 then
        local v6 = v5._result();
        v5._status = 0;
        v5._result = v6;
        v6:andThen(function(v7) --[[ Line: 80 ]]
            -- upvalues: v5 (copy), l_console_0 (ref), l_inspect_0 (ref)
            if v5._status == 0 then
                local l_default_0 = v7.default;
                if _G.__DEV__ and l_default_0 == nil then
                    l_console_0.error("lazy: Expected the result of a dynamic import() call. " .. "Instead received: `%s`\n\nYour code should look like: \n  " .. "local MyComponent = lazy(function() return req" .. "quire(script.Parent.MyComponent) end)", l_inspect_0(v7));
                end;
                local l_v5_0 = v5;
                l_v5_0._status = 1;
                l_v5_0._result = l_default_0;
            end;
        end, function(v10) --[[ Line: 101 ]]
            -- upvalues: v5 (copy)
            if v5._status == 0 then
                local l_v5_1 = v5;
                l_v5_1._status = 2;
                l_v5_1._result = v10;
            end;
        end);
    end;
    if v5._status == 1 then
        return v5._result;
    else
        error(v5._result);
        return;
    end;
end;
return {
    lazy = function(v12) --[[ Line: 119 ]]
        -- upvalues: l_REACT_LAZY_TYPE_0 (copy), l_console_0 (copy)
        local v13 = {
            _status = -1, 
            _result = v12
        };
        local v14 = {
            ["$$typeof"] = l_REACT_LAZY_TYPE_0, 
            _payload = v13, 
            _init = lazyInitializer
        };
        if _G.__DEV__ then
            local v15 = nil;
            local v16 = nil;
            do
                local l_v15_0, l_v16_0 = v15, v16;
                setmetatable(v14, {
                    __index = function(_, v20) --[[ Line: 141 ]] --[[ Name: __index ]]
                        -- upvalues: l_v15_0 (ref), l_v16_0 (ref)
                        if v20 == "defaultProps" then
                            return l_v15_0;
                        elseif v20 == "propTypes" then
                            return l_v16_0;
                        else
                            return;
                        end;
                    end, 
                    __newindex = function(v21, v22, v23) --[[ Line: 150 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_console_0 (ref), l_v15_0 (ref), l_v16_0 (ref)
                        if v22 == "defaultProps" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `defaultProps` to " .. "a lazy component import. Either specify them where the component " .. "is defined, or create a wrapping component around it.");
                            l_v15_0 = v23;
                            setmetatable(v21, {
                                __index = function() --[[ Line: 161 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 162 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                        if v22 == "propTypes" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `propTypes` to " .. "a lazy component import. Either specify them where the component " .. "is defined, or create a wrapping component around it.");
                            l_v16_0 = v23;
                            setmetatable(v21, {
                                __index = function() --[[ Line: 175 ]] --[[ Name: __index ]]

                                end, 
                                __newindex = function() --[[ Line: 176 ]] --[[ Name: __newindex ]]

                                end
                            });
                        end;
                    end
                });
            end;
        end;
        return v14;
    end
};