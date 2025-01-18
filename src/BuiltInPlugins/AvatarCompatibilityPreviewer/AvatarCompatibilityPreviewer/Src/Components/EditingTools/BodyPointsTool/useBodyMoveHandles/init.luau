local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerFramework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_MoveHandles_0 = v1.Handles.MoveHandles;
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: useBodyMoveHandles ]]
    -- upvalues: v2 (copy), l_MoveHandles_0 (copy)
    local v11 = v2.useMemo(function() --[[ Line: 13 ]]
        -- upvalues: v7 (copy)
        local v8 = nil;
        return {
            beginDrag = function() --[[ Line: 17 ]] --[[ Name: beginDrag ]]
                -- upvalues: v8 (ref), v7 (ref)
                v8 = v7:GetPivot();
            end, 
            updateDrag = function(_, v10) --[[ Line: 21 ]] --[[ Name: updateDrag ]]
                -- upvalues: v8 (ref), v7 (ref)
                assert(v8 ~= nil, "startDragPivot not set during updateDrag");
                v7:PivotTo(v8 * v10);
                return v10;
            end, 
            endDrag = function() --[[ Line: 29 ]] --[[ Name: endDrag ]]
                -- upvalues: v8 (ref)
                v8 = nil;
            end, 
            render = function() --[[ Line: 33 ]] --[[ Name: render ]]
                return nil;
            end
        };
    end, {
        v7
    });
    return v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: l_MoveHandles_0 (ref), v6 (copy), v11 (copy)
        return l_MoveHandles_0.new(v6, {
            ShowBoundingBox = false, 
            Summonable = false, 
            Outset = 1
        }, v11);
    end, {
        v11
    });
end;