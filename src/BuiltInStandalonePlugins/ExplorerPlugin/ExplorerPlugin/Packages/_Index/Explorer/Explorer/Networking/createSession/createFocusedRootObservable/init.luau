local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Observable);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: createFocusedRootObservable ]]
    -- upvalues: v1 (copy)
    local function _() --[[ Line: 10 ]] --[[ Name: getFocus ]]
        -- upvalues: v4 (copy), v3 (copy)
        return v4.get() or v3.get();
    end;
    local v6, v7 = v1.create(v4.get() or v3.get());
    local function v8() --[[ Line: 16 ]] --[[ Name: updateFocus ]]
        -- upvalues: v7 (copy), v4 (copy), v3 (copy)
        v7(v4.get() or v3.get());
    end;
    v3.changedSignal:Connect(v8);
    v4.changedSignal:Connect(v8);
    return v6;
end;