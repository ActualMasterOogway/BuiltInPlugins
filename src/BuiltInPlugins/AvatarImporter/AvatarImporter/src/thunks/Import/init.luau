local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.Globals);
local v2 = require(l_Parent_0.src.Constants);
local v3 = require(l_Parent_0.src.actions.SetScreen);
local v4 = require(l_Parent_0.src.actions.SetError);
local v5 = require(l_Parent_0.src.actions.ClosePlugin);
local v6 = require(l_Parent_0.src.utils.getLinesFromStr);
local v7 = require(l_Parent_0.src.utils.setupImportedAvatar);
return function(v8) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy), v7 (copy), v5 (copy), v6 (copy), v4 (copy)
    local v9 = v8 ~= v2.AVATAR_TYPE.CUSTOM;
    return function(v10) --[[ Line: 19 ]]
        -- upvalues: v3 (ref), v2 (ref), v1 (ref), v9 (copy), v7 (ref), v8 (copy), v5 (ref), v6 (ref), v4 (ref)
        v10:dispatch(v3(v2.SCREENS.LOADING));
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
            -- upvalues: v1 (ref), v9 (ref)
            return v1.plugin:ImportFbxRig(v9);
        end);
        if l_status_0 then
            v7(l_result_0, v8);
            v10:dispatch(v5(true));
            return;
        elseif l_result_0 == v2.ERROR_NO_FILE then
            v10:dispatch(v3(v2.SCREENS.AVATAR));
            return;
        else
            local v13 = "<filename>";
            local l_l_result_0_0 = l_result_0;
            local v15 = v6(l_result_0);
            if v15[1] == "FBX Import Error(s):" and #v15 >= 3 then
                v13 = v15[2];
                for v16 = 3, #v15 do
                    v15[v16] = "- " .. v15[v16];
                end;
                l_l_result_0_0 = table.concat(v15, "\n", 3);
            end;
            v10:dispatch(v4(v13, l_l_result_0_0));
            v10:dispatch(v3(v2.SCREENS.ERROR));
            return;
        end;
    end;
end;