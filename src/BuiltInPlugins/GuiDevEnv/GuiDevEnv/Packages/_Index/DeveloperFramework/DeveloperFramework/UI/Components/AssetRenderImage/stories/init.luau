local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
return function() --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v2 = require(script.Parent);
    local l_Decal_0 = Instance.new("Decal");
    l_Decal_0.Texture = "rbxassetid://23156312";
    local l_Texture_0 = Instance.new("Texture");
    l_Texture_0.Texture = "rbxassetid://23156312";
    local l_Sky_0 = Instance.new("Sky");
    l_Sky_0.SkyboxFt = "rbxasset://textures/sky/sky512_ft.tex";
    local v6 = UDim2.new(1, 0, 0, 100);
    return {
        Decal = v1.createElement(v2, {
            Size = v6, 
            Image = l_Decal_0
        }), 
        Texture = v1.createElement(v2, {
            Size = v6, 
            Image = l_Texture_0
        }), 
        Sky = v1.createElement(v2, {
            Size = v6, 
            Image = l_Sky_0
        }), 
        Thumbnail = v1.createElement(v2, {
            Size = v6, 
            Image = "rbxthumb://type=Asset&id=23156312&w=420&h=420"
        })
    };
end;