local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.UI.Components.Container);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return {
        Everything = v1.createElement(v2, {
            Favorites = {
                Count = 10500, 
                IsFavorited = false, 
                OnClick = function() --[[ Line: 13 ]] --[[ Name: OnClick ]]

                end
            }, 
            HasScripts = true, 
            IsPackage = true, 
            LastUpdatedDate = "2016-06-14T18:43:37Z", 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        }), 
        HasScripts = v1.createElement(v2, {
            Favorites = nil, 
            HasScripts = true, 
            IsPackage = false, 
            LastUpdatedDate = "2016-06-14T18:43:37Z", 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        }), 
        IsPackage = v1.createElement(v2, {
            Favorites = nil, 
            HasScripts = false, 
            IsPackage = true, 
            LastUpdatedDate = "2016-06-14T18:43:37Z", 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        }), 
        IsPackageNoUpdateDate = v1.createElement(v2, {
            Favorites = nil, 
            HasScripts = false, 
            IsPackage = true, 
            LastUpdatedDate = nil, 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        }), 
        LowWidth = v1.createElement(v3, {
            Size = UDim2.new(0, 183, 0, 30)
        }, {
            AssetPreviewDetails = v1.createElement(v2, {
                HasScripts = true, 
                IsPackage = true, 
                LastUpdatedDate = "2016-06-14T18:43:37Z", 
                Voting = {
                    UpVotes = 55, 
                    DownVotes = 0, 
                    CanVote = true, 
                    UserVote = false
                }
            })
        }), 
        NoVotes = v1.createElement(v2, {
            Favorites = nil, 
            HasScripts = false, 
            IsPackage = false, 
            LastUpdatedDate = "2016-06-14T18:43:37Z", 
            Voting = {
                UpVotes = 0, 
                DownVotes = 0
            }
        }), 
        VotesOnly = v1.createElement(v2, {
            Favorites = nil, 
            HasScripts = false, 
            IsPackage = false, 
            LastUpdatedDate = "2016-06-14T18:43:37Z", 
            Voting = {
                UpVotes = 55, 
                DownVotes = 44, 
                CanVote = true
            }
        })
    };
end;