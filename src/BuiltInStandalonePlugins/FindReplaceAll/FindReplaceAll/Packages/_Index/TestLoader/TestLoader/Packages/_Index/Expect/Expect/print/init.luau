local l_Parent_0 = script.Parent.Parent;
local l_Number_0 = require(l_Parent_0.LuauPolyfill).Number;
local v2 = require(l_Parent_0.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v2.EXPECTED_COLOR;
local l_INVERTED_COLOR_0 = v2.INVERTED_COLOR;
local l_RECEIVED_COLOR_0 = v2.RECEIVED_COLOR;
local l_printReceived_0 = v2.printReceived;
local l_stringify_0 = v2.stringify;
local function _(v8) --[[ Line: 27 ]] --[[ Name: printSubstring ]]
    return (v8:gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"));
end;
local function v13(v10, v11, v12) --[[ Line: 33 ]] --[[ Name: printReceivedStringContainExpectedSubstring ]]
    -- upvalues: l_RECEIVED_COLOR_0 (copy), l_INVERTED_COLOR_0 (copy)
    return l_RECEIVED_COLOR_0("\"" .. v10:sub(0, v11 - 1):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1")) .. l_INVERTED_COLOR_0((v10:sub(v11, v11 + v12 - 1):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))) .. l_RECEIVED_COLOR_0((v10:sub(v11 + v12, #v10):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))) .. "\"";
end;
local function v16(v14, v15) --[[ Line: 44 ]] --[[ Name: printReceivedStringContainExpectedResult ]]
    -- upvalues: l_printReceived_0 (copy), v13 (copy)
    if v15 == nil then
        return l_printReceived_0(v14);
    else
        return (v13(v14, v15.index, #v15[1]));
    end;
end;
local function v23(v17, v18) --[[ Line: 56 ]] --[[ Name: printReceivedArrayContainExpectedItem ]]
    -- upvalues: l_stringify_0 (copy), l_INVERTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy)
    local v19 = {};
    for v20, v21 in ipairs(v17) do
        local v22 = l_stringify_0(v21);
        if v20 == v18 then
            v19[v20] = l_INVERTED_COLOR_0(v22);
        else
            v19[v20] = l_RECEIVED_COLOR_0(v22);
        end;
    end;
    return l_RECEIVED_COLOR_0("{") .. table.concat(v19, l_RECEIVED_COLOR_0(", ")) .. l_RECEIVED_COLOR_0("}");
end;
local function v31(v24, v25, v26, v27) --[[ Line: 70 ]] --[[ Name: printCloseTo ]]
    -- upvalues: l_stringify_0 (copy), l_Number_0 (copy), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy)
    local v28 = l_stringify_0(v24);
    local v29 = nil;
    if v28:find("e") then
        v28 = v28:gsub("%+0", "+"):gsub("%-0", "-");
        v29 = l_Number_0.toExponential(v25, 0);
    elseif v26 >= 0 and v26 < 20 then
        local v30 = "%." .. v26 + 1 .. "f";
        v29 = string.format(v30, v25);
    else
        v29 = l_stringify_0(v25);
    end;
    if v27 then
        return string.format("Expected precision:  %s  %s\n" .. "Expected difference: %s< %s\n" .. "Received difference: %s  %s", "      ", l_stringify_0(v26), "never ", l_EXPECTED_COLOR_0(v29), "      ", l_RECEIVED_COLOR_0(v28));
    else
        return string.format("Expected precision:  %s  %s\n" .. "Expected difference: %s< %s\n" .. "Received difference: %s  %s", "", l_stringify_0(v26), "", l_EXPECTED_COLOR_0(v29), "", l_RECEIVED_COLOR_0(v28));
    end;
end;
local function v34(v32, v33) --[[ Line: 111 ]] --[[ Name: printExpectedConstructorName ]]
    return printConstructorName(v32, v33, false, true) .. "\n";
end;
local function v37(v35, v36) --[[ Line: 115 ]] --[[ Name: printExpectedConstructorNameNot ]]
    return printConstructorName(v35, v36, true, true) .. "\n";
end;
local function v40(v38, v39) --[[ Line: 119 ]] --[[ Name: printReceivedConstructorName ]]
    return printConstructorName(v38, v39, false, false) .. "\n";
end;
local function v42(v41) --[[ Line: 128 ]] --[[ Name: printable ]]
    if typeof(v41) == "table" then
        return tostring(v41):find("table: 0x") == nil;
    elseif typeof(v41) == "function" then
        return tostring(v41):find("function: 0x") == nil;
    elseif typeof(v41) == "userdata" then
        return tostring(v41):find("userdata: 0x") == nil;
    elseif typeof(v41) == "thread" then
        return tostring(v41):find("thread: 0x") == nil;
    else
        return true;
    end;
end;
local function v47(v43, v44, v45) --[[ Line: 143 ]] --[[ Name: printReceivedConstructorNameNot ]]
    -- upvalues: v42 (copy), l_EXPECTED_COLOR_0 (copy)
    local v46 = nil;
    if typeof((tostring(v45))) == "string" and #tostring(v45) ~= 0 and typeof((tostring(v44))) == "string" and #tostring(v44) ~= 0 then
        if v42(v45) and v42(v44) then
            v46 = printConstructorName(v43, v44, true, false);
            return (if getmetatable(v44) and getmetatable(v44).__index == v45 then v46 .. " extends " else v46 .. " extends \226\128\166 extends ") .. l_EXPECTED_COLOR_0((tostring(v45))) .. "\n";
        else
            return printConstructorName(v43, v44, true, false) .. "\n";
        end;
    else
        return printConstructorName(v43, v44, false, false) .. "\n";
    end;
end;
printConstructorName = function(v48, v49, v50, v51) --[[ Line: 177 ]] --[[ Name: printConstructorName ]]
    -- upvalues: v42 (copy), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy), l_stringify_0 (copy)
    local v52 = v48 .. ": ";
    v52 = if not v50 then v52 .. "" else if v51 then v52 .. "never " else v52 .. "      ";
    if v42(v49) then
        if #tostring(v49) == 0 then
            return string.format("%s name is an empty string", v48);
        elseif v51 then
            return v52 .. l_EXPECTED_COLOR_0((tostring(v49)));
        else
            return v52 .. l_RECEIVED_COLOR_0((tostring(v49)));
        end;
    else
        local v53 = "{ ";
        local v54 = true;
        local v55 = false;
        for v56, v57 in pairs(v49) do
            local v58 = nil;
            if v42(v56) and v42(v57) then
                v58 = string.format("%s: %s, ", l_stringify_0(v56), l_stringify_0(v57));
            elseif v42(v56) and v56:find("__") ~= 1 then
                v58 = string.format("%s, ", l_stringify_0(v56));
            end;
            if v58 then
                if #v53 + #v58 > 64 then
                    v54 = false;
                    break;
                else
                    v55 = true;
                    v53 = v53 .. v58;
                end;
            end;
        end;
        if v55 == false then
            if v51 then
                return v52 .. l_EXPECTED_COLOR_0((tostring(v49)));
            else
                return v52 .. l_RECEIVED_COLOR_0((tostring(v49)));
            end;
        else
            v53 = if v54 then v53:sub(1, -3) .. " }" else v53 .. "... }";
            if v51 then
                return v52 .. l_EXPECTED_COLOR_0(v53);
            else
                return v52 .. l_RECEIVED_COLOR_0(v53);
            end;
        end;
    end;
end;
return {
    printReceivedStringContainExpectedSubstring = v13, 
    printReceivedStringContainExpectedResult = v16, 
    printReceivedArrayContainExpectedItem = v23, 
    printCloseTo = v31, 
    printExpectedConstructorName = v34, 
    printExpectedConstructorNameNot = v37, 
    printReceivedConstructorName = v40, 
    printReceivedConstructorNameNot = v47
};