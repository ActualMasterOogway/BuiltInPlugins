local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_TextService_0 = game:GetService("TextService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_TextLabel_0 = v3.UI.TextLabel;
local function v12(v6) --[[ Line: 34 ]] --[[ Name: BackingHighlight ]]
    -- upvalues: v4 (copy), l_TextService_0 (copy), l_TextLabel_0 (copy)
    local v7 = string.sub(v6.Text, v6.StartIndex, v6.FinishIndex);
    local v9 = v4.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v6 (copy), l_TextService_0 (ref)
        local v8 = string.sub(v6.Text, 1, v6.StartIndex - 1);
        return l_TextService_0:GetTextSize(v8, 16, Enum.Font.SourceSans, Vector2.new(1e999, 1e999)).X;
    end, {
        v6.StartIndex, 
        v6.Text
    });
    local v11 = v4.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v6 (copy), l_TextService_0 (ref)
        local v10 = string.sub(v6.Text, 1, v6.FinishIndex);
        return l_TextService_0:GetTextSize(v10, 16, Enum.Font.SourceSans, Vector2.new(1e999, 1e999)).X;
    end, {
        v6.FinishIndex, 
        v6.Text
    });
    return v4.createElement(v4.Fragment, {}, {
        Highlight = v4.createElement("Frame", {
            [v4.Tag] = "VisualizationModes-Highlight", 
            Size = UDim2.fromOffset(v11 - v9, 24), 
            Position = UDim2.new(0, v9, 0.5, 0), 
            ZIndex = 2
        }), 
        HighlightTextLabel = v4.createElement(l_TextLabel_0, {
            Text = v7, 
            [v4.Tag] = "VisualizationModes-Highlight-TextLabel", 
            Size = UDim2.fromOffset(v11 - v9, 24), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v9, 0.5, 0), 
            ZIndex = 3
        })
    });
end;
local function v21(v13) --[[ Line: 69 ]] --[[ Name: HighlightGroup ]]
    -- upvalues: v4 (copy), v12 (copy)
    if v13.MatchIndexes == nil then
        return nil;
    else
        local l_Text_0 = v13.Text;
        if l_Text_0 == nil then
            return nil;
        else
            local l_MatchIndexes_0 = v13.MatchIndexes;
            local v16 = {};
            local v17 = nil;
            local v18 = nil;
            for _, v20 in l_MatchIndexes_0 do
                if v17 == nil then
                    v17 = v20;
                    v18 = v20;
                elseif v18 ~= nil and v20 == v18 + 1 then
                    v18 = v20;
                elseif v17 ~= nil and v18 ~= nil then
                    table.insert(v16, v4.createElement(v12, {
                        Text = l_Text_0, 
                        StartIndex = v17, 
                        FinishIndex = v18
                    }));
                    v17 = v20;
                    v18 = v20;
                end;
            end;
            if v17 ~= nil and v18 ~= nil then
                table.insert(v16, v4.createElement(v12, {
                    Text = l_Text_0, 
                    StartIndex = v17, 
                    FinishIndex = v18
                }));
            end;
            return v4.createElement(v4.Fragment, {}, v16);
        end;
    end;
end;
return function(v22) --[[ Line: 121 ]] --[[ Name: HighlightTextLabel ]]
    -- upvalues: v4 (copy), l_TextLabel_0 (copy), v3 (copy), v21 (copy)
    return v4.createElement("Frame", {
        LayoutOrder = v22.LayoutOrder, 
        [v4.Tag] = "VisualizationModes-TextLabel-Container"
    }, {
        TextLabel = v4.createElement(l_TextLabel_0, {
            Text = v22.Text, 
            [v4.Tag] = v3.Styling.joinTags("VisualizationModes-TextLabel", v22[v4.Tag]), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            ZIndex = 2
        }), 
        HighlightGroup = v4.createElement(v21, {
            Text = v22.Text, 
            MatchIndexes = v22.MatchIndexes
        })
    });
end;