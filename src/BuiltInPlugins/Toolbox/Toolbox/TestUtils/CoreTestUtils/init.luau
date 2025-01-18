local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ThunkWithArgsMiddleware_0 = require(l_Packages_0.Framework).Util.ThunkWithArgsMiddleware;
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
return {
    createThunkMiddleware = function() --[[ Line: 22 ]] --[[ Name: createThunkMiddleware ]]
        -- upvalues: v4 (copy), l_ThunkWithArgsMiddleware_0 (copy)
        local v5 = {};
        if v4() then
            v5.SerializeInstances = function(_, v7) --[[ Line: 25 ]] --[[ Name: SerializeInstances ]]
                assert(typeof(v7) == "table", "Instances must be a table");
                for _, v9 in ipairs(v7) do
                    assert(v9:IsA("Instance"));
                end;
                return "TEST";
            end;
        else
            v5.DEPRECATED_SerializeInstances = function(_, v11) --[[ Line: 33 ]] --[[ Name: DEPRECATED_SerializeInstances ]]
                assert(typeof(v11) == "table", "Instances must be a table");
                for _, v13 in ipairs(v11) do
                    assert(v13:IsA("Instance"));
                end;
                return "TEST";
            end;
        end;
        return {
            l_ThunkWithArgsMiddleware_0({
                StudioAssetService = v5
            })
        };
    end, 
    mustSetFlag = function(v14, v15) --[[ Line: 12 ]] --[[ Name: mustSetFlag ]]
        -- upvalues: v2 (copy)
        return v2.createElement("TextLabel", {
            Text = string.format("You must set %s to %s to view this story", v14, (tostring(v15))), 
            Size = UDim2.new(1, 0, 0, 100), 
            TextSize = 18, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        });
    end
};