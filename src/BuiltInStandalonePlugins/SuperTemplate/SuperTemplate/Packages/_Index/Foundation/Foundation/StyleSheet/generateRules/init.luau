local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v4 = {
    Content = {
        "content"
    }, 
    Stroke = {
        "stroke"
    }, 
    Shift = {
        "bg"
    }, 
    Surface = {
        "bg"
    }, 
    OverMedia = {
        "bg"
    }, 
    System = {
        "bg", 
        "content", 
        "stroke"
    }, 
    Extended = {}, 
    Common = {}, 
    Selection = {}, 
    State = {}, 
    None = {}
};
local v5 = {
    System = true
};
pascalToKebab = function(v6) --[[ Line: 77 ]] --[[ Name: pascalToKebab ]]
    v6 = v6:gsub("_", "-");
    local v8 = string.gsub(v6, "(%u)", function(v7) --[[ Line: 82 ]]
        return "-" .. v7:lower();
    end);
    if v8:sub(1, 1) == "-" then
        v8 = v8:sub(2, #v8);
    end;
    return v8;
end;
local function v56(v9) --[[ Line: 94 ]] --[[ Name: createTokens ]]
    -- upvalues: v5 (copy)
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {};
    if v9 == nil then
        return v10, v11, v12, v13, v14, v15, v16, v17, v18, v19;
    else
        for v20, v21 in v9.Color do
            if v21.Background then
                v11[pascalToKebab(v20)] = v21;
            else
                v10[v20] = {};
                for v22, v23 in v21 do
                    local v24 = if v5[v20] then v20 .. v22 else v22;
                    v10[v20][pascalToKebab(v24)] = v23;
                end;
            end;
        end;
        for v25, v26 in v9.Stroke do
            table.insert(v12, {
                name = pascalToKebab(v25), 
                size = v26
            });
        end;
        table.insert(v12, {
            name = "none", 
            size = 0
        });
        table.sort(v12, function(v27, v28) --[[ Line: 141 ]]
            return v27.size < v28.size;
        end);
        for v29, v30 in v9.Gap do
            table.insert(v13, {
                name = string.lower(v29), 
                size = UDim.new(0, v30)
            });
        end;
        table.sort(v13, function(v31, v32) --[[ Line: 149 ]]
            return v31.size.Offset < v32.size.Offset;
        end);
        for v33, v34 in v9.Radius do
            table.insert(v14, {
                name = string.lower(v33), 
                size = UDim.new(0, v34)
            });
        end;
        table.sort(v14, function(v35, v36) --[[ Line: 157 ]]
            return v35.size.Offset < v36.size.Offset;
        end);
        for v37, v38 in v9.Size do
            local v39 = string.split(v37, "_")[2];
            table.insert(v15, {
                name = pascalToKebab(v39), 
                size = UDim.new(0, v38)
            });
        end;
        table.insert(v15, {
            name = "full", 
            size = UDim.new(1, 0)
        });
        table.sort(v15, function(v40, v41) --[[ Line: 169 ]]
            return v40.size.Offset < v41.size.Offset;
        end);
        for v42, v43 in v9.Typography do
            v16[pascalToKebab(v42)] = {
                Font = v43.Font, 
                TextSize = v43.FontSize, 
                LineHeight = v43.LineHeight
            };
        end;
        for v44, v45 in v9.Padding do
            table.insert(v17, {
                name = string.lower(v44), 
                size = UDim.new(0, v45)
            });
        end;
        table.sort(v17, function(v46, v47) --[[ Line: 185 ]]
            return v46.size.Offset < v47.size.Offset;
        end);
        for v48, v49 in v9.Margin do
            table.insert(v18, {
                name = string.lower(v48), 
                size = UDim.new(0, v49)
            });
        end;
        table.sort(v18, function(v50, v51) --[[ Line: 193 ]]
            return v50.size.Offset < v51.size.Offset;
        end);
        for v52, v53 in v9.Gutter do
            table.insert(v19, {
                name = string.lower(v52), 
                size = UDim.new(0, v53)
            });
        end;
        table.sort(v19, function(v54, v55) --[[ Line: 201 ]]
            return v54.size.Offset < v55.size.Offset;
        end);
        return v10, v11, v12, v13, v14, v15, v16, v17, v18, v19;
    end;
end;
local function v58(v57) --[[ Line: 208 ]] --[[ Name: DefaultRules ]]
    return {
        {
            tag = "gui-object-defaults", 
            properties = {
                BackgroundTransparency = 1
            }
        }, 
        {
            tag = "text-defaults", 
            properties = {
                Font = v57.Typography.BodyLarge.Font
            }
        }
    };
end;
local function v60(v59) --[[ Line: 225 ]] --[[ Name: DefaultSizeRules ]]
    return {
        {
            tag = "text-size-defaults", 
            properties = {
                TextSize = v59.Typography.BodyLarge.FontSize, 
                LineHeight = v59.Typography.BodyLarge.LineHeight
            }
        }
    };
end;
local function v62(v61) --[[ Line: 237 ]] --[[ Name: DefaultColorRules ]]
    return {
        {
            tag = "text-color-defaults", 
            properties = {
                TextColor3 = v61.Color.Content.Default.Color3, 
                TextTransparency = v61.Color.Content.Default.Transparency
            }
        }
    };
end;
local function v81(v63, v64) --[[ Line: 249 ]] --[[ Name: ListLayoutRules ]]
    -- upvalues: v2 (copy)
    local v65 = {
        {
            tag = "row", 
            pseudo = "UIListLayout", 
            properties = {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, 
        {
            tag = "col", 
            pseudo = "UIListLayout", 
            properties = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }
    };
    local v66 = {
        {
            tag = "align-x-left", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            }
        }, 
        {
            tag = "align-x-center", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }
        }, 
        {
            tag = "align-x-right", 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }
        }, 
        {
            tag = "align-y-top", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Top
            }
        }, 
        {
            tag = "align-y-center", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Center
            }
        }, 
        {
            tag = "align-y-bottom", 
            pseudo = "UIListLayout", 
            properties = {
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }
        }
    };
    local v67 = {};
    for _, v69 in v63 do
        table.insert(v67, {
            tag = ("gap-%*"):format(v69.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = v69.size
            }
        });
    end;
    local v70 = {};
    for _, v72 in v64 do
        table.insert(v70, {
            tag = ("gutter-%*"):format(v72.name), 
            pseudo = "UIListLayout", 
            properties = {
                Padding = v72.size
            }
        });
    end;
    local v73 = {
        {
            tag = "wrap", 
            pseudo = "UIListLayout", 
            properties = {
                Wraps = true
            }
        }, 
        {
            tag = "no-wrap", 
            pseudo = "UIListLayout", 
            properties = {
                Wraps = false
            }
        }
    };
    local v74 = {};
    for v75, v76 in {
        none = Enum.UIFlexAlignment.None, 
        fill = Enum.UIFlexAlignment.Fill, 
        around = Enum.UIFlexAlignment.SpaceAround, 
        between = Enum.UIFlexAlignment.SpaceBetween, 
        evenly = Enum.UIFlexAlignment.SpaceEvenly
    } do
        table.insert(v74, {
            tag = ("flex-%*"):format(v75), 
            pseudo = "UIListLayout", 
            properties = {
                HorizontalFlex = v76, 
                VerticalFlex = v76
            }
        });
    end;
    local v77 = {
        auto = Enum.ItemLineAlignment.Automatic, 
        start = Enum.ItemLineAlignment.Start, 
        center = Enum.ItemLineAlignment.Center, 
        ["end"] = Enum.ItemLineAlignment.End, 
        stretch = Enum.ItemLineAlignment.Stretch
    };
    local v78 = {};
    for v79, v80 in v77 do
        table.insert(v78, {
            tag = ("items-%*"):format(v79), 
            pseudo = "UIListLayout", 
            properties = {
                ItemLineAlignment = v80
            }
        });
    end;
    return v2.List.join(v65, v66, v67, v73, v74, v78, v70);
end;
local function v91() --[[ Line: 401 ]] --[[ Name: FlexItemRules ]]
    -- upvalues: v2 (copy)
    local v82 = {
        {
            tag = "grow", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Grow
            }
        }, 
        {
            tag = "shrink", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Shrink
            }
        }, 
        {
            tag = "fill", 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Fill
            }
        }
    };
    local v83 = {
        1, 
        2, 
        3, 
        4, 
        5
    };
    local v84 = {};
    local v85 = {};
    for v86 in v83 do
        table.insert(v84, {
            tag = ("grow-%*"):format(v86), 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Custom, 
                GrowRatio = v86
            }
        });
        table.insert(v85, {
            tag = ("shrink-%*"):format(v86), 
            pseudo = "UIFlexItem", 
            properties = {
                FlexMode = Enum.UIFlexMode.Custom, 
                ShrinkRatio = v86
            }
        });
    end;
    local v87 = {
        auto = Enum.ItemLineAlignment.Automatic, 
        start = Enum.ItemLineAlignment.Start, 
        center = Enum.ItemLineAlignment.Center, 
        ["end"] = Enum.ItemLineAlignment.End, 
        stretch = Enum.ItemLineAlignment.Stretch
    };
    local v88 = {};
    for v89, v90 in v87 do
        table.insert(v88, {
            tag = ("self-%*"):format(v89), 
            pseudo = "UIFlexItem", 
            properties = {
                ItemLineAlignment = v90
            }
        });
    end;
    return v2.List.join(v82, v84, v85, v88);
end;
local function v96(v92) --[[ Line: 473 ]] --[[ Name: CornerRules ]]
    local v93 = {};
    for _, v95 in v92 do
        table.insert(v93, {
            tag = ("radius-%*"):format(v95.name), 
            pseudo = "UICorner", 
            properties = {
                CornerRadius = v95.size
            }
        });
    end;
    return v93;
end;
local function v103(v97) --[[ Line: 489 ]] --[[ Name: SizeRules ]]
    local v98 = {};
    for _, v100 in v97 do
        table.insert(v98, {
            tag = ("size-%*"):format(v100.name), 
            properties = {
                Size = UDim2.new(v100.size, v100.size)
            }
        });
        for _, v102 in v97 do
            table.insert(v98, {
                tag = ("size-%*-%*"):format(v100.name, v102.name), 
                properties = {
                    Size = UDim2.new(v100.size, v102.size)
                }
            });
        end;
    end;
    return v98;
end;
local function v113(v104, v105) --[[ Line: 512 ]] --[[ Name: BackgroundRules ]]
    -- upvalues: v4 (copy)
    local v106 = {};
    for v107, v108 in v104 do
        if table.find(v4[v107], "bg") then
            for v109, v110 in v108 do
                table.insert(v106, {
                    tag = ("bg-%*"):format(v109), 
                    properties = {
                        BackgroundColor3 = v110.Color3, 
                        BackgroundTransparency = v110.Transparency
                    }
                });
            end;
        end;
    end;
    for v111, v112 in v105 do
        table.insert(v106, {
            tag = ("bg-%*"):format(v111), 
            properties = {
                BackgroundColor3 = v112.Background.Color3, 
                BackgroundTransparency = v112.Background.Transparency
            }
        });
    end;
    return v106;
end;
local function v118(v114) --[[ Line: 542 ]] --[[ Name: StrokeSizeRules ]]
    local v115 = {};
    for _, v117 in v114 do
        table.insert(v115, {
            tag = ("stroke-%*"):format(v117.name), 
            pseudo = "UIStroke", 
            properties = {
                Thickness = v117.size
            }
        });
    end;
    return v115;
end;
local function v128(v119, v120) --[[ Line: 558 ]] --[[ Name: StrokeRules ]]
    -- upvalues: v4 (copy)
    local v121 = {};
    for v122, v123 in v119 do
        if table.find(v4[v122], "stroke") then
            for v124, v125 in v123 do
                table.insert(v121, {
                    tag = ("stroke-%*"):format(v124), 
                    pseudo = "UIStroke", 
                    properties = {
                        Color = v125.Color3, 
                        Transparency = v125.Transparency
                    }
                });
            end;
        end;
    end;
    for v126, v127 in v120 do
        table.insert(v121, {
            tag = ("stroke-%*"):format(v126), 
            pseudo = "UIStroke", 
            properties = {
                Color = v127.Border.Color3, 
                Transparency = v127.Border.Transparency
            }
        });
    end;
    return v121;
end;
local function v138(v129, v130) --[[ Line: 590 ]] --[[ Name: ContentRules ]]
    -- upvalues: v4 (copy)
    local v131 = {};
    for v132, v133 in v129 do
        if table.find(v4[v132], "content") then
            for v134, v135 in v133 do
                table.insert(v131, {
                    tag = ("content-%*"):format(v134), 
                    properties = {
                        ImageColor3 = v135.Color3, 
                        ImageTransparency = v135.Transparency, 
                        TextColor3 = v135.Color3, 
                        TextTransparency = v135.Transparency
                    }
                });
            end;
        end;
    end;
    for v136, v137 in v130 do
        table.insert(v131, {
            tag = ("content-%*"):format(v136), 
            properties = {
                ImageColor3 = v137.Foreground.Color3, 
                ImageTransparency = v137.Foreground.Transparency, 
                TextColor3 = v137.Foreground.Color3, 
                TextTransparency = v137.Foreground.Transparency
            }
        });
    end;
    return v131;
end;
local function v146(v139, v140) --[[ Line: 624 ]] --[[ Name: TypographyRules ]]
    local v141 = {};
    for v142, v143 in v139 do
        local v144 = v143.TextSize / v140 * (v143.LineHeight * v140) - v143.TextSize;
        local v145 = UDim.new(0, v144 / 2);
        table.insert(v141, {
            tag = ("text-%*"):format(v142), 
            properties = v143, 
            children = {
                {
                    tag = ("text-%*"):format(v142), 
                    pseudo = "UIPadding", 
                    properties = {
                        PaddingTop = v145, 
                        PaddingBottom = v145
                    }
                }
            }
        });
    end;
    return v141;
end;
local function v154() --[[ Line: 652 ]] --[[ Name: TextRules ]]
    local v147 = {};
    for v148, v149 in {
        left = Enum.TextXAlignment.Left, 
        center = Enum.TextXAlignment.Center, 
        right = Enum.TextXAlignment.Right
    } do
        table.insert(v147, {
            tag = ("text-align-x-%*"):format(v148), 
            properties = {
                TextXAlignment = v149
            }
        });
    end;
    for v150, v151 in {
        top = Enum.TextYAlignment.Top, 
        center = Enum.TextYAlignment.Center, 
        bottom = Enum.TextYAlignment.Bottom
    } do
        table.insert(v147, {
            tag = ("text-align-y-%*"):format(v150), 
            properties = {
                TextYAlignment = v151
            }
        });
    end;
    for v152, v153 in {
        none = Enum.TextTruncate.None, 
        ["end"] = Enum.TextTruncate.AtEnd, 
        split = Enum.TextTruncate.SplitWord
    } do
        table.insert(v147, {
            tag = ("text-truncate-%*"):format(v152), 
            properties = {
                TextTruncate = v153
            }
        });
    end;
    table.insert(v147, {
        tag = "text-wrap", 
        properties = {
            TextWrapped = true
        }
    });
    table.insert(v147, {
        tag = "text-no-wrap", 
        properties = {
            TextWrapped = false
        }
    });
    return v147;
end;
local function v175(v155, v156) --[[ Line: 717 ]] --[[ Name: PaddingRules ]]
    local v157 = {};
    local v158 = {
        x = {
            "PaddingLeft", 
            "PaddingRight"
        }, 
        y = {
            "PaddingTop", 
            "PaddingBottom"
        }, 
        top = {
            "PaddingTop"
        }, 
        bottom = {
            "PaddingBottom"
        }, 
        left = {
            "PaddingLeft"
        }, 
        right = {
            "PaddingRight"
        }
    };
    for _, v160 in v155 do
        table.insert(v157, {
            tag = ("padding-%*"):format(v160.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = v160.size, 
                PaddingBottom = v160.size, 
                PaddingLeft = v160.size, 
                PaddingRight = v160.size
            }
        });
    end;
    for _, v162 in v156 do
        table.insert(v157, {
            tag = ("margin-%*"):format(v162.name), 
            pseudo = "UIPadding", 
            properties = {
                PaddingTop = v162.size, 
                PaddingBottom = v162.size, 
                PaddingLeft = v162.size, 
                PaddingRight = v162.size
            }
        });
    end;
    for v163, v164 in v158 do
        for _, v166 in v155 do
            local v167 = {};
            for _, v169 in v164 do
                v167[v169] = v166.size;
            end;
            table.insert(v157, {
                tag = ("padding-%*-%*"):format(v163, v166.name), 
                pseudo = "UIPadding", 
                properties = v167
            });
        end;
        for _, v171 in v156 do
            local v172 = {};
            for _, v174 in v164 do
                v172[v174] = v171.size;
            end;
            table.insert(v157, {
                tag = ("margin-%*-%*"):format(v163, v171.name), 
                pseudo = "UIPadding", 
                properties = v172
            });
        end;
    end;
    return v157;
end;
local function v180() --[[ Line: 784 ]] --[[ Name: AutomaticSizeRules ]]
    local v176 = {
        none = Enum.AutomaticSize.None, 
        x = Enum.AutomaticSize.X, 
        y = Enum.AutomaticSize.Y, 
        xy = Enum.AutomaticSize.XY
    };
    local v177 = {};
    for v178, v179 in v176 do
        table.insert(v177, {
            tag = ("auto-%*"):format(v178), 
            properties = {
                AutomaticSize = v179
            }
        });
    end;
    return v177;
end;
local function v188() --[[ Line: 806 ]] --[[ Name: PositionRules ]]
    local v181 = {};
    local v182 = {
        left = 0, 
        center = 0.5, 
        right = 1
    };
    local v183 = {
        top = 0, 
        center = 0.5, 
        bottom = 1
    };
    for v184, v185 in v182 do
        for v186, v187 in v183 do
            table.insert(v181, {
                tag = ("position-%*-%*"):format(v186, v184), 
                properties = {
                    Position = UDim2.fromScale(v185, v187)
                }
            });
        end;
    end;
    return v181;
end;
local function v196() --[[ Line: 824 ]] --[[ Name: AnchorPointRules ]]
    local v189 = {};
    local v190 = {
        left = 0, 
        center = 0.5, 
        right = 1
    };
    local v191 = {
        top = 0, 
        center = 0.5, 
        bottom = 1
    };
    for v192, v193 in v190 do
        for v194, v195 in v191 do
            table.insert(v189, {
                tag = ("anchor-%*-%*"):format(v194, v192), 
                properties = {
                    AnchorPoint = Vector2.new(v193, v195)
                }
            });
        end;
    end;
    return v189;
end;
local function v197() --[[ Line: 842 ]] --[[ Name: ClipsDescendantRules ]]
    return {
        {
            tag = "clip", 
            properties = {
                ClipsDescendants = true
            }
        }, 
        {
            tag = "no-clip", 
            properties = {
                ClipsDescendants = false
            }
        }
    };
end;
local function _(v198, v199) --[[ Line: 859 ]] --[[ Name: roundDecimals ]]
    local v200 = 10 ^ v199;
    return math.round(v198 * v200) / v200;
end;
local function v205() --[[ Line: 864 ]] --[[ Name: AspectRatioRules ]]
    local v202 = {};
    for _, v204 in {
        {
            1, 
            1
        }, 
        {
            5, 
            4
        }, 
        {
            4, 
            3
        }, 
        {
            3, 
            2
        }, 
        {
            16, 
            9
        }, 
        {
            2, 
            1
        }
    } do
        table.insert(v202, {
            tag = ("aspect-%*-%*"):format(v204[1], v204[2]), 
            pseudo = "UIAspectRatioConstraint", 
            properties = {
                AspectRatio = math.round(v204[1] / v204[2] * 1000) / 1000
            }
        });
        if v204[1] ~= v204[2] then
            table.insert(v202, {
                tag = ("aspect-%*-%*"):format(v204[2], v204[1]), 
                pseudo = "UIAspectRatioConstraint", 
                properties = {
                    AspectRatio = math.round(v204[2] / v204[1] * 1000) / 1000
                }
            });
        end;
    end;
    return v202;
end;
local function v212(v206, _) --[[ Line: 892 ]] --[[ Name: DeprecatedColorRules ]]
    local v208 = {};
    for v209, v210 in v206.System do
        local v211 = v209:sub(8);
        table.insert(v208, {
            tag = ("bg-%*"):format(v211), 
            properties = {
                BackgroundColor3 = v210.Color3, 
                BackgroundTransparency = v210.Transparency
            }, 
            deprecatedFor = ("bg-%*"):format(v209)
        });
        if v211 ~= "emphasis" then
            table.insert(v208, {
                tag = ("content-%*"):format(v211), 
                properties = {
                    ImageColor3 = v210.Color3, 
                    ImageTransparency = v210.Transparency, 
                    TextColor3 = v210.Color3, 
                    TextTransparency = v210.Transparency
                }, 
                deprecatedFor = ("content-%*"):format(v209)
            });
            table.insert(v208, {
                tag = ("stroke-%*"):format(v211), 
                pseudo = "UIStroke", 
                properties = {
                    Color = v210.Color3, 
                    Transparency = v210.Transparency
                }, 
                deprecatedFor = ("stroke-%*"):format(v209)
            });
        end;
    end;
    return v208;
end;
local _ = function(v213) --[[ Line: 939 ]] --[[ Name: _addModifiers ]]
    local v214 = {};
    for _, v216 in v213 do
        local v217 = table.clone(v216);
        v217.tag = ("hover-%*"):format(v216.tag);
        v217.modifier = "hover";
        table.insert(v214, v216);
        table.insert(v214, v217);
    end;
    return v214;
end;
return function(v219) --[[ Line: 959 ]] --[[ Name: generateRules ]]
    -- upvalues: v56 (copy), v2 (copy), v58 (copy), v91 (copy), v154 (copy), v180 (copy), v188 (copy), v196 (copy), v197 (copy), v205 (copy), v60 (copy), v81 (copy), v96 (copy), v103 (copy), v118 (copy), v146 (copy), v175 (copy), v62 (copy), v212 (copy), v113 (copy), v128 (copy), v138 (copy)
    local v220, v221, v222, v223, v224, v225, v226, v227, v228, v229 = v56(v219);
    local v230 = v2.List.join(v58(v219), v91(), v154(), v180(), v188(), v196(), v197(), (v205()));
    local v231 = v2.List.join(v60(v219), v81(v223, v228), v96(v224), v103(v225), v118(v222), v146(v226, v219.Config.Text.NominalScale), (v175(v227, v229)));
    local v232 = v2.List.join(v62(v219), v212(v220, v221), v113(v220, v221), v128(v220, v221), (v138(v220, v221)));
    return v2.List.join(v230, v231, v232), v230, v231, v232;
end;