local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.Highlighter);
local v3 = require(l_Parent_0.Parent.Dash);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = require(l_Parent_0.UI.Components.BulletList);
local v6 = require(l_Parent_0.UI.Components.TextWithLinks);
local v7 = require(l_Parent_0.Util.Markdown.Parser);
local v8 = require(l_Parent_0.Util.Markdown.Mapper);
local l_BuilderSans_0 = Enum.Font.BuilderSans;
local v10 = {
    [1] = 54, 
    [2] = 45, 
    [3] = 36, 
    [4] = 27
};
local function _(v11) --[[ Line: 35 ]] --[[ Name: headerSize ]]
    -- upvalues: v10 (copy)
    return v10[v11] or 18;
end;
local function v18(v13, v14) --[[ Line: 39 ]] --[[ Name: createLinkMap ]]
    local v15 = {};
    for _, v17 in ipairs(v13) do
        v15[("[%*]"):format(v17.Text)] = {
            LinkText = v17.Text, 
            LinkCallback = function() --[[ Line: 44 ]] --[[ Name: LinkCallback ]]
                -- upvalues: v14 (copy), v17 (copy)
                v14(v17.Url);
            end
        };
    end;
    return v15;
end;
local function v23(v19, v20, v21, v22) --[[ Line: 52 ]] --[[ Name: createTextWithLinks ]]
    -- upvalues: v1 (copy), v6 (copy), l_BuilderSans_0 (copy), v18 (copy)
    return v1.createElement(v6, {
        TextProps = {
            RichText = true, 
            TextSize = 18, 
            Font = l_BuilderSans_0, 
            [v1.Tag] = v22 or ""
        }, 
        Text = v19, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LinkMap = v18(v20, v21)
    });
end;
local function v26(v24, v25) --[[ Line: 71 ]] --[[ Name: headingHandler ]]
    -- upvalues: v1 (copy), v4 (copy), v10 (copy)
    return v1.createElement(v4, {
        Text = v24, 
        RichText = true, 
        TextSize = v10[v25] or 18, 
        [v1.Tag] = "X-Fit Wrap Left Header"
    });
end;
local function v30(v27, v28, v29) --[[ Line: 80 ]] --[[ Name: paragraphHandler ]]
    -- upvalues: v1 (copy), v23 (copy)
    return v1.createElement("Frame", {
        [v1.Tag] = "X-Fit X-Transparent X-Row Paragraph"
    }, {
        v23(v27, v28, v29, "Left")
    });
end;
local function v33(v31, v32) --[[ Line: 93 ]] --[[ Name: codeHandler ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy)
    if v32 == "lua" then
        v31 = v2.highlight(v31);
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = "X-Fit X-Transparent CodeBlock"
    }, {
        CodeWrapper = v1.createElement("Frame", {
            BackgroundColor3 = v2.getTokenColor("background"), 
            BackgroundTransparency = 0, 
            [v1.Tag] = "X-Fit"
        }, {
            Code = v1.createElement(v4, {
                TextColor3 = v2.getTokenColor("iden"), 
                Text = v31, 
                TextSize = 18, 
                RichText = true, 
                Font = Enum.Font.Code, 
                [v1.Tag] = "X-Fit X-Top X-Pad Wrap Left"
            })
        })
    });
end;
local function v54(v34, v35) --[[ Line: 117 ]] --[[ Name: listHandler ]]
    -- upvalues: v23 (copy), v1 (copy), v5 (copy)
    local function v38(v36, v37) --[[ Line: 118 ]] --[[ Name: makeTextItem ]]
        -- upvalues: v23 (ref), v35 (copy)
        return v23(v36, v37, v35, "X-Fit Wrap Left");
    end;
    local function v39(v40, v41) --[[ Line: 121 ]] --[[ Name: makeBulletList ]]
        -- upvalues: v1 (ref), v23 (ref), v35 (copy), v39 (copy), v38 (copy), v5 (ref)
        local v42 = {};
        local v43 = {};
        for v44 = #v41, 1, -1 do
            local v45 = v41[v44];
            if v45.Level == v40 then
                if #v43 > 0 then
                    local l_v42_0 = v42;
                    local v47 = 1;
                    local l_createElement_0 = v1.createElement;
                    local v49 = "Frame";
                    local v50 = {
                        [v1.Tag] = "X-Fit X-Column X-Transparent"
                    };
                    local v51 = {};
                    local l_Text_0 = v45.Text;
                    local l_Links_0 = v45.Links;
                    v51.Item = v23(l_Text_0, l_Links_0, v35, "X-Fit Wrap Left");
                    v51.List = v39(v40 + 1, v43);
                    table.insert(l_v42_0, v47, l_createElement_0(v49, v50, v51));
                    v43 = {};
                else
                    table.insert(v42, 1, v38(v45.Text, v45.Links));
                end;
            else
                table.insert(v43, 1, v45);
            end;
        end;
        return v1.createElement(v5, {
            Items = v42, 
            TextWrapped = true
        });
    end;
    return v39(0, v34);
end;
local function v56(v55) --[[ Line: 155 ]] --[[ Name: linkCallback ]]
    print((("[Defaullt Link Callback]: URL [%*] is clicked"):format(v55)));
end;
local v57 = {
    heading = v26, 
    paragraph = v30, 
    code = v33, 
    list = v54
};
return function(v58) --[[ Line: 173 ]] --[[ Name: MarkdownViewer ]]
    -- upvalues: v1 (copy), v3 (copy), v57 (copy), v8 (copy), v7 (copy), v56 (copy)
    local v59 = v1.useMemo(function() --[[ Line: 174 ]]
        -- upvalues: v3 (ref), v57 (ref), v58 (copy)
        return v3.join(v57, v58.Map or {});
    end, {
        v58.Map
    });
    local v63 = v1.useMemo(function() --[[ Line: 178 ]]
        -- upvalues: v8 (ref), v59 (copy), v7 (ref), v58 (copy), v56 (ref)
        local v60 = v8.map(v59, v7.parse(v58.Markdown), v58.LinkCallback or v56);
        for v61, v62 in ipairs(v60) do
            v62.LayoutOrder = v61;
        end;
        return v60;
    end, {
        v58.Markdown, 
        v58.LinkCallback, 
        v59
    });
    return v1.createElement("Frame", v3.join({
        [v1.Tag] = "X-Column X-FitY X-Transparent Component-Markdown"
    }, v58.WrapperProps or {}), v63);
end;