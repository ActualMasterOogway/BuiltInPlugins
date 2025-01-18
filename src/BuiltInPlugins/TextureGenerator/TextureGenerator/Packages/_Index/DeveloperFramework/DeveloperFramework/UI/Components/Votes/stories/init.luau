local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return {
        NoVotes = v1.createElement(v2, {
            Voting = {
                UpVotes = 0, 
                DownVotes = 0
            }
        }), 
        AllUp = v1.createElement(v2, {
            Voting = {
                UpVotes = 11, 
                DownVotes = 0
            }
        }), 
        AllDown = v1.createElement(v2, {
            Voting = {
                UpVotes = 0, 
                DownVotes = 11
            }
        }), 
        Mix = v1.createElement(v2, {
            Voting = {
                UpVotes = 55, 
                DownVotes = 44
            }
        }), 
        NotEnoughVotes = v1.createElement(v2, {
            Voting = {
                Upvotes = 3, 
                DownVotes = 1
            }
        }), 
        IncludeVoteCount = v1.createElement(v2, {
            Voting = {
                UpVotes = 31, 
                DownVotes = 41
            }, 
            IncludeVoteCount = true, 
            TextSize = 14
        })
    };
end;