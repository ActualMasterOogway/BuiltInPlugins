local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local _ = require(l_Parent_0.Shared.ReactElementType);
local v3 = require(script.Parent.console);
local v4 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV;
local l_ReactDebugCurrentFrame_0 = require(script.Parent.ReactSharedInternals).ReactDebugCurrentFrame;
local function _(v7) --[[ Line: 32 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy)
    if _G.__DEV__ then
        if v7 then
            local l__owner_0 = v7._owner;
            local v9 = l_describeUnknownElementTypeFrameInDEV_0(v7.type, v7._source, l__owner_0 ~= nil and l__owner_0.type or nil);
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v9);
            return;
        else
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        end;
    end;
end;
return function(v11, v12, v13, v14, v15, v16) --[[ Line: 49 ]] --[[ Name: checkPropTypes ]]
    -- upvalues: v3 (copy), l_Error_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy), v4 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if v11 and v12 then
            v3.warn("You've defined both propTypes and validateProps on " .. (v15 or "a component"));
        end;
        if v12 then
            if typeof(v12) ~= "function" then
                v3.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v12), v15 or ""));
            else
                local v17, v18 = v12(v13);
                if not v17 then
                    v18 = v18 or "<Validator function did not supply a message>";
                    local v19 = ("validateProps failed on a %s type in %s: %s"):format(v14, v15 or "<UNKNOWN Component>", (tostring(v18)));
                    error(v19);
                end;
            end;
        end;
        if v11 then
            for v20, _ in pairs(v11) do
                local _, l_result_0 = pcall(function() --[[ Line: 100 ]]
                    -- upvalues: v11 (copy), v20 (copy), l_Error_0 (ref), v15 (copy), v14 (copy), v13 (copy)
                    if typeof(v11[v20]) ~= "function" then
                        local v22 = l_Error_0.new((v15 or "React class") .. ": " .. v14 .. " type `" .. v20 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v11[v20]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v22.name = "Invariant Violation";
                        error(v22);
                    end;
                    return v11[v20](v13, v20, v15, v14, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end);
                local v25 = typeof(l_result_0) == "table";
                if l_result_0 ~= nil and not v25 then
                    if _G.__DEV__ then
                        if v16 then
                            local l__owner_1 = v16._owner;
                            local v27 = l_describeUnknownElementTypeFrameInDEV_0(v16.type, v16._source, l__owner_1 ~= nil and l__owner_1.type or nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v27);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v3.error(string.format("%s: type specification of %s" .. " `%s` is invalid; the type checker " .. "function must return `nil` or an `Error` but returned a %s. " .. "You may have forgotten to pass an argument to the type checker " .. "creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and " .. "shape all require an argument).", v15 or "React class", v14, v20, (typeof(l_result_0))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v25 and v4[l_result_0.message] == nil then
                    v4[tostring(l_result_0.message)] = true;
                    if _G.__DEV__ then
                        if v16 then
                            local l__owner_2 = v16._owner;
                            local v29 = l_describeUnknownElementTypeFrameInDEV_0(v16.type, v16._source, l__owner_2 ~= nil and l__owner_2.type or nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v29);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v3.warn(string.format("Failed %s type: %s", v14, (tostring(l_result_0.message))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;