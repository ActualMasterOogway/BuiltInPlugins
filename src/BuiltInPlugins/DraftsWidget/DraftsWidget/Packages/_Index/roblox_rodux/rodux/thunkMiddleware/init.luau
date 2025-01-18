local function v1(v0) --[[ Line: 7 ]] --[[ Name: tracebackReporter ]]
    return debug.traceback(v0);
end;
return function(v2, v3) --[[ Line: 11 ]] --[[ Name: thunkMiddleware ]]
    -- upvalues: v1 (copy)
    return function(v4) --[[ Line: 12 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (copy)
        if typeof(v4) == "function" then
            local v5, v6 = xpcall(function() --[[ Line: 14 ]]
                -- upvalues: v4 (copy), v3 (ref)
                return v4(v3);
            end, v1);
            if not v5 then
                v3._errorReporter.reportReducerError(v3:getState(), v4, {
                    message = "Caught error in thunk", 
                    thrownValue = v6
                });
                return nil;
            else
                return v6;
            end;
        else
            return v2(v4);
        end;
    end;
end;