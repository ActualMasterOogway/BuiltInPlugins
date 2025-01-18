local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Src.Util.OptionsContext);
return function(v4) --[[ Line: 12 ]] --[[ Name: OptionsProvider ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5, v6 = v1.useState("");
    local v7, v8 = v1.useState(true);
    local v9, v10 = v1.useState(function() --[[ Line: 15 ]]
        -- upvalues: v2 (ref)
        return math.random(v2.MAX_SEED_VALUE);
    end);
    local v11, v12 = v1.useState(CFrame.new());
    local v13, v14 = v1.useState(true);
    local v15, v16 = v1.useState(false);
    local v17, v18 = v1.useState(true);
    local v19, v20 = v1.useState(true);
    local v21 = {
        promptText = v5, 
        randomizeSeed = v7, 
        seed = v9, 
        rotation = v11, 
        smartUVUnwrap = v13, 
        promptMasking = v15, 
        validRotation = v17, 
        validSeed = v19, 
        setPromptText = v6, 
        setRandomizeSeed = v8, 
        setSeed = v10, 
        setRotation = v12, 
        setSmartUVUnwrap = v14, 
        setPromptMasking = v16, 
        setValidRotation = v18, 
        setValidSeed = v20
    };
    return v1.createElement(v3.Provider, {
        value = v21
    }, v4.children);
end;