local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.Constants);
local v2 = require(l_Parent_0.src.actions.SetScreen);
local v3 = require(l_Parent_0.src.actions.SetError);
local v4 = require(l_Parent_0.src.actions.ClosePlugin);
local v5 = require(l_Parent_0.src.utils.getLinesFromStr);
local v6 = require(l_Parent_0.src.utils.setupImportedAvatar);
return function(v7) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), v4 (copy), v5 (copy), v3 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v2 (ref), v1 (ref), v7 (copy), v6 (ref), v4 (ref), v5 (ref), v3 (ref)
        v8:dispatch(v2(v1.SCREENS.LOADING));
        local v9 = v7 ~= v1.AVATAR_TYPE.CUSTOM;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: v9 (copy)
            return game:GetService("AvatarImportService"):ImportFbxRigWithoutSceneLoad(v9);
        end);
        if l_status_0 then
            v6(l_result_0, v7);
            v8:dispatch(v4(true));
            return;
        elseif l_result_0 == v1.ERROR_NO_FILE then
            v8:dispatch(v2(v1.SCREENS.AVATAR));
            return;
        else
            local v12 = "<filename>";
            local l_l_result_0_0 = l_result_0;
            local v14 = v5(l_result_0);
            if v14[1] == "FBX Import Error(s):" and #v14 >= 3 then
                v12 = v14[2];
                for v15 = 3, #v14 do
                    v14[v15] = "- " .. v14[v15];
                end;
                l_l_result_0_0 = table.concat(v14, "\n", 3);
            end;
            v8:dispatch(v3(v12, l_l_result_0_0));
            v8:dispatch(v2(v1.SCREENS.ERROR));
            return;
        end;
    end;
end;