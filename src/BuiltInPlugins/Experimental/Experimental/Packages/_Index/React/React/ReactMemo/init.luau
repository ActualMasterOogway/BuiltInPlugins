local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Shared);
local l_console_0 = v1.console;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_inspect_0 = v3.util.inspect;
local l_ReactSymbols_0 = v1.ReactSymbols;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_isValidElementType_0 = v1.isValidElementType;
local l_getComponentName_0 = v1.getComponentName;
return {
    memo = function(v12, v13) --[[ Line: 31 ]]
        -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_getComponentName_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_REACT_MEMO_TYPE_0 (copy)
        if _G.__DEV__ and not l_isValidElementType_0(v12) then
            local v14 = "";
            if v12 == nil or typeof(v12) == "table" and #l_Object_0.keys(v12) == 0 then
                v14 = v14 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and named imports.";
            end;
            local v15 = nil;
            if v12 == nil then
                v15 = "nil";
            elseif l_Array_0.isArray(v12) then
                v15 = "array";
            elseif v12 ~= nil and typeof(v12) == "table" and v12["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v15 = ("<%s />"):format(l_getComponentName_0(v12.type) or "UNKNOWN");
                v14 = " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v15 = typeof(v12);
                if v12 ~= nil then
                    v14 = "\n" .. l_inspect_0(v12);
                end;
            end;
            l_console_0.error("memo: The first argument must be a component. Instead received: `%s`.%s", v15, v14);
        end;
        local v16 = {
            ["$$typeof"] = l_REACT_MEMO_TYPE_0, 
            type = v12, 
            compare = v13 or nil
        };
        if _G.__DEV__ then
            local v17 = nil;
            do
                local l_v17_0 = v17;
                v16.displayName = function(...) --[[ Line: 85 ]]
                    -- upvalues: l_v17_0 (ref), v12 (copy)
                    if #{
                        ...
                    } == 0 then
                        return l_v17_0;
                    else
                        local v19 = ({
                            ...
                        })[1];
                        l_v17_0 = v19;
                        if v12.displayName == nil then
                            v12.displayName = v19;
                        end;
                        return nil;
                    end;
                end;
            end;
        end;
        return v16;
    end
};