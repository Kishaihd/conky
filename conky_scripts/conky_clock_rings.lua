function conky_clock_rings()
    local function setup_rings(cr,pt)
        local str=''
        local value=0
        
        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)
        str = string.gsub(str, "%.", "%,")
	if string.len(str) == 5 then
	    str1 = string.sub(str, 1, 2)
	    str2 = string.sub(str, 4, 5)
	    val1 = tonumber(str1)
	    val2 = tonumber(str2)
	    value = val1 + (val2 / 60.0)		
	else
            value = tonumber(str)
	end
	pct=value/pt['max']
        draw_ring(cr,pct,pt)
    end
    
    -- Check that Conky has been running for at least 5s

    if conky_window==nil then return end
    local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
    
    local cr=cairo_create(cs)    
    
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)
    
    --[[]]
    if update_num>5 then
        for i in pairs(settings_table) do
            setup_rings(cr,settings_table[i])
        end
    end
	--]]    

    draw_clock_hands(cr,clock_x,clock_y)
end