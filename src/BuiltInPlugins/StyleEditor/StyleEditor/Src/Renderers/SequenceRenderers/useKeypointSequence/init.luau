local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_useState_0 = require(l_Parent_0.Packages.React).useState;
local v2 = require(l_Parent_0.Src.Renderers.SequenceRenderers.KeypointSequence);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
return function(v4) --[[ Line: 28 ]]
    -- upvalues: l_useState_0 (copy), v2 (copy)
    local v5, v6 = l_useState_0({
        Keypoints = v4, 
        Selected = 1
    });
    local function v8(v7) --[[ Line: 34 ]] --[[ Name: resetKeypoints ]]
        -- upvalues: v6 (copy)
        v6({
            Keypoints = v7, 
            Selected = 1
        });
    end;
    local function v11(v9) --[[ Line: 41 ]] --[[ Name: updateKeypoint ]]
        -- upvalues: v6 (copy), v2 (ref)
        v6(function(v10) --[[ Line: 42 ]]
            -- upvalues: v2 (ref), v9 (copy)
            return v2.updateSelected(v10, v9);
        end);
    end;
    local function v14(v12) --[[ Line: 47 ]] --[[ Name: addKeypoint ]]
        -- upvalues: v6 (copy), v2 (ref)
        v6(function(v13) --[[ Line: 48 ]]
            -- upvalues: v2 (ref), v12 (copy)
            return v2.add(v13, v12);
        end);
    end;
    local function v16() --[[ Line: 53 ]] --[[ Name: removeKeypoint ]]
        -- upvalues: v6 (copy), v2 (ref)
        v6(function(v15) --[[ Line: 54 ]]
            -- upvalues: v2 (ref)
            return v2.removeSelected(v15);
        end);
    end;
    local function v19(v17) --[[ Line: 59 ]] --[[ Name: selectKeypoint ]]
        -- upvalues: v6 (copy), v2 (ref)
        v6(function(v18) --[[ Line: 60 ]]
            -- upvalues: v2 (ref), v17 (copy)
            return v2.select(v18, v17);
        end);
    end;
    local function v22(v20) --[[ Line: 65 ]] --[[ Name: save ]]
        -- upvalues: v6 (copy)
        v6(function(v21) --[[ Line: 66 ]]
            -- upvalues: v20 (copy)
            v20(v21.Keypoints);
            return v21;
        end);
    end;
    local function v23() --[[ Line: 73 ]] --[[ Name: isFixedKeypointSelected ]]
        -- upvalues: v2 (ref), v5 (copy)
        return v2.isFixedKeypointSelected(v5);
    end;
    local function v24() --[[ Line: 77 ]] --[[ Name: getSelectedKeypoint ]]
        -- upvalues: v2 (ref), v5 (copy)
        return v2.selectedKeypoint(v5);
    end;
    return {
        keypoints = v5.Keypoints, 
        selectedIndex = v5.Selected, 
        reset = v8, 
        update = v11, 
        add = v14, 
        remove = v16, 
        select = v19, 
        save = v22, 
        isFixedKeypointSelected = v23, 
        getSelectedKeypoint = v24
    };
end;