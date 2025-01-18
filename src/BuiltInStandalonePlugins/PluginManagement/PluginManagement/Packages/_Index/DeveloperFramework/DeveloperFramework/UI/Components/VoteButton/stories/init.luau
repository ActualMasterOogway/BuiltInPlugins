local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        UpVote = v1.createElement(v2, {
            AssetId = 123, 
            CanVote = true, 
            OnClick = function() --[[ Line: 11 ]] --[[ Name: OnClick ]]

            end, 
            VoteType = v2.VoteType.UpVote
        }), 
        DownVote = v1.createElement(v2, {
            AssetId = 123, 
            CanVote = true, 
            OnClick = function() --[[ Line: 18 ]] --[[ Name: OnClick ]]

            end, 
            VoteType = v2.VoteType.DownVote
        }), 
        DisabledVote = v1.createElement(v2, {
            AssetId = 123, 
            CanVote = false, 
            OnClick = function() --[[ Line: 25 ]] --[[ Name: OnClick ]]

            end, 
            VoteType = v2.VoteType.DownVote
        }), 
        HasVotedDown = v1.createElement(v2, {
            AssetId = 123, 
            CanVote = true, 
            OnClick = function() --[[ Line: 32 ]] --[[ Name: OnClick ]]

            end, 
            UserVote = false, 
            VoteType = v2.VoteType.DownVote
        }), 
        HasVotedUp = v1.createElement(v2, {
            AssetId = 123, 
            CanVote = true, 
            OnClick = function() --[[ Line: 40 ]] --[[ Name: OnClick ]]

            end, 
            UserVote = true, 
            VoteType = v2.VoteType.UpVote
        })
    };
end;