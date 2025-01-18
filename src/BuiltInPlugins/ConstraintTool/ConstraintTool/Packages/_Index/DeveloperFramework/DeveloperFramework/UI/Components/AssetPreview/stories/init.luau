local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
local v3 = require(l_Parent_0.Parent.Cryo);
local v4 = require(l_Parent_0.UI.Components.Pane);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
return function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    local l_Model_0 = Instance.new("Model");
    Instance.new("Part").Parent = l_Model_0;
    local v7 = {
        AssetData = {
            Asset = {
                TypeId = 10, 
                Updated = "6/14/2016 6:43:37 PM", 
                Id = 1234, 
                AssetGenres = {}, 
                Description = "Cause heck, why not? \r\n\r\nA pine tree is cool, right? And here is some very long text that I have added specificially to test wrapping.", 
                Name = "Pine Tree with a very long name", 
                IsEndorsed = true, 
                Created = "10/21/2014 8:59:44 PM"
            }, 
            Creator = {
                Name = "Someone", 
                Type = 1, 
                Id = 5678
            }, 
            Thumbnail = {
                EndpointType = "Avatar", 
                Url = "rbxasset://textures/face.png", 
                Final = true, 
                UserId = 0
            }
        }, 
        AssetInstance = l_Model_0, 
        ActionText = "Insert", 
        OnClickAction = function() --[[ Line: 42 ]] --[[ Name: OnClickAction ]]

        end, 
        OnClickCreator = function() --[[ Line: 43 ]] --[[ Name: OnClickCreator ]]

        end, 
        OnClickContext = function() --[[ Line: 44 ]] --[[ Name: OnClickContext ]]

        end, 
        Favorites = {
            Count = 10500, 
            IsFavorited = false, 
            OnClick = function() --[[ Line: 48 ]] --[[ Name: OnClick ]]

            end
        }, 
        Voting = {
            UpVotes = 5, 
            DownVotes = 4
        }, 
        OnVoteUp = function() --[[ Line: 54 ]] --[[ Name: OnVoteUp ]]

        end, 
        OnVoteDown = function() --[[ Line: 55 ]] --[[ Name: OnVoteDown ]]

        end
    };
    return {
        Basic = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0)
            }))
        }), 
        BasicNoDescription = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        Description = v3.None
                    })
                })
            }))
        }), 
        BasicVideo = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        Id = 5608250999, 
                        TypeId = Enum.AssetType.Video.Value
                    })
                })
            }))
        }), 
        BasicWithISODates = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        Created = "2014-10-21T08:59:44Z", 
                        Updated = "2016-06-14T18:43:37Z"
                    })
                })
            }))
        }), 
        BasicWithRawDates = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        CreatedRaw = "/Date(1413925184257)/", 
                        UpdatedRaw = "/Date(1413925184257)/"
                    })
                })
            }))
        }), 
        BasicWithDescriptionLinks = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        Description = "See the web marketplace at https://create.roblox.com/marketplace"
                    })
                })
            }))
        }), 
        NoVoting = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                Voting = v3.None
            }))
        }), 
        Scrolling = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 500)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0)
            }))
        }), 
        FontFamily = v1.createElement(v4, {
            Size = UDim2.new(0, 368, 0, 700)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 368, 1, 0), 
                AssetData = v3.Dictionary.join(v7.AssetData, {
                    Asset = v3.Dictionary.join(v7.AssetData.Asset, {
                        Id = 8836875837, 
                        TypeId = Enum.AssetType.FontFamily.Value
                    })
                })
            }))
        }), 
        Narrow = v1.createElement(v4, {
            Size = UDim2.new(0, 207, 0, 750)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 207, 1, 0)
            }))
        }), 
        Footer = v1.createElement(v4, {
            Size = UDim2.new(0, 207, 0, 750)
        }, {
            v1.createElement(v2, v3.Dictionary.join(v7, {
                Size = UDim2.new(0, 207, 1, 0), 
                RenderFooter = function(v8) --[[ Line: 211 ]] --[[ Name: RenderFooter ]]
                    -- upvalues: v1 (ref), v5 (ref), v3 (ref)
                    return v1.createElement(v5, v3.Dictionary.join(v8, {
                        Text = "Hello world from Footer", 
                        Size = UDim2.fromScale(1, 0)
                    }));
                end
            }))
        })
    };
end;