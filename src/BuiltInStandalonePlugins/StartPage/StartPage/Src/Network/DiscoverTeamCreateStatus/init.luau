local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFIntDebugLuaStartPageLogging)();
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageTeamCreateStatus)();
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Models.MultiGetTeamCreateStatusResponse);
local v5 = require(l_script_FirstAncestor_0.Src.Network.Urls);
local l_Networking_0 = require(l_script_FirstAncestor_0.Src.Util.Services).Networking;
local v7 = require(l_script_FirstAncestor_0.Src.Util.createResponseValidator);
local v8 = l_Networking_0.new({
    isInternal = true, 
    loggingLevel = v1
});
local l_collectArray_0 = require(l_script_FirstAncestor_0.Packages.Dash).collectArray;
local v10 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
return function(v11) --[[ Line: 31 ]] --[[ Name: DiscoverTeamCreateStatus ]]
    -- upvalues: v2 (copy), v5 (copy), v8 (copy), v7 (copy), v4 (copy), l_collectArray_0 (copy), v10 (copy)
    assert(v2, "Only use DiscoverTeamCreateStatus with FFlagLuaStartPageTeamCreateStatus on");
    if #v11 == 0 then
        return;
    else
        local v12 = {
            ids = v11
        };
        local v13 = v5.MULTI_TEAM_CREATE_STATUS.Prefix .. v5.MULTI_TEAM_CREATE_STATUS.Url() .. "?";
        for _, v15 in v12.ids do
            v13 = v13 .. "ids=" .. v15 .. "&";
        end;
        local v16 = v8:get(v13);
        v8:parseJson(v16):andThen(v7(v4.validate)):andThen(function(v17) --[[ Line: 52 ]]
            -- upvalues: l_collectArray_0 (ref), v10 (ref)
            local v20 = l_collectArray_0(v17.data, function(_, v19) --[[ Line: 55 ]]
                return {
                    Id = v19.id, 
                    IsTeamCreateEnabled = v19.isEnabled
                };
            end);
            v10:upsertItems(v20);
        end):catch(function(v21) --[[ Line: 64 ]]
            warn((("DiscoverTeamCreateStatus experienced an error: %*"):format(v21)));
        end);
        return;
    end;
end;