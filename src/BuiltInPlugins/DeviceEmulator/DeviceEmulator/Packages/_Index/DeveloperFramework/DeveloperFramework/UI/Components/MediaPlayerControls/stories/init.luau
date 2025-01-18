local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local v3 = require(script.Parent);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v4 = {
        IsPlaying = false, 
        IsLoaded = true, 
        OnPause = function() --[[ Line: 12 ]] --[[ Name: OnPause ]]

        end, 
        OnPlay = function() --[[ Line: 13 ]] --[[ Name: OnPlay ]]

        end, 
        OnScrub = function() --[[ Line: 14 ]] --[[ Name: OnScrub ]]

        end, 
        TimeLength = 90, 
        CurrentTime = 0
    };
    return {
        Paused = v1.createElement(v3, v4), 
        Playing = v1.createElement(v3, v2.Dictionary.join(v4, {
            IsPlaying = true
        })), 
        Loading = v1.createElement(v3, v2.Dictionary.join(v4, {
            IsLoaded = false
        })), 
        WithProgress = v1.createElement(v3, v2.Dictionary.join(v4, {
            IsPlaying = true, 
            CurrentTime = 50
        })), 
        ScrubbingDisabled = v1.createElement(v3, v2.Dictionary.join(v4, {
            IsPlaying = true, 
            CurrentTime = 50, 
            OnScrub = v2.None
        }))
    };
end;