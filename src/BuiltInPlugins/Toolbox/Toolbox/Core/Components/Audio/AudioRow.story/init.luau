local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local _ = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Dash);
local v5 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v7 = require(script.Parent.AudioRow);
local v8 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v9 = v2.PureComponent:extend("AudioRowWrapper");
local v10 = {
    Asset = {
        Id = 142376088, 
        Name = "Cascaded Drumming", 
        AssetGenres = nil, 
        TypeId = 10, 
        IsEndorsed = false, 
        Description = "High hat with various percussion sounds. Loud crashes.", 
        Duration = "128", 
        HasScripts = false
    }, 
    AudioDetails = {
        Artist = "OnlyTwentyCharacters", 
        Type = v5.SOUND_EFFECTS.name, 
        SoundEffectCategory = "instruments", 
        SoundEffectSubcategory = "Drum"
    }, 
    Creator = {
        Id = 1, 
        Name = "Rolbox", 
        Type = "User"
    }
};
local v11 = {
    Asset = {
        Id = 142376088, 
        Name = "Cascaded Drumming", 
        AssetGenres = nil, 
        TypeId = 10, 
        IsEndorsed = false, 
        Description = "High hat with various percussion sounds. Loud crashes.", 
        Duration = "508", 
        HasScripts = false
    }, 
    AudioDetails = {
        Type = v5.MUSIC.name, 
        MusicGenre = "rock", 
        Artist = "Artist", 
        MusicAlbum = "asdf"
    }, 
    Creator = {
        Id = 1, 
        Name = "Rolbox", 
        Type = "User"
    }
};
local v12 = {
    Asset = {
        Id = 142376088, 
        Name = "Cascaded Drumming", 
        AssetGenres = nil, 
        TypeId = 10, 
        IsEndorsed = false, 
        Description = "High hat with various percussion sounds. Loud crashes.", 
        HasScripts = false
    }
};
local v13 = {
    Asset = {
        Id = 142376088, 
        Name = "Cascaded Drumming", 
        AssetGenres = nil, 
        TypeId = 10, 
        IsEndorsed = false, 
        Description = "", 
        HasScripts = false
    }, 
    AudioDetails = {
        Type = v5.MUSIC.name
    }
};
local v14 = {
    Asset = {
        Id = 142376088, 
        Name = "Cascaded Drumming", 
        AssetGenres = nil, 
        TypeId = 10, 
        IsEndorsed = false, 
        Description = "", 
        HasScripts = false
    }, 
    AudioDetails = {
        Type = v5.SOUND_EFFECTS.name
    }
};
v9.init = function(v15) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v15.state = {
        expandedAssetId = nil
    };
    v15.toggleIsExpanded = function(v16) --[[ Line: 112 ]]
        -- upvalues: v15 (copy), v2 (ref)
        v15:setState(function(v17) --[[ Line: 113 ]]
            -- upvalues: v16 (copy), v2 (ref)
            return {
                expandedAssetId = if v16 == v17.expandedAssetId then v2.None else v16
            };
        end);
    end;
end;
v9.render = function(v18) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), v4 (copy)
    return v2.createFragment({
        Player = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 116), 
            BackgroundTransparency = 1
        }, {
            Player = v7.Generator(v4.join(v18.props, {
                LayoutOrder = 1, 
                IsExpanded = v18.props.AssetInfo.Asset.Id == v18.state.expandedAssetId, 
                OnExpanded = v18.toggleIsExpanded, 
                ParentAbsoluteSize = UDim2.fromOffset(500, 500), 
                CanInsertAsset = function() --[[ Line: 131 ]] --[[ Name: CanInsertAsset ]]
                    return true;
                end, 
                InsertAsset = function() --[[ Line: 134 ]] --[[ Name: InsertAsset ]]
                    print("Insert Asset");
                end
            }))
        })
    });
end;
return {
    summary = "Audio Row", 
    stories = {
        {
            name = "Soundeffect Odd", 
            story = function() --[[ Line: 147 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v10 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v10, 
                        LayoutOrder = 1
                    })
                });
            end
        }, 
        {
            name = "Soundeffect Even", 
            story = function() --[[ Line: 158 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v10 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v10, 
                        LayoutOrder = 2
                    })
                });
            end
        }, 
        {
            name = "Music Odd", 
            story = function() --[[ Line: 169 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v11 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v11, 
                        LayoutOrder = 1
                    })
                });
            end
        }, 
        {
            name = "Music Even", 
            story = function() --[[ Line: 180 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v11 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v11, 
                        LayoutOrder = 2
                    })
                });
            end
        }, 
        {
            name = "Empty Music", 
            story = function() --[[ Line: 191 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v13 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v13, 
                        LayoutOrder = 2
                    })
                });
            end
        }, 
        {
            name = "Empty SoundEffect", 
            story = function() --[[ Line: 202 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v14 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v14, 
                        LayoutOrder = 2
                    })
                });
            end
        }, 
        {
            name = "Uncategorized", 
            story = function() --[[ Line: 213 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v8 (copy), v9 (copy), v12 (copy)
                return v2.createElement(v8, {}, {
                    AudioRow = v2.createElement(v9, {
                        AssetInfo = v12, 
                        LayoutOrder = 2
                    })
                });
            end
        }
    }
};