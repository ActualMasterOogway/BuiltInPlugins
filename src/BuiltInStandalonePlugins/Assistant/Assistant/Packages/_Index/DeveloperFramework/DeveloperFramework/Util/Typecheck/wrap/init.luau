local v0 = require(script.Parent.DocParser);
local function _(v1, v2, v3) --[[ Line: 34 ]] --[[ Name: validate ]]
    v1.validateProps = function() --[[ Line: 35 ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy)
        if v1.__renderAfterValidation then
            return true;
        else
            if v1.__renderWithContext then
                v1.__renderAfterValidation = v1.__renderWithContext;
                v1.__renderWithContext = function(v4) --[[ Line: 50 ]] --[[ Name: __renderWithContext ]]
                    -- upvalues: v2 (ref), v3 (ref), v1 (ref)
                    local v5, v6 = v2(v4.props);
                    if v5 then
                        if v3 then
                            local l_Stylizer_0 = v4.props.Stylizer;
                            local v8, v9 = v3(l_Stylizer_0);
                            v5 = v8;
                            v6 = v9;
                            if not v5 then
                                v6 = ("%s\n\tFound in the StyleTable of the Component %q."):format(v6, (tostring(v1)));
                            end;
                        end;
                    else
                        v6 = ("%s\n\tFound in the props table of the Component %q."):format(v6, (tostring(v1)));
                    end;
                    assert(v5, v6);
                    return v4:__renderAfterValidation();
                end;
            else
                v1.__renderAfterValidation = v1.render;
                v1.render = function(v10) --[[ Line: 68 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v1 (ref)
                    local v11, v12 = v2(v10.props);
                    if not v11 then
                        v12 = ("%s\n\tFound in the props table of the Component %q."):format(v12, (tostring(v1)));
                    end;
                    assert(v11, v12);
                    return v10:__renderAfterValidation();
                end;
            end;
            return true;
        end;
    end;
end;
return function(v14, v15) --[[ Line: 82 ]] --[[ Name: wrap ]]
    -- upvalues: v0 (copy)
    local v16 = false;
    pcall(function() --[[ Line: 86 ]]
        -- upvalues: v16 (ref), v15 (copy)
        v16 = v15.Source ~= "";
    end);
    if v16 then
        local v17 = v0.new(v14, v15):parse();
        local v18, v19 = v0.toInterface(v17);
        v14.validateProps = function() --[[ Line: 35 ]]
            -- upvalues: v14 (copy), v18 (copy), v19 (copy)
            if v14.__renderAfterValidation then
                return true;
            else
                if v14.__renderWithContext then
                    v14.__renderAfterValidation = v14.__renderWithContext;
                    v14.__renderWithContext = function(v20) --[[ Line: 50 ]] --[[ Name: __renderWithContext ]]
                        -- upvalues: v18 (ref), v19 (ref), v14 (ref)
                        local v21, v22 = v18(v20.props);
                        if v21 then
                            if v19 then
                                local l_Stylizer_1 = v20.props.Stylizer;
                                local v24, v25 = v19(l_Stylizer_1);
                                v21 = v24;
                                v22 = v25;
                                if not v21 then
                                    v22 = ("%s\n\tFound in the StyleTable of the Component %q."):format(v22, (tostring(v14)));
                                end;
                            end;
                        else
                            v22 = ("%s\n\tFound in the props table of the Component %q."):format(v22, (tostring(v14)));
                        end;
                        assert(v21, v22);
                        return v20:__renderAfterValidation();
                    end;
                else
                    v14.__renderAfterValidation = v14.render;
                    v14.render = function(v26) --[[ Line: 68 ]] --[[ Name: render ]]
                        -- upvalues: v18 (ref), v14 (ref)
                        local v27, v28 = v18(v26.props);
                        if not v27 then
                            v28 = ("%s\n\tFound in the props table of the Component %q."):format(v28, (tostring(v14)));
                        end;
                        assert(v27, v28);
                        return v26:__renderAfterValidation();
                    end;
                end;
                return true;
            end;
        end;
    end;
end;