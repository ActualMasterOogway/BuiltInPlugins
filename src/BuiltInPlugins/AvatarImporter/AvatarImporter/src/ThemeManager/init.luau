local l_Studio_0 = settings().Studio;
return {
    setImageColor = function(v1, v2, v3) --[[ Line: 5 ]] --[[ Name: setImageColor ]]
        v1:_set(v2, "ImageColor3", v3, Enum.StudioStyleGuideModifier.Default);
    end, 
    setTextColor = function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: setTextColor ]]
        v4:_set(v5, "TextColor3", v6, Enum.StudioStyleGuideModifier.Default);
    end, 
    setBackgroundColor = function(v7, v8, v9) --[[ Line: 13 ]] --[[ Name: setBackgroundColor ]]
        v7:_set(v8, "BackgroundColor3", v9, Enum.StudioStyleGuideModifier.Default);
    end, 
    setBorderColor = function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: setBorderColor ]]
        v10:_set(v11, "BorderColor3", v12, Enum.StudioStyleGuideModifier.Default);
    end, 
    setCustom = function(v13, v14, v15, v16) --[[ Line: 21 ]] --[[ Name: setCustom ]]
        -- upvalues: l_Studio_0 (copy)
        v13:_hook(function() --[[ Line: 22 ]]
            -- upvalues: v14 (copy), v15 (copy), v16 (copy), l_Studio_0 (ref)
            v14[v15] = v16[l_Studio_0.Theme.Name];
        end);
    end, 
    _set = function(v17, v18, v19, v20, v21) --[[ Line: 27 ]] --[[ Name: _set ]]
        -- upvalues: l_Studio_0 (copy)
        v17:_hook(function() --[[ Line: 28 ]]
            -- upvalues: v18 (copy), v19 (copy), l_Studio_0 (ref), v20 (copy), v21 (copy)
            v18[v19] = l_Studio_0.Theme:GetColor(v20, v21);
        end);
    end, 
    _hook = function(_, v23) --[[ Line: 33 ]] --[[ Name: _hook ]]
        -- upvalues: l_Studio_0 (copy)
        v23();
        l_Studio_0.ThemeChanged:Connect(v23);
    end
};