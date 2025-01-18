local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_splitOn_0 = require(l_script_FirstAncestor_0.Packages.Dash).splitOn;
return function(v2) --[[ Line: 4 ]]
    -- upvalues: l_splitOn_0 (copy)
    if v2 ~= nil and #v2 > 0 then
        local v3 = "";
        for _, v5 in v2 do
            local v6, _ = l_splitOn_0(tostring(v5), "%.");
            local v8 = v6[#v6];
            if v8 == "Down" then
                v8 = "\226\134\147";
            elseif v8 == "Up" then
                v8 = "\226\134\145";
            elseif v8 == "Left" then
                v8 = "\226\134\144";
            elseif v8 == "Right" then
                v8 = "\226\134\146";
            elseif v8 == "One" then
                v8 = "1";
            elseif v8 == "Two" then
                v8 = "2";
            elseif v8 == "Three" then
                v8 = "3";
            elseif v8 == "Four" then
                v8 = "4";
            elseif v8 == "Five" then
                v8 = "5";
            elseif v8 == "Six" then
                v8 = "6";
            elseif v8 == "Seven" then
                v8 = "7";
            elseif v8 == "Eight" then
                v8 = "8";
            elseif v8 == "Nine" then
                v8 = "9";
            elseif v8 == "Zero" then
                v8 = "0";
            elseif v8 == "BackSlash" then
                v8 = "\\";
            elseif v8 == "Slash" then
                v8 = "/";
            elseif v8 == "Period" then
                v8 = ".";
            elseif v8 == "Comma" then
                v8 = ",";
            elseif v8 == "Semicolon" then
                v8 = ";";
            elseif v8 == "Quote" then
                v8 = "'";
            elseif v8 == "Backquote" then
                v8 = "`";
            elseif v8 == "LeftBracket" then
                v8 = "[";
            elseif v8 == "RightBracket" then
                v8 = "]";
            elseif v8 == "Minus" then
                v8 = "-";
            elseif v8 == "Equals" then
                v8 = "=";
            elseif v8 == "Backspace" then
                v8 = "Bksp";
            elseif v8 == "Return" then
                v8 = "Ret";
            elseif v8 == "Space" then
                v8 = "\226\144\163";
            elseif v8 == "Escape" then
                v8 = "Esc";
            elseif v8 == "Delete" then
                v8 = "Del";
            elseif v8 == "Insert" then
                v8 = "Ins";
            elseif v8 == "Home" then
                v8 = "Home";
            elseif v8 == "End" then
                v8 = "End";
            elseif v8 == "PageUp" then
                v8 = "PU";
            elseif v8 == "PageDown" then
                v8 = "PD";
            end;
            if #v3 > 0 then
                v3 = v3 .. "+" .. v8;
            else
                v3 = v8;
            end;
        end;
        return v3;
    else
        return "---";
    end;
end;