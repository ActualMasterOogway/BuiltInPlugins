local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(script.Parent.console);
local v3 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV;
local v5 = require(script.Parent.ReactSharedInternals);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local l_ReactDebugCurrentFrame_0 = v5.ReactDebugCurrentFrame;
local function _(v8) --[[ Line: 33 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy)
    if _G.__DEV__ then
        if v8 then
            local l__owner_0 = v8._owner;
            local v10 = l_describeUnknownElementTypeFrameInDEV_0(v8.type, v8._source, if l__owner_0 ~= nil then l__owner_0.type else nil);
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v10);
            return;
        else
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        end;
    end;
end;
return function(v12, v13, v14, v15, v16, v17) --[[ Line: 50 ]] --[[ Name: checkPropTypes ]]
    -- upvalues: v2 (copy), l_Error_0 (copy), l_describeError_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy), v3 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if v12 and v13 then
            v2.warn("You've defined both propTypes and validateProps on " .. (v16 or "a component"));
        end;
        if v13 then
            if typeof(v13) ~= "function" then
                v2.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v13), v16 or ""));
            else
                local v18, v19 = v13(v14);
                if not v18 then
                    v19 = v19 or "<Validator function did not supply a message>";
                    local v20 = string.format("validateProps failed on a %s type in %s: %s", v15, v16 or "<UNKNOWN Component>", (tostring(v19)));
                    error(v20);
                end;
            end;
        end;
        if v12 then
            assert(typeof(v12) == "table", "propTypes needs to be a table");
            for v21, _ in v12 do
                local _, v25 = xpcall(function() --[[ Line: 114 ]]
                    -- upvalues: v12 (copy), v21 (copy), l_Error_0 (ref), v16 (copy), v15 (copy), v14 (copy)
                    if typeof(v12[v21]) ~= "function" then
                        local v23 = l_Error_0.new((v16 or "React class") .. ": " .. v15 .. " type `" .. v21 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v12[v21]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v23.name = "Invariant Violation";
                        error(v23);
                    end;
                    return v12[v21](v14, v21, v16, v15, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end, l_describeError_0);
                local v26 = typeof(v25) == "table";
                if v25 ~= nil and not v26 then
                    if _G.__DEV__ then
                        if v17 then
                            local l__owner_1 = v17._owner;
                            local v28 = l_describeUnknownElementTypeFrameInDEV_0(v17.type, v17._source, if l__owner_1 ~= nil then l__owner_1.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v28);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v2.error(string.format("%s: type specification of %s" .. " `%s` is invalid; the type checker " .. "function must return `nil` or an `Error` but returned a %s. " .. "You may have forgotten to pass an argument to the type checker " .. "creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and " .. "shape all require an argument).", v16 or "React class", v15, v21, (typeof(v25))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v26 and v3[v25.message] == nil then
                    v3[tostring(v25.message)] = true;
                    if _G.__DEV__ then
                        if v17 then
                            local l__owner_2 = v17._owner;
                            local v30 = l_describeUnknownElementTypeFrameInDEV_0(v17.type, v17._source, if l__owner_2 ~= nil then l__owner_2.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v30);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v2.warn(string.format("Failed %s type: %s", v15, (tostring(v25.message))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;