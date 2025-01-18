local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v3, v4, v5, v6) --[[ Line: 10 ]] --[[ Name: activeInputsReducer ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v4 == Enum.UserInputState.Begin or v4 == Enum.UserInputState.Change then
        return (v1.Dictionary.join(v3, {
            [v5] = v6
        }));
    else
        if v4 == Enum.UserInputState.End or v6 == v2.VECTOR_RELEASED then
            v3 = v1.Dictionary.join(v3, {
                [v5] = v1.None
            });
        end;
        return v3;
    end;
end;