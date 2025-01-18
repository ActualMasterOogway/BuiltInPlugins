local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(script.Parent.console);
local v3 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV;
local l_ReactDebugCurrentFrame_0 = require(script.Parent.ReactSharedInternals).ReactDebugCurrentFrame;
local function _(v6) --[[ Line: 31 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy)
    if _G.__DEV__ then
        if v6 then
            local l__owner_0 = v6._owner;
            local v8 = l_describeUnknownElementTypeFrameInDEV_0(v6.type, v6._source, l__owner_0 ~= nil and l__owner_0.type or nil);
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v8);
            return;
        else
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        end;
    end;
end;
return function(v10, v11, v12, v13, v14, v15) --[[ Line: 48 ]] --[[ Name: checkPropTypes ]]
    -- upvalues: v2 (copy), l_Error_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy), v3 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if v10 and v11 then
            v2.warn("You've defined both propTypes and validateProps on " .. (v14 or "a component"));
        end;
        if v11 then
            if typeof(v11) ~= "function" then
                v2.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v11), v14 or ""));
            else
                local v16, v17 = v11(v12);
                if not v16 then
                    v17 = v17 or "<Validator function did not supply a message>";
                    local v18 = ("validateProps failed on a %s type in %s: %s"):format(v13, v14 or "<UNKNOWN Component>", (tostring(v17)));
                    error(v18);
                end;
            end;
        end;
        if v10 then
            assert(typeof(v10) == "table", "propTypes needs to be a table");
            for v19, _ in pairs(v10) do
                local _, l_result_0 = pcall(function() --[[ Line: 111 ]]
                    -- upvalues: v10 (copy), v19 (copy), l_Error_0 (ref), v14 (copy), v13 (copy), v12 (copy)
                    if typeof(v10[v19]) ~= "function" then
                        local v21 = l_Error_0.new((v14 or "React class") .. ": " .. v13 .. " type `" .. v19 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v10[v19]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v21.name = "Invariant Violation";
                        error(v21);
                    end;
                    return v10[v19](v12, v19, v14, v13, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end);
                local v24 = typeof(l_result_0) == "table";
                if l_result_0 ~= nil and not v24 then
                    if _G.__DEV__ then
                        if v15 then
                            local l__owner_1 = v15._owner;
                            local v26 = l_describeUnknownElementTypeFrameInDEV_0(v15.type, v15._source, l__owner_1 ~= nil and l__owner_1.type or nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v26);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v2.error(string.format("%s: type specification of %s" .. " `%s` is invalid; the type checker " .. "function must return `nil` or an `Error` but returned a %s. " .. "You may have forgotten to pass an argument to the type checker " .. "creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and " .. "shape all require an argument).", v14 or "React class", v13, v19, (typeof(l_result_0))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v24 and v3[l_result_0.message] == nil then
                    v3[tostring(l_result_0.message)] = true;
                    if _G.__DEV__ then
                        if v15 then
                            local l__owner_2 = v15._owner;
                            local v28 = l_describeUnknownElementTypeFrameInDEV_0(v15.type, v15._source, l__owner_2 ~= nil and l__owner_2.type or nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v28);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v2.warn(string.format("Failed %s type: %s", v13, (tostring(l_result_0.message))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;