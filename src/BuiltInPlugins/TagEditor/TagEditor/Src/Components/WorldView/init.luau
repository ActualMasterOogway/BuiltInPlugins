local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(script.WorldVisual);
local v4 = require(script.WorldProvider);
return (v2.connect(function(v5) --[[ Line: 23 ]] --[[ Name: mapStateToProps ]]
    return {
        enabled = v5.WorldView, 
        tags = v5.TagData
    };
end)(function(v6) --[[ Line: 8 ]] --[[ Name: WorldView ]]
    -- upvalues: v1 (copy), v4 (copy), v3 (copy)
    if v6.enabled then
        return v1.createElement(v4, {}, {
            render = function(v7) --[[ Line: 11 ]] --[[ Name: render ]]
                -- upvalues: v1 (ref), v3 (ref), v6 (copy)
                return v1.createElement(v3, {
                    partsList = v7, 
                    tags = v6.tags
                });
            end
        });
    else
        return nil;
    end;
end));