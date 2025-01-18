local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetPublishingRequirements);
local _ = require(l_Parent_0.Core.Types.AssetSubTypes);
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
return function(v7, v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy)
    return function(v11) --[[ Line: 18 ]]
        -- upvalues: v9 (ref), v7 (copy), v8 (copy), v10 (copy), v4 (ref), v1 (ref), v3 (ref)
        local _ = v9;
        if v9 == Enum.AssetType.Image then
            v9 = Enum.AssetType.Decal;
        elseif v9 == Enum.AssetType.Mesh then
            v9 = Enum.AssetType.MeshPart;
        end;
        return v7:getPublishingRequirements(v8, v9, v10):andThen(function(v13) --[[ Line: 26 ]]
            -- upvalues: v11 (copy), v4 (ref), v1 (ref), v3 (ref)
            local l_responseBody_0 = v13.responseBody;
            if l_responseBody_0 then
                v11:dispatch(v4(l_responseBody_0));
                return l_responseBody_0;
            else
                if v1.shouldDebugWarnings() then
                    warn("Fetching publishing requirement response body is empty");
                end;
                v11:dispatch(v3(v13));
                return;
            end;
        end, function(v15) --[[ Line: 37 ]]
            -- upvalues: v1 (ref), v11 (copy), v3 (ref)
            if v1.shouldDebugWarnings() then
                warn("Fetching publishing requirement was unsuccessful:", (tostring(v15)));
            end;
            v11:dispatch(v3(v15));
        end);
    end;
end;