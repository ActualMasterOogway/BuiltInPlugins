local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.UI.Components.Container);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return {
        NoVotes = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 11 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 12 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 0, 
                DownVotes = 0
            }
        }), 
        AllUp = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 20 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 21 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 111, 
                DownVotes = 0
            }
        }), 
        AllDown = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 29 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 30 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 0, 
                DownVotes = 111
            }
        }), 
        Mix = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 38 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 39 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44
            }
        }), 
        CanVote = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 47 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 48 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        }), 
        HasVotedUp = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 57 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 58 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true, 
                UserVote = true
            }
        }), 
        HasVotedDown = v1.createElement(v2, {
            AssetId = 123, 
            OnVoteUp = function() --[[ Line: 68 ]] --[[ Name: OnVoteUp ]]

            end, 
            OnVoteDown = function() --[[ Line: 69 ]] --[[ Name: OnVoteDown ]]

            end, 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true, 
                UserVote = false
            }
        }), 
        LowWidth = v1.createElement(v3, {
            Size = UDim2.new(0, 183, 0, 30)
        }, {
            VoteBar = v1.createElement(v2, {
                AssetId = 123, 
                OnVoteUp = function() --[[ Line: 82 ]] --[[ Name: OnVoteUp ]]

                end, 
                OnVoteDown = function() --[[ Line: 83 ]] --[[ Name: OnVoteDown ]]

                end, 
                Voting = {
                    UpVotes = 55, 
                    DownVotes = 0, 
                    CanVote = true, 
                    UserVote = false
                }
            })
        })
    };
end;