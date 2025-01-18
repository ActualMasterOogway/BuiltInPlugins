local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.CircularProgressBar);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local function v8(v5) --[[ Line: 7 ]] --[[ Name: Story ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v6, v7 = v2.useBinding(v5.progress);
    v2.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: v7 (copy), v5 (copy)
        v7(v5.progress);
    end, {
        v5.progress
    });
    return v2.createElement(v4, {
        tag = "size-1000-1000"
    }, {
        ProgressBar = v2.createElement(v3, {
            progress = v6
        })
    });
end;
return {
    summary = "CircularProgressBar", 
    stories = {
        {
            name = "CircularProgressBar", 
            story = function(v9) --[[ Line: 28 ]] --[[ Name: story ]]
                -- upvalues: v8 (copy)
                return v8({
                    progress = math.clamp(v9.controls.progress / 100, 0, 1)
                });
            end
        }
    }, 
    controls = {
        progress = 0
    }
};