local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v4 = require(script.Parent.AudioTable);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v6 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v7 = v2.PureComponent:extend("AudioRowWrapper");
createAudioInfo = function(v8) --[[ Line: 13 ]] --[[ Name: createAudioInfo ]]
    -- upvalues: v3 (copy)
    return {
        Asset = {
            Id = v8, 
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
            Type = v3.SOUND_EFFECTS.name, 
            SoundEffectCategory = "instruments", 
            SoundEffectSubcategory = "Drum"
        }, 
        Creator = {
            Id = 1, 
            Name = "Rolbox", 
            Type = "User"
        }
    };
end;
local v9 = {};
for v10 = 1, 10 do
    table.insert(v9, createAudioInfo(v10));
end;
v7.render = function(v11) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), v9 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, -10, 0, 260), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        AudioTable = v4.Generator({
            Assets = v9, 
            AudioType = v11.props.AudioType, 
            CanInsertAsset = function() --[[ Line: 53 ]] --[[ Name: CanInsertAsset ]]
                return true;
            end, 
            InsertAsset = function() --[[ Line: 56 ]] --[[ Name: InsertAsset ]]
                print("Insert Asset");
            end, 
            TryInsert = function() --[[ Line: 59 ]] --[[ Name: TryInsert ]]
                print("Try Insert");
            end, 
            TryOpenAssetConfig = function() --[[ Line: 62 ]] --[[ Name: TryOpenAssetConfig ]]
                print("try open asset config");
            end, 
            OnAssetPreviewButtonClicked = function() --[[ Line: 65 ]] --[[ Name: OnAssetPreviewButtonClicked ]]
                print("OnAssetPreviewButtonClicked");
            end, 
            SwimlaneName = "test"
        })
    });
end;
return {
    summary = "Audio Table", 
    stories = {
        {
            name = "Soundeffect", 
            story = function() --[[ Line: 78 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v7 (copy), v3 (copy)
                return v2.createElement(v6, {}, {
                    AudioTableWrapper = v2.createElement(v7, {
                        AudioType = v3.SOUND_EFFECTS.name
                    })
                });
            end
        }, 
        {
            name = "Music", 
            story = function() --[[ Line: 88 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v7 (copy), v3 (copy)
                return v2.createElement(v6, {}, {
                    AudioTableWrapper = v2.createElement(v7, {
                        AudioType = v3.MUSIC.name
                    })
                });
            end
        }, 
        {
            name = "Uncategorized", 
            story = function() --[[ Line: 98 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v6 (copy), v7 (copy)
                return v2.createElement(v6, {}, {
                    AudioTableWrapper = v2.createElement(v7)
                });
            end
        }
    }
};