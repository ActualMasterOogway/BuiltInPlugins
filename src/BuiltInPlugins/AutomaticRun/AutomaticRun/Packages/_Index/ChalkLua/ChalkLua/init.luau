local function v7(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: stringReplaceAll ]]
    local v3 = string.find(v0, v1, 1, true);
    if v3 == nil then
        return v0;
    else
        local v4 = #v1;
        local v5 = 1;
        local v6 = "";
        repeat
            v6 = v6 .. string.sub(v0, v5, v3 - 1) .. v1 .. v2;
            v5 = v3 + v4;
            v3 = string.find(v0, v1, v5, true);
        until v3 == nil;
        return v6 .. string.sub(v0, v5);
    end;
end;
local function v15(v8, v9, v10, v11) --[[ Line: 20 ]] --[[ Name: stringEncaseCRLFWithFirstIndex ]]
    local v12 = 1;
    local v13 = "";
    repeat
        local v14 = string.sub(v8, v11 - 1, v11 - 1) == "\r";
        v13 = v13 .. string.sub(v8, v12, if v14 then v11 - 2 else v11 - 1) .. v9 .. (v14 and "\r\n" or "\n") .. v10;
        v12 = v11 + 1;
        v11 = string.find(v8, "\n", v12);
    until v11 == nil;
    return v13 .. string.sub(v8, v12);
end;
local v16 = {
    modifier = {
        reset = {
            0, 
            0
        }, 
        bold = {
            1, 
            22
        }, 
        dim = {
            2, 
            22
        }, 
        italic = {
            3, 
            23
        }, 
        underline = {
            4, 
            24
        }, 
        overline = {
            53, 
            55
        }, 
        inverse = {
            7, 
            27
        }, 
        hidden = {
            8, 
            28
        }, 
        strikethrough = {
            9, 
            29
        }
    }, 
    color = {
        black = {
            30, 
            39
        }, 
        red = {
            31, 
            39
        }, 
        green = {
            32, 
            39
        }, 
        yellow = {
            33, 
            39
        }, 
        blue = {
            34, 
            39
        }, 
        magenta = {
            35, 
            39
        }, 
        cyan = {
            36, 
            39
        }, 
        white = {
            37, 
            39
        }, 
        blackBright = {
            90, 
            39
        }, 
        gray = {
            90, 
            39
        }, 
        grey = {
            90, 
            39
        }, 
        redBright = {
            91, 
            39
        }, 
        greenBright = {
            92, 
            39
        }, 
        yellowBright = {
            93, 
            39
        }, 
        blueBright = {
            94, 
            39
        }, 
        magentaBright = {
            95, 
            39
        }, 
        cyanBright = {
            96, 
            39
        }, 
        whiteBright = {
            97, 
            39
        }
    }, 
    bgColor = {
        bgBlack = {
            40, 
            49
        }, 
        bgRed = {
            41, 
            49
        }, 
        bgGreen = {
            42, 
            49
        }, 
        bgYellow = {
            43, 
            49
        }, 
        bgBlue = {
            44, 
            49
        }, 
        bgMagenta = {
            45, 
            49
        }, 
        bgCyan = {
            46, 
            49
        }, 
        bgWhite = {
            47, 
            49
        }, 
        bgBlackBright = {
            100, 
            49
        }, 
        bgGray = {
            100, 
            49
        }, 
        bgGrey = {
            100, 
            49
        }, 
        bgRedBright = {
            101, 
            49
        }, 
        bgGreenBright = {
            102, 
            49
        }, 
        bgYellowBright = {
            103, 
            49
        }, 
        bgBlueBright = {
            104, 
            49
        }, 
        bgMagentaBright = {
            105, 
            49
        }, 
        bgCyanBright = {
            106, 
            49
        }, 
        bgWhiteBright = {
            107, 
            49
        }
    }
};
local v17 = {};
for _, v19 in pairs(v16) do
    for v20, v21 in pairs(v19) do
        v17[v20] = {
            open = string.format("%c[%dm", 27, v21[1]), 
            close = string.format("%c[%dm", 27, v21[2])
        };
    end;
end;
local v22 = nil;
local v23 = nil;
local function v26(v24, v25) --[[ Line: 115 ]] --[[ Name: compositeStyler ]]
    -- upvalues: v22 (ref)
    return v22(v24.open .. v25.open, v25.close .. v24.close);
end;
local function _() --[[ Line: 119 ]] --[[ Name: foundProcessService ]]
    return (pcall(function() --[[ Line: 120 ]]
        game:GetService("ProcessService");
    end));
end;
local v28 = {
    level = 2
};
if _G.NOCOLOR or not pcall(function() --[[ Line: 120 ]]
    game:GetService("ProcessService");
end) then
    v28.level = 0;
end;
setmetatable(v28, {
    __call = function(_, v30) --[[ Line: 132 ]] --[[ Name: __call ]]
        if v30 == nil or type(v30) == "string" and #v30 == 0 then
            return "";
        else
            return (tostring(v30));
        end;
    end
});
v22 = function(v31, v32) --[[ Line: 140 ]] --[[ Name: createStyler ]]
    -- upvalues: v23 (ref), v26 (copy)
    local v33 = {
        open = v31, 
        close = v32
    };
    setmetatable(v33, {
        __call = function(v34, v35) --[[ Line: 147 ]] --[[ Name: __call ]]
            -- upvalues: v23 (ref)
            return v23(v34, v35);
        end, 
        __concat = function(v36, v37) --[[ Line: 150 ]] --[[ Name: __concat ]]
            -- upvalues: v26 (ref)
            return v26(v36, v37);
        end
    });
    return v33;
end;
v23 = function(v38, v39) --[[ Line: 158 ]] --[[ Name: applyStyle ]]
    -- upvalues: v28 (copy), v7 (copy), v15 (copy)
    if v39 == nil or type(v39) == "string" and #v39 == 0 then
        return "";
    elseif v28.level == 0 then
        return (tostring(v39));
    else
        local l_open_0 = v38.open;
        local l_close_0 = v38.close;
        if string.match(v39, "\027") then
            v39 = v7(v39, v38.close, v38.open);
        end;
        local v42 = string.find(v39, "\n");
        if v42 ~= nil then
            v39 = v15(v39, l_close_0, l_open_0, v42);
        end;
        return v38.open .. tostring(v39) .. v38.close;
    end;
end;
local function v43() --[[ Line: 189 ]] --[[ Name: noStyle ]]
    -- upvalues: v22 (ref)
    return v22("", "");
end;
local v44 = string.format("%c[%dm", 27, 39);
local v45 = string.format("%c[%dm", 27, 49);
local v46 = string.format("%c[%dm", 27, 0);
for v47, v48 in pairs(v17) do
    v28[v47] = v22(v48.open, v48.close);
end;
v28.reset = v22(v46, v46);
local function v52(v49, v50, v51) --[[ Line: 203 ]] --[[ Name: rgbToAnsi256 ]]
    if v49 == v50 and v50 == v51 then
        if v49 < 8 then
            return 16;
        elseif v49 > 248 then
            return 231;
        else
            return (math.round((v49 - 8) / 247 * 24 + 232));
        end;
    else
        return 16 + 36 * math.round(v49 / 255 * 5) + 6 * math.round(v50 / 255 * 5) + math.round(v51 / 255 * 5);
    end;
end;
v28.rgb = function(v53, v54, v55) --[[ Line: 222 ]]
    -- upvalues: v43 (copy), v52 (copy), v22 (ref), v44 (copy)
    if type(v53) ~= "number" or type(v54) ~= "number" or type(v55) ~= "number" or v53 > 255 or v53 < 0 or v54 > 255 or v54 < 0 or v55 > 255 or v55 < 0 then
        return v43();
    else
        local v56 = string.format("%c[%d;5;%dm", 27, 38, (v52(v53, v54, v55)));
        return v22(v56, v44);
    end;
end;
v28.bgRgb = function(v57, v58, v59) --[[ Line: 240 ]]
    -- upvalues: v43 (copy), v52 (copy), v22 (ref), v45 (copy)
    if type(v57) ~= "number" or type(v58) ~= "number" or type(v59) ~= "number" or v57 > 255 or v57 < 0 or v58 > 255 or v58 < 0 or v59 > 255 or v59 < 0 then
        return v43();
    else
        local v60 = string.format("%c[%d;5;%dm", 27, 48, (v52(v57, v58, v59)));
        return v22(v60, v45);
    end;
end;
local function _(v61) --[[ Line: 258 ]] --[[ Name: hexToRgb ]]
    -- upvalues: v52 (copy)
    local v62 = tonumber(string.sub(v61, 2, 3), 16);
    local v63 = tonumber(string.sub(v61, 4, 5), 16);
    local v64 = tonumber(string.sub(v61, 6, 7), 16);
    return (v52(v62, v63, v64));
end;
v28.hex = function(v66) --[[ Line: 266 ]]
    -- upvalues: v43 (copy), v52 (copy), v22 (ref), v44 (copy)
    if type(v66) ~= "string" or string.find(v66, "#%X") ~= nil or #v66 ~= 7 then
        return v43();
    else
        local l_format_0 = string.format;
        local v68 = "%c[%d;5;%dm";
        local v69 = 27;
        local v70 = 38;
        local v71 = tonumber(string.sub(v66, 2, 3), 16);
        local v72 = tonumber(string.sub(v66, 4, 5), 16);
        local v73 = tonumber(string.sub(v66, 6, 7), 16);
        l_format_0 = l_format_0(v68, v69, v70, (v52(v71, v72, v73)));
        return v22(l_format_0, v44);
    end;
end;
v28.bgHex = function(v74) --[[ Line: 274 ]]
    -- upvalues: v43 (copy), v52 (copy), v22 (ref), v45 (copy)
    if type(v74) ~= "string" or string.find(v74, "#%X") ~= nil or #v74 ~= 7 then
        return v43();
    else
        local l_format_1 = string.format;
        local v76 = "%c[%d;5;%dm";
        local v77 = 27;
        local v78 = 48;
        local v79 = tonumber(string.sub(v74, 2, 3), 16);
        local v80 = tonumber(string.sub(v74, 4, 5), 16);
        local v81 = tonumber(string.sub(v74, 6, 7), 16);
        l_format_1 = l_format_1(v76, v77, v78, (v52(v79, v80, v81)));
        return v22(l_format_1, v45);
    end;
end;
v28.ansi = function(v82) --[[ Line: 282 ]]
    -- upvalues: v43 (copy), v22 (ref), v44 (copy)
    if type(v82) ~= "number" or v82 < 30 or v82 > 37 and v82 < 90 or v82 > 97 then
        return v43();
    else
        local v83 = string.format("%c[%dm", 27, v82);
        return v22(v83, v44);
    end;
end;
v28.bgAnsi = function(v84) --[[ Line: 290 ]]
    -- upvalues: v43 (copy), v22 (ref), v45 (copy)
    if type(v84) ~= "number" or v84 < 40 or v84 > 47 and v84 < 100 or v84 > 107 then
        return v43();
    else
        local v85 = string.format("%c[%dm", 27, v84);
        return v22(v85, v45);
    end;
end;
v28.ansi256 = function(v86) --[[ Line: 298 ]]
    -- upvalues: v43 (copy), v22 (ref), v44 (copy)
    if type(v86) ~= "number" or v86 < 0 or v86 > 255 then
        return v43();
    else
        local v87 = string.format("%c[%d;5;%dm", 27, 38, v86);
        return v22(v87, v44);
    end;
end;
v28.bgAnsi256 = function(v88) --[[ Line: 306 ]]
    -- upvalues: v43 (copy), v22 (ref), v45 (copy)
    if type(v88) ~= "number" or v88 < 0 or v88 > 255 then
        return v43();
    else
        local v89 = string.format("%c[%d;5;%dm", 27, 48, v88);
        return v22(v89, v45);
    end;
end;
return v28;