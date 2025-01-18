local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.src.thunks.ImportWithoutSceneLoad);
local v2 = require(l_Parent_0.src.Constants);
local v3 = require(l_Parent_0.src.utils.getLinesFromStr);
local v4 = require(l_Parent_0.src.actions.SetScreen);
local v5 = require(l_Parent_0.src.actions.SetError);
return function() --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v3 (copy), v5 (copy)
    return function(v6) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v2 (ref), v1 (ref), v3 (ref), v5 (ref)
        v6:dispatch(v4(v2.SCREENS.LOADING));
        local function v8(v7) --[[ Line: 16 ]] --[[ Name: redirectRig ]]
            -- upvalues: v6 (copy), v4 (ref), v2 (ref), v1 (ref)
            if v7 then
                v6:dispatch(v4(v2.SCREENS.REDIRECT_RIG));
                return;
            else
                v6:dispatch(v1(v2.AVATAR_TYPE.CUSTOM));
                return;
            end;
        end;
        local _, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: v8 (copy)
            return game:GetService("AvatarImportService"):LoadRigAndDetectType(v8);
        end);
        if l_result_0 then
            local v11 = "<filename>";
            local l_l_result_0_0 = l_result_0;
            local v13 = v3(l_result_0);
            if v13[1] == "FBX Import Error(s):" and #v13 >= 3 then
                v11 = v13[2];
                for v14 = 3, #v13 do
                    v13[v14] = "- " .. v13[v14];
                end;
                l_l_result_0_0 = table.concat(v13, "\n", 3);
            end;
            v6:dispatch(v5(v11, l_l_result_0_0));
            v6:dispatch(v4(v2.SCREENS.ERROR));
        end;
    end;
end;