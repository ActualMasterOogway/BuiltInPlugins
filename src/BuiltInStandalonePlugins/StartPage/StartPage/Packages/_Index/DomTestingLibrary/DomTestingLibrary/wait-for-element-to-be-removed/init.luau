local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = require(l_Parent_0.Promise);
local v6 = require(script.Parent.jsHelpers.isCallable);
local v7 = {};
local l_waitFor_0 = require(script.Parent["wait-for"]).waitFor;
local function _(v9) --[[ Line: 18 ]] --[[ Name: isRemoved ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    local v10 = not l_Boolean_0.toJSBoolean(v9);
    if not v10 then
        if l_Array_0.isArray(v9) then
            return not l_Boolean_0.toJSBoolean(#v9);
        else
            v10 = false;
        end;
    end;
    return v10;
end;
local function _(v12) --[[ Line: 25 ]] --[[ Name: initialCheck ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy), l_Error_0 (copy)
    if not l_Boolean_0.toJSBoolean(v12) or if l_Array_0.isArray(v12) then not l_Boolean_0.toJSBoolean(#v12) else false then
        error(l_Error_0.new("The element(s) given to waitForElementToBeRemoved are already removed. waitForElementToBeRemoved requires that the element(s) exist(s) before waiting for removal."));
    end;
end;
v7.waitForElementToBeRemoved = function(v14, v15) --[[ Line: 35 ]] --[[ Name: waitForElementToBeRemoved ]]
    -- upvalues: v5 (copy), l_Error_0 (copy), v6 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_waitFor_0 (copy)
    return v5.resolve():andThen(function() --[[ Line: 36 ]]
        -- upvalues: l_Error_0 (ref), v6 (ref), v14 (ref), l_Boolean_0 (ref), l_Array_0 (ref), l_waitFor_0 (ref), v15 (copy)
        local v16 = l_Error_0.new("Timed out in waitForElementToBeRemoved.");
        if not v6(v14) then
            local l_v14_0 = v14;
            if not l_Boolean_0.toJSBoolean(l_v14_0) or if l_Array_0.isArray(l_v14_0) then not l_Boolean_0.toJSBoolean(#l_v14_0) else false then
                error(l_Error_0.new("The element(s) given to waitForElementToBeRemoved are already removed. waitForElementToBeRemoved requires that the element(s) exist(s) before waiting for removal."));
            end;
            l_v14_0 = if l_Array_0.isArray(v14) then v14 else {
                v14
            };
            local v20 = l_Array_0.map(l_v14_0, function(v18) --[[ Line: 42 ]]
                local l_Parent_1 = v18.Parent;
                if l_Parent_1 == nil then
                    return function() --[[ Line: 45 ]]
                        return nil;
                    end;
                else
                    while l_Parent_1.Parent do
                        l_Parent_1 = l_Parent_1.Parent;
                    end;
                    return function() --[[ Line: 52 ]]
                        -- upvalues: l_Parent_1 (ref), v18 (copy)
                        if l_Parent_1:IsAncestorOf(v18) then
                            return v18;
                        else
                            return nil;
                        end;
                    end;
                end;
            end);
            v14 = function() --[[ Line: 59 ]]
                -- upvalues: l_Array_0 (ref), v20 (copy), l_Boolean_0 (ref)
                return l_Array_0.filter(l_Array_0.map(v20, function(v21) --[[ Line: 61 ]]
                    return v21();
                end), l_Boolean_0.toJSBoolean);
            end;
        end;
        local v22 = v14();
        if not l_Boolean_0.toJSBoolean(v22) or if l_Array_0.isArray(v22) then not l_Boolean_0.toJSBoolean(#v22) else false then
            error(l_Error_0.new("The element(s) given to waitForElementToBeRemoved are already removed. waitForElementToBeRemoved requires that the element(s) exist(s) before waiting for removal."));
        end;
        return l_waitFor_0(function() --[[ Line: 71 ]]
            -- upvalues: v14 (ref), l_Boolean_0 (ref), l_Array_0 (ref), v16 (copy)
            local v23 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
                -- upvalues: v23 (ref), v14 (ref)
                v23 = v14();
            end);
            if not l_status_0 then
                if l_result_0.name == "TestingLibraryElementError" then
                    return nil;
                else
                    error(l_result_0);
                end;
            end;
            local l_v23_0 = v23;
            if not (not l_Boolean_0.toJSBoolean(l_v23_0) or if l_Array_0.isArray(l_v23_0) then not l_Boolean_0.toJSBoolean(#l_v23_0) else false) then
                error(v16);
            end;
            return nil;
        end, v15);
    end);
end;
return v7;