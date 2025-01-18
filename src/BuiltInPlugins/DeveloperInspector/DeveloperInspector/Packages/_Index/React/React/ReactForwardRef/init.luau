local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
return {
    forwardRef = function(v5) --[[ Line: 22 ]]
        -- upvalues: l_REACT_MEMO_TYPE_0 (copy), l_console_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy)
        if _G.__DEV__ then
            if typeof(v5) == "table" and v5["$$typeof"] == l_REACT_MEMO_TYPE_0 then
                l_console_0.error("forwardRef requires a render function but received a `memo` " .. "component. Instead of forwardRef(memo(...)), use " .. "memo(forwardRef(...)).");
            elseif typeof(v5) ~= "function" then
                l_console_0.error("forwardRef requires a render function but was given %s.", (typeof(v5)));
            else
                local v6, _ = debug.info(v5, "a");
                if v6 ~= 0 and v6 ~= 2 then
                    l_console_0.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v6 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.");
                end;
            end;
        end;
        local v8 = {
            ["$$typeof"] = l_REACT_FORWARD_REF_TYPE_0, 
            render = v5
        };
        if _G.__DEV__ then
            local v9 = nil;
            do
                local l_v9_0 = v9;
                setmetatable(v8, {
                    __index = function(_, v12) --[[ Line: 74 ]] --[[ Name: __index ]]
                        -- upvalues: l_v9_0 (ref)
                        if v12 == "displayName" then
                            return l_v9_0;
                        else
                            return nil;
                        end;
                    end, 
                    __newindex = function(v13, v14, v15) --[[ Line: 80 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_v9_0 (ref)
                        if v14 == "displayName" then
                            l_v9_0 = v15;
                            return;
                        else
                            rawset(v13, v14, v15);
                            return;
                        end;
                    end
                });
            end;
        end;
        return v8;
    end
};