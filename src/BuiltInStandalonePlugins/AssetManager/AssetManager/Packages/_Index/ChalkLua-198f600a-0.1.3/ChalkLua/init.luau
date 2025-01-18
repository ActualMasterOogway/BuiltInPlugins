local v0 = {
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
local v1 = {};
for _, v3 in pairs(v0) do
    for v4, v5 in pairs(v3) do
        v1[v4] = {
            open = string.format("%c[%dm", 27, v5[1]), 
            close = string.format("%c[%dm", 27, v5[2])
        };
    end;
end;
local v6 = nil;
local function v9(v7, v8) --[[ Line: 88 ]] --[[ Name: compositeStyler ]]
    -- upvalues: v6 (ref)
    return v6(v7.open .. v8.open, v8.close .. v7.close);
end;
local function _() --[[ Line: 95 ]] --[[ Name: foundProcessService ]]
    return (pcall(function() --[[ Line: 96 ]]
        game:getService("ProcessService");
    end));
end;
local v11 = {
    level = 2
};
if _G.NOCOLOR or not pcall(function() --[[ Line: 96 ]]
    game:getService("ProcessService");
end) then
    v11.level = 0;
end;
setmetatable(v11, {
    __call = function(_, v13) --[[ Line: 108 ]] --[[ Name: __call ]]
        if v13 == nil or type(v13) == "string" and #v13 == 0 then
            return "";
        else
            return (tostring(v13));
        end;
    end
});
v6 = function(v14, v15) --[[ Line: 117 ]]
    -- upvalues: v11 (copy), v9 (copy)
    local v16 = {
        open = v14, 
        close = v15
    };
    setmetatable(v16, {
        __call = function(v17, v18) --[[ Line: 126 ]] --[[ Name: __call ]]
            -- upvalues: v11 (ref)
            if v18 == nil or type(v18) == "string" and #v18 == 0 then
                return "";
            elseif v11.level == 0 then
                return (tostring(v18));
            else
                return v17.open .. tostring(v18) .. v17.close;
            end;
        end, 
        __concat = function(v19, v20) --[[ Line: 135 ]] --[[ Name: __concat ]]
            -- upvalues: v9 (ref)
            return v9(v19, v20);
        end
    });
    return v16;
end;
local function v21() --[[ Line: 144 ]] --[[ Name: noStyle ]]
    -- upvalues: v6 (ref)
    return v6("", "");
end;
local v22 = string.format("%c[%dm", 27, 39);
local v23 = string.format("%c[%dm", 27, 49);
local v24 = string.format("%c[%dm", 27, 0);
for v25, v26 in pairs(v1) do
    v11[v25] = v6(v26.open, v26.close);
end;
v11.reset = v6(v24, v24);
local function v30(v27, v28, v29) --[[ Line: 158 ]] --[[ Name: rgbToAnsi256 ]]
    if v27 == v28 and v28 == v29 then
        if v27 < 8 then
            return 16;
        elseif v27 > 248 then
            return 231;
        else
            return (math.round((v27 - 8) / 247 * 24 + 232));
        end;
    else
        return 16 + 36 * math.round(v27 / 255 * 5) + 6 * math.round(v28 / 255 * 5) + math.round(v29 / 255 * 5);
    end;
end;
v11.rgb = function(v31, v32, v33) --[[ Line: 177 ]]
    -- upvalues: v21 (copy), v30 (copy), v6 (ref), v22 (copy)
    if type(v31) ~= "number" or type(v32) ~= "number" or type(v33) ~= "number" or v31 > 255 or v31 < 0 or v32 > 255 or v32 < 0 or v33 > 255 or v33 < 0 then
        return v21();
    else
        local v34 = string.format("%c[%d;5;%dm", 27, 38, (v30(v31, v32, v33)));
        return v6(v34, v22);
    end;
end;
v11.bgRgb = function(v35, v36, v37) --[[ Line: 194 ]]
    -- upvalues: v21 (copy), v30 (copy), v6 (ref), v23 (copy)
    if type(v35) ~= "number" or type(v36) ~= "number" or type(v37) ~= "number" or v35 > 255 or v35 < 0 or v36 > 255 or v36 < 0 or v37 > 255 or v37 < 0 then
        return v21();
    else
        local v38 = string.format("%c[%d;5;%dm", 27, 48, (v30(v35, v36, v37)));
        return v6(v38, v23);
    end;
end;
local function _(v39) --[[ Line: 211 ]] --[[ Name: hexToRgb ]]
    -- upvalues: v30 (copy)
    local v40 = tonumber(string.sub(v39, 2, 3), 16);
    local v41 = tonumber(string.sub(v39, 4, 5), 16);
    local v42 = tonumber(string.sub(v39, 6, 7), 16);
    return (v30(v40, v41, v42));
end;
v11.hex = function(v44) --[[ Line: 219 ]]
    -- upvalues: v21 (copy), v30 (copy), v6 (ref), v22 (copy)
    if type(v44) ~= "string" or string.find(v44, "#%X") ~= nil or #v44 ~= 7 then
        return v21();
    else
        local l_format_0 = string.format;
        local v46 = "%c[%d;5;%dm";
        local v47 = 27;
        local v48 = 38;
        local v49 = tonumber(string.sub(v44, 2, 3), 16);
        local v50 = tonumber(string.sub(v44, 4, 5), 16);
        local v51 = tonumber(string.sub(v44, 6, 7), 16);
        l_format_0 = l_format_0(v46, v47, v48, (v30(v49, v50, v51)));
        return v6(l_format_0, v22);
    end;
end;
v11.bgHex = function(v52) --[[ Line: 232 ]]
    -- upvalues: v21 (copy), v30 (copy), v6 (ref), v23 (copy)
    if type(v52) ~= "string" or string.find(v52, "#%X") ~= nil or #v52 ~= 7 then
        return v21();
    else
        local l_format_1 = string.format;
        local v54 = "%c[%d;5;%dm";
        local v55 = 27;
        local v56 = 48;
        local v57 = tonumber(string.sub(v52, 2, 3), 16);
        local v58 = tonumber(string.sub(v52, 4, 5), 16);
        local v59 = tonumber(string.sub(v52, 6, 7), 16);
        l_format_1 = l_format_1(v54, v55, v56, (v30(v57, v58, v59)));
        return v6(l_format_1, v23);
    end;
end;
v11.ansi = function(v60) --[[ Line: 245 ]]
    -- upvalues: v21 (copy), v6 (ref), v22 (copy)
    if type(v60) ~= "number" or v60 < 30 or v60 > 37 and v60 < 90 or v60 > 97 then
        return v21();
    else
        local v61 = string.format("%c[%dm", 27, v60);
        return v6(v61, v22);
    end;
end;
v11.bgAnsi = function(v62) --[[ Line: 257 ]]
    -- upvalues: v21 (copy), v6 (ref), v23 (copy)
    if type(v62) ~= "number" or v62 < 40 or v62 > 47 and v62 < 100 or v62 > 107 then
        return v21();
    else
        local v63 = string.format("%c[%dm", 27, v62);
        return v6(v63, v23);
    end;
end;
v11.ansi256 = function(v64) --[[ Line: 269 ]]
    -- upvalues: v21 (copy), v6 (ref), v22 (copy)
    if type(v64) ~= "number" or v64 < 0 or v64 > 255 then
        return v21();
    else
        local v65 = string.format("%c[%d;5;%dm", 27, 38, v64);
        return v6(v65, v22);
    end;
end;
v11.bgAnsi256 = function(v66) --[[ Line: 282 ]]
    -- upvalues: v21 (copy), v6 (ref), v23 (copy)
    if type(v66) ~= "number" or v66 < 0 or v66 > 255 then
        return v21();
    else
        local v67 = string.format("%c[%d;5;%dm", 27, 48, v66);
        return v6(v67, v23);
    end;
end;
return v11;