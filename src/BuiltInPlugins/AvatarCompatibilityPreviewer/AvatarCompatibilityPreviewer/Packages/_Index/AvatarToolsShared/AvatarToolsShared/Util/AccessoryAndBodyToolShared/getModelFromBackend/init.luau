local l_InsertService_0 = game:GetService("InsertService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.BundleImporter);
return function(v3, v4, v5) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_InsertService_0 (copy)
    local v6 = nil;
    local v7 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy), v7 (ref), v2 (ref), v3 (copy), v4 (copy), v6 (ref), l_InsertService_0 (ref)
        if v5 then
            v7 = v2.getAvatarFromBundleId(v3, v4);
            return;
        else
            v6 = l_InsertService_0:LoadAsset(v4);
            v7 = v6:GetChildren()[1];
            return;
        end;
    end);
    if l_status_0 then
        v7.Parent = nil;
        v7.Archivable = false;
        if v6 then
            v6:Destroy();
        end;
        return v7;
    else
        warn("unable to insert model because: " .. l_result_0);
        return;
    end;
end;