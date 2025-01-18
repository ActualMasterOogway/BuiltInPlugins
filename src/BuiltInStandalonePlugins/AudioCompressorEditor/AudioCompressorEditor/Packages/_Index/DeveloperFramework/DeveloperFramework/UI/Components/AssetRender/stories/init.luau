local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Model_0 = Instance.new("Model");
    Instance.new("Part").Parent = l_Model_0;
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "otherPart";
    l_Part_0.Parent = l_Model_0;
    local l_Decal_0 = Instance.new("Decal");
    l_Decal_0.Texture = "http://www.roblox.com/asset/?id=23156312";
    local l_Model_1 = Instance.new("Model");
    Instance.new("Part").Parent = l_Model_1;
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.Parent = l_Model_1;
    l_Sound_0.SoundId = "rbxassetid://1837461008";
    local l_Model_2 = Instance.new("Model");
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Parent = l_Model_2;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Name = "Grandchild";
    l_Part_2.Parent = l_Part_1;
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = "MyScript";
    l_Script_0.Source = "\t\terror(\"Hello world from AssetRender\")\n\t";
    l_Script_0.Parent = l_Model_2;
    local v12 = {
        Asset = {}
    };
    return {
        Loading = v1.createElement(v2, {
            Width = 360, 
            AssetData = v12
        }), 
        Model = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = l_Model_0, 
            AssetData = v12
        }), 
        ModelWithoutInstance = v1.createElement(v2, {
            Width = 360, 
            AssetData = {
                Asset = {
                    Id = 53326, 
                    TypeId = Enum.AssetType.Model.Value
                }
            }
        }), 
        Plugin = v1.createElement(v2, {
            Width = 360, 
            AssetData = {
                Asset = {
                    Id = 2525227847, 
                    TypeId = Enum.AssetType.Plugin.Value
                }
            }
        }), 
        Thumbnail = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = l_Script_0, 
            AssetData = v12
        }), 
        Image = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = l_Decal_0, 
            AssetData = v12
        }), 
        Sound = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = Instance.new("Sound"), 
            AssetData = {
                Asset = {
                    Id = 1838601237
                }
            }
        }), 
        Video = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = Instance.new("VideoFrame"), 
            AssetData = {
                Asset = {
                    Id = 5608250999
                }
            }
        }), 
        FontFamily = v1.createElement(v2, {
            AssetData = {
                Asset = {
                    Id = 8836875837, 
                    TypeId = Enum.AssetType.FontFamily.Value
                }
            }, 
            Width = 360
        }), 
        SoundDisableTreeView = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = Instance.new("Sound"), 
            DisableTreeView = true, 
            AssetData = {
                Asset = {
                    Id = 1838601237
                }
            }
        }), 
        VideoDisableTreeView = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = Instance.new("VideoFrame"), 
            DisableTreeView = true, 
            AssetData = {
                Asset = {
                    Id = 5608250999
                }
            }
        }), 
        SoundInModel = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = l_Model_1, 
            AssetData = v12
        }), 
        ScriptInModel = v1.createElement(v2, {
            Width = 360, 
            AssetInstance = l_Model_2, 
            AssetData = v12
        })
    };
end;