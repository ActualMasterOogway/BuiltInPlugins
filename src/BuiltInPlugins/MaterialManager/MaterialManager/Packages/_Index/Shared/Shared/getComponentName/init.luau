local v0 = require(script.Parent.console);
local v1 = require(script.Parent.ReactSymbols);
local l_REACT_CONTEXT_TYPE_0 = v1.REACT_CONTEXT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v1.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = v1.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = v1.REACT_PORTAL_TYPE;
local l_REACT_MEMO_TYPE_0 = v1.REACT_MEMO_TYPE;
local l_REACT_PROFILER_TYPE_0 = v1.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = v1.REACT_PROVIDER_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = v1.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = v1.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v1.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_LAZY_TYPE_0 = v1.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = v1.REACT_BLOCK_TYPE;
local _ = require(script.Parent.ReactTypes);
local function _(v15, v16, v17) --[[ Line: 38 ]] --[[ Name: getWrappedName ]]
    local v18 = "<function>";
    if typeof(v16) == "table" then
        v18 = v16.displayName or v16.name or "";
    end;
    return v15.displayName or v18 ~= "" and string.format("%s(%s)", v17, v18) or v17;
end;
local function _(v20) --[[ Line: 51 ]] --[[ Name: getContextName ]]
    return v20.displayName or "Context";
end;
local function v22(v23) --[[ Line: 55 ]] --[[ Name: getComponentName ]]
    -- upvalues: v0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v22 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if v23 == nil then
        return nil;
    else
        local v24 = typeof(v23);
        if _G.__DEV__ and v24 == "table" and typeof(v23.tag) == "number" then
            v0.warn("Received an unexpected object in getComponentName(). " .. "This is likely a bug in React. Please file an issue.");
        end;
        if v24 == "function" then
            local v25 = debug.info(v23, "n");
            if v25 and string.len(v25) > 0 then
                return v25;
            else
                return nil;
            end;
        elseif v24 == "string" then
            return v23;
        elseif v23 == l_REACT_FRAGMENT_TYPE_0 then
            return "Fragment";
        elseif v23 == l_REACT_PORTAL_TYPE_0 then
            return "Portal";
        elseif v23 == l_REACT_PROFILER_TYPE_0 then
            return "Profiler";
        elseif v23 == l_REACT_STRICT_MODE_TYPE_0 then
            return "StrictMode";
        elseif v23 == l_REACT_SUSPENSE_TYPE_0 then
            return "Suspense";
        elseif v23 == l_REACT_SUSPENSE_LIST_TYPE_0 then
            return "SuspenseList";
        else
            if v24 == "table" then
                local v26 = v23["$$typeof"];
                if v26 == l_REACT_CONTEXT_TYPE_0 then
                    return (v23.displayName or "Context") .. ".Consumer";
                elseif v26 == l_REACT_PROVIDER_TYPE_0 then
                    return (v23._context.displayName or "Context") .. ".Provider";
                elseif v26 == l_REACT_FORWARD_REF_TYPE_0 then
                    local l_render_0 = v23.render;
                    local v28 = "<function>";
                    if typeof(l_render_0) == "table" then
                        v28 = l_render_0.displayName or l_render_0.name or "";
                    end;
                    return v23.displayName or v28 ~= "" and string.format("%s(%s)", "ForwardRef", v28) or "ForwardRef";
                elseif v26 == l_REACT_MEMO_TYPE_0 then
                    return v22(v23.type);
                elseif v26 == l_REACT_BLOCK_TYPE_0 then
                    return v22(v23._render);
                elseif v26 == l_REACT_LAZY_TYPE_0 then
                    local l__payload_0 = v23._payload;
                    local l__init_0 = v23._init;
                    local l_status_0, l_result_0 = pcall(l__init_0, l__payload_0);
                    if l_status_0 then
                        return v22(l_result_0);
                    else
                        return nil;
                    end;
                elseif v23.displayName then
                    return v23.displayName;
                elseif v23.name then
                    return v23.name;
                else
                    local v33 = getmetatable(v23);
                    if v33 and rawget(v33, "__tostring") then
                        return (tostring(v23));
                    end;
                end;
            end;
            return nil;
        end;
    end;
end;
return v22;