local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.pluralize).default;
local _ = require(script.Parent.types);
v5.default = function(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getNoTestFoundVerbose ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_default_0 (copy), v6 (copy)
    local v22 = l_Array_0.map(v10, function(v13) --[[ Line: 32 ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), l_Boolean_0 (ref), l_default_0 (ref), v6 (ref)
        local v14 = v13.matches.stats ~= nil and v13.matches.stats or {};
        local l_config_0 = v13.context.config;
        local v21 = l_Array_0.join(l_Array_0.filter(l_Array_0.map(l_Object_0.keys(v14), function(v16) --[[ Line: 39 ]]
            -- upvalues: l_config_0 (copy), l_Boolean_0 (ref), l_Array_0 (ref), l_default_0 (ref), v14 (copy), v6 (ref)
            if v16 == "roots" and #l_config_0.roots == 1 then
                return nil;
            else
                local v17 = l_config_0[v16];
                if l_Boolean_0.toJSBoolean(v17) then
                    local v18 = if l_Array_0.isArray(v17) then l_Array_0.join(v17, ", ") else tostring(v17);
                    local v19 = l_default_0("match", l_Boolean_0.toJSBoolean(v14[v16]) and v14[v16] or 0, "es");
                    return ("  %s: %s - %s"):format(v16, v6.yellow(v18), (tostring(v19)));
                else
                    return nil;
                end;
            end;
        end), function(v20) --[[ Line: 55 ]]
            -- upvalues: l_Boolean_0 (ref)
            return l_Boolean_0.toJSBoolean(v20);
        end), "\n");
        if l_Boolean_0.toJSBoolean(v13.matches.total) then
            return ("In %s\n"):format(v6.bold((tostring(l_config_0.rootDir)))) .. ("  %s checked.\n"):format(l_default_0("file", l_Boolean_0.toJSBoolean(v13.matches.total) and v13.matches.total or 0, "s")) .. v21;
        else
            return ("No files found in %s.\n"):format((tostring(l_config_0.rootDir))) .. "Make sure Jest's configuration does not exclude this directory." .. "\nTo set up Jest, make sure a package.json file exists.\n" .. "Jest Documentation: " .. "https://jestjs.io/docs/configuration";
        end;
    end);
    local v23 = nil;
    v23 = if v11.runTestsByPath then ("Files: %s"):format(l_Array_0.join(l_Array_0.map(v11.nonFlagArgs, function(v24) --[[ Line: 74 ]]
        return ("\"%s\""):format((tostring(v24)));
    end), ", ")) else ("Pattern: %s - 0 matches"):format(v6.yellow(v11.testPathPattern));
    if l_Boolean_0.toJSBoolean(v12) then
        return ("%s\n%s\n%s"):format(v6.bold("No tests found, exiting with code 0"), tostring(l_Array_0.join(v22, "\n")), (tostring(v23)));
    else
        return ("%s\n"):format(v6.bold("No tests found, exiting with code 1")) .. "Run with `--passWithNoTests` to exit with code 0" .. "\n" .. l_Array_0.join(v22, "\n") .. "\n" .. v23;
    end;
end;
return v5;