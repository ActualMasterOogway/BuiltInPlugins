local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
return {
    PruneSelectedTracks = function(v4, v5) --[[ Line: 16 ]] --[[ Name: PruneSelectedTracks ]]
        -- upvalues: v1 (copy)
        local v6 = {};
        local v7 = false;
        if v5 then
            for _, v9 in ipairs(v5) do
                if v1.getTrack(v4, "Root", v9) then
                    table.insert(v6, v9);
                else
                    v7 = true;
                end;
            end;
        end;
        return v6, v7;
    end
};