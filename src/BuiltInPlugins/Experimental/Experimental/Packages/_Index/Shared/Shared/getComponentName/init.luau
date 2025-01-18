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
local function _(v14, v15, v16) --[[ Line: 25 ]] --[[ Name: getWrappedName ]]
    local v17 = "<function>";
    if typeof(v15) == "table" then
        v17 = v15.displayName or v15.name or "";
    end;
    return v14.displayName or v17 ~= "" and string.format("%s(%s)", v16, v17) or v16;
end;
local function _(v19) --[[ Line: 38 ]] --[[ Name: getContextName ]]
    return v19.displayName or "Context";
end;
local function v21(v22) --[[ Line: 42 ]] --[[ Name: getComponentName ]]
    -- upvalues: v0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v21 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if v22 == nil then
        return nil;
    else
        local v23 = typeof(v22);
        if _G.__DEV__ and v23 == "table" and typeof(v22.tag) == "number" then
            v0.warn("Received an unexpected object in getComponentName(). " .. "This is likely a bug in React. Please file an issue.");
        end;
        if v23 == "function" then
            local v24 = debug.info(v22, "n");
            if v24 and #v24 > 0 then
                return v24;
            else
                return nil;
            end;
        elseif v23 == "string" then
            return v22;
        elseif v22 == l_REACT_FRAGMENT_TYPE_0 then
            return "Fragment";
        elseif v22 == l_REACT_PORTAL_TYPE_0 then
            return "Portal";
        elseif v22 == l_REACT_PROFILER_TYPE_0 then
            return "Profiler";
        elseif v22 == l_REACT_STRICT_MODE_TYPE_0 then
            return "StrictMode";
        elseif v22 == l_REACT_SUSPENSE_TYPE_0 then
            return "Suspense";
        elseif v22 == l_REACT_SUSPENSE_LIST_TYPE_0 then
            return "SuspenseList";
        else
            if v23 == "table" then
                local v25 = v22["$$typeof"];
                if v25 == l_REACT_CONTEXT_TYPE_0 then
                    return (v22.displayName or "Context") .. ".Consumer";
                elseif v25 == l_REACT_PROVIDER_TYPE_0 then
                    return (v22._context.displayName or "Context") .. ".Provider";
                elseif v25 == l_REACT_FORWARD_REF_TYPE_0 then
                    local l_render_0 = v22.render;
                    local v27 = "<function>";
                    if typeof(l_render_0) == "table" then
                        v27 = l_render_0.displayName or l_render_0.name or "";
                    end;
                    return v22.displayName or v27 ~= "" and string.format("%s(%s)", "ForwardRef", v27) or "ForwardRef";
                elseif v25 == l_REACT_MEMO_TYPE_0 then
                    return v21(v22.type);
                elseif v25 == l_REACT_BLOCK_TYPE_0 then
                    return v21(v22._render);
                elseif v25 == l_REACT_LAZY_TYPE_0 then
                    local l__payload_0 = v22._payload;
                    local l__init_0 = v22._init;
                    local l_status_0, l_result_0 = pcall(l__init_0, l__payload_0);
                    if l_status_0 then
                        return v21(l_result_0);
                    else
                        return nil;
                    end;
                elseif v22.displayName then
                    return v22.displayName;
                elseif v22.name then
                    return v22.name;
                else
                    local v32 = getmetatable(v22);
                    if v32 and rawget(v32, "__tostring") then
                        return (tostring(v22));
                    end;
                end;
            end;
            return nil;
        end;
    end;
end;
return v21;