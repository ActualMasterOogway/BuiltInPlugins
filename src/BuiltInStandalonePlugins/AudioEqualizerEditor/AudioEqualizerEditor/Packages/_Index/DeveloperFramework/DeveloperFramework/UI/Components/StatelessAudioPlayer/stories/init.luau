local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util.Signal);
local v3 = require(l_Parent_0.Util.Immutable);
local v4 = require(script.Parent);
return function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v3 (copy)
    local v5 = {
        SoundId = "rbxassetid://1837461008", 
        IsPlaying = false, 
        IsLoaded = true, 
        TimeLength = 120, 
        CurrentTime = 0, 
        OnEnd = function() --[[ Line: 16 ]] --[[ Name: OnEnd ]]

        end, 
        OnPause = function() --[[ Line: 17 ]] --[[ Name: OnPause ]]

        end, 
        OnPlay = function() --[[ Line: 18 ]] --[[ Name: OnPlay ]]

        end, 
        SetIsLoaded = function() --[[ Line: 19 ]] --[[ Name: SetIsLoaded ]]

        end, 
        SetCurrentTime = function() --[[ Line: 20 ]] --[[ Name: SetCurrentTime ]]

        end, 
        SetTimeLength = function() --[[ Line: 21 ]] --[[ Name: SetTimeLength ]]

        end, 
        MediaPlayerSignal = v2.new()
    };
    return {
        Paused = v1.createElement(v4, v5), 
        PausedLoading = v1.createElement(v4, v3.JoinDictionaries(v5, {
            IsLoaded = false
        })), 
        Playing = v1.createElement(v4, v3.JoinDictionaries(v5, {
            IsPlaying = true
        })), 
        PlayingProgress = v1.createElement(v4, v3.JoinDictionaries(v5, {
            IsPlaying = true, 
            CurrentTime = 59
        })), 
        PlayingLoading = v1.createElement(v4, v3.JoinDictionaries(v5, {
            IsPlaying = true, 
            IsLoaded = false
        }))
    };
end;