local v0 = require(script.Parent.DocParser_stubbed);
v0.parse = function(v1) --[[ Line: 6 ]] --[[ Name: parse ]]
    return {
        Props = {}, 
        Style = {}, 
        Summary = v1.name
    };
end;
return v0;