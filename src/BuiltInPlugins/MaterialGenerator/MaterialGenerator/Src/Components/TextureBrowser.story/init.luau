local l_Parent_0 = script.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.React);
local v4 = require(script.Parent.TextureBrowser);
local function v5() --[[ Line: 10 ]] --[[ Name: createMaterial ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        Name = "Testing", 
        Id = l_HttpService_0:GenerateGUID(false), 
        Textures = {
            ColorMap = "rbxassetid://12799638751"
        }, 
        BaseMaterial = nil, 
        IsGenerating = false, 
        IsTemporary = true, 
        Session = nil
    };
end;
return {
    story = function(_) --[[ Line: 25 ]] --[[ Name: story ]]
        -- upvalues: v5 (copy), v3 (copy), v4 (copy)
        local v7 = {
            v5(), 
            v5(), 
            v5(), 
            (v5())
        };
        return v3.createElement(v4, {
            GeneratingImages = 4, 
            Materials = v7
        });
    end
};