local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.Highlighter);
local _ = require(l_Parent_0.Util.Highlighter.Types);
local v4 = require(l_Parent_0.Parent.Dash);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = require(l_Parent_0.UI.Components.BulletList);
local v7 = require(l_Parent_0.UI.Components.TextWithLinks);
local v8 = require(l_Parent_0.UI.Components.Separator);
local v9 = require(l_Parent_0.Util.Markdown.DEPRECATED_Parser);
local v10 = require(l_Parent_0.Util.Markdown.Mapper);
local l_BuilderSans_0 = Enum.Font.BuilderSans;
local v12 = {
    [1] = 3, 
    [2] = 2.5, 
    [3] = 2, 
    [4] = 1.5
};
local function _(v13, v14) --[[ Line: 38 ]] --[[ Name: headerSize ]]
    -- upvalues: v12 (copy)
    return (v12[v13] or 1) * v14;
end;
local function v21(v16, v17) --[[ Line: 42 ]] --[[ Name: createLinkMap ]]
    local v18 = {};
    for _, v20 in ipairs(v16) do
        v18[("[%*]"):format(v20.Text)] = {
            LinkText = v20.Text, 
            LinkCallback = function() --[[ Line: 47 ]] --[[ Name: LinkCallback ]]
                -- upvalues: v17 (copy), v20 (copy)
                v17(v20.Url);
            end
        };
    end;
    return v18;
end;
local function v27(v22, v23, v24, v25, v26) --[[ Line: 55 ]] --[[ Name: createTextWithLinks ]]
    -- upvalues: v1 (copy), v7 (copy), v21 (copy)
    return v1.createElement(v7, {
        TextProps = {
            RichText = true, 
            TextSize = v25.TextSize, 
            Font = v25.Font, 
            [v1.Tag] = v26 or ""
        }, 
        Text = v22, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LinkMap = v21(v23, v24)
    });
end;
local function v35(v28, v29, v30) --[[ Line: 75 ]] --[[ Name: headingHandler ]]
    -- upvalues: v1 (copy), v5 (copy), v12 (copy)
    local l_createElement_0 = v1.createElement;
    local l_v5_0 = v5;
    local v33 = {
        Text = v28, 
        RichText = true
    };
    local l_TextSize_0 = v30.TextSize;
    v33.TextSize = (v12[v29] or 1) * l_TextSize_0;
    v33.Font = v30.Font;
    v33[v1.Tag] = "X-Fit Wrap Left Header";
    return l_createElement_0(l_v5_0, v33);
end;
local function v40(v36, v37, v38, v39) --[[ Line: 85 ]] --[[ Name: paragraphHandler ]]
    -- upvalues: v1 (copy), v27 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = "X-Fit X-Transparent X-Row Paragraph"
    }, {
        v27(v36, v37, v38, v39, "Left")
    });
end;
local function v45(v41, v42, v43, v44) --[[ Line: 99 ]] --[[ Name: codeHandler ]]
    -- upvalues: v2 (copy), v1 (copy), v5 (copy)
    if v42 == "lua" then
        v41 = v2.highlight(v41, v43);
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = "X-Fit X-Transparent CodeBlock"
    }, {
        CodeWrapper = v1.createElement("Frame", {
            BackgroundColor3 = v2.getTokenColor("background"), 
            BackgroundTransparency = 0, 
            [v1.Tag] = "X-Fit"
        }, {
            Code = v1.createElement(v5, {
                TextColor3 = v2.getTokenColor("iden"), 
                Text = v41, 
                RichText = true, 
                TextSize = v44.TextSize, 
                Font = Enum.Font.Code, 
                [v1.Tag] = "X-Fit X-Top X-Pad Wrap Left"
            })
        })
    });
end;
local function v46() --[[ Line: 128 ]] --[[ Name: rulerHandler ]]
    -- upvalues: v1 (copy), v8 (copy)
    return v1.createElement(v8, {});
end;
local function v68(v47, v48, v49) --[[ Line: 132 ]] --[[ Name: listHandler ]]
    -- upvalues: v27 (copy), v1 (copy), v6 (copy)
    local function v52(v50, v51) --[[ Line: 137 ]] --[[ Name: makeTextItem ]]
        -- upvalues: v27 (ref), v48 (copy), v49 (copy)
        return v27(v50, v51, v48, v49, "X-Fit Wrap Left");
    end;
    local function v53(v54, v55) --[[ Line: 141 ]] --[[ Name: makeBulletList ]]
        -- upvalues: v1 (ref), v27 (ref), v48 (copy), v49 (copy), v53 (copy), v52 (copy), v6 (ref)
        local v56 = {};
        local v57 = {};
        for v58 = #v55, 1, -1 do
            local v59 = v55[v58];
            if v59.Level == v54 then
                if #v57 > 0 then
                    local l_v56_0 = v56;
                    local v61 = 1;
                    local l_createElement_1 = v1.createElement;
                    local v63 = "Frame";
                    local v64 = {
                        [v1.Tag] = "X-Fit X-Column X-Transparent"
                    };
                    local v65 = {};
                    local l_Text_0 = v59.Text;
                    local l_Links_0 = v59.Links;
                    v65.Item = v27(l_Text_0, l_Links_0, v48, v49, "X-Fit Wrap Left");
                    v65.List = v53(v54 + 1, v57);
                    table.insert(l_v56_0, v61, l_createElement_1(v63, v64, v65));
                    v57 = {};
                else
                    table.insert(v56, 1, v52(v59.Text, v59.Links));
                end;
            else
                table.insert(v57, 1, v59);
            end;
        end;
        return v1.createElement(v6, {
            Items = v56, 
            TextWrapped = true
        });
    end;
    return v53(0, v47);
end;
local function v70(v69) --[[ Line: 175 ]] --[[ Name: linkCallback ]]
    print((("[Defaullt Link Callback]: URL [%*] is clicked"):format(v69)));
end;
local v71 = {
    heading = v35, 
    paragraph = v40, 
    code = v45, 
    list = v68, 
    ruler = v46
};
return function(v72) --[[ Line: 196 ]] --[[ Name: MarkdownViewer ]]
    -- upvalues: v1 (copy), v4 (copy), v71 (copy), l_BuilderSans_0 (copy), v10 (copy), v9 (copy), v70 (copy)
    local v73 = v1.useMemo(function() --[[ Line: 197 ]]
        -- upvalues: v4 (ref), v71 (ref), v72 (copy)
        return v4.join(v71, v72.Map or {});
    end, {
        v72.Map
    });
    local v78 = v1.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v72 (copy), l_BuilderSans_0 (ref), v10 (ref), v73 (copy), v9 (ref), v70 (ref)
        local v74 = {
            TextSize = if v72.TextProps and v72.TextProps.TextSize then v72.TextProps.TextSize else 18, 
            Font = if v72.TextProps and v72.TextProps.Font then v72.TextProps.Font else l_BuilderSans_0
        };
        local v75 = v10.map(v73, v9.parse(v72.Markdown), v72.LinkCallback or v70, v72.CodeColorScheme, v74);
        for v76, v77 in ipairs(v75) do
            v77.LayoutOrder = v76;
        end;
        return v75;
    end, {
        v72.Markdown, 
        v72.LinkCallback, 
        v73, 
        v72.CodeColorScheme, 
        v72.TextProps
    });
    return v1.createElement("Frame", v4.join({
        [v1.Tag] = "X-Column X-FitY X-Transparent Component-Markdown"
    }, v72.WrapperProps or {}), v78);
end;