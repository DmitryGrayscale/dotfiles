--[[

     Rainbow Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/rainbow"
theme.wallpaper                                 = os.getenv("HOME") .. "/Изображения/Wallpapers/pac2.jpg"
--theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/themes/multicolor/wall2.jpg"
theme.font                                      = "Play 9"
theme.fg_normal                                 = "#9E9E9E"
theme.fg_focus                                  = "#EBEBFF"
--theme.bg_normal                                 = "#392747"
theme.bg_normal                                 = "#202020"
--theme.bg_normal                                 = "#242424aa"
theme.bg_systray                                = theme.bg_normal
theme.systray_icon_spacing                      = 7 
--theme.bg_focus                                  = "#242424aa"
theme.bg_focus                                  = "#242424"
theme.fg_urgent                                 = "#000000"
theme.bg_urgent                                 = "#FFFFFF"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#1c1c1c"
theme.border_focus                              = "#FE8019"
theme.taglist_fg_focus                          = "#333333"
theme.taglist_bg_focus                          = "#FE8019"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.ocol                                      = "<span color='" .. theme.fg_normal .. "'>"
theme.tasklist_bg_normal                        = "#24242400"
theme.tasklist_bg_focus                         = "#66d9ef00"
theme.tasklist_sticky                           = theme.ocol .. "[S]</span>"
theme.tasklist_ontop                            = theme.ocol .. "[T]</span>"
theme.tasklist_floating                         = theme.ocol .. "[F]</span>"
theme.tasklist_maximized_horizontal             = theme.ocol .. "[M] </span>"
theme.tasklist_maximized_vertical               = ""
theme.tasklist_disable_icon                     = true
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .."/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.useless_gap                               = dpi(2)

theme.layout_tile                               = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/tile.png"
theme.layout_tileleft                           = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/tileleft.png"
theme.layout_tilebottom                         = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/tilebottom.png"
theme.layout_tiletop                            = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/tiletop.png"
theme.layout_fairv                              = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/fairv.png"
theme.layout_fairh                              = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/fairh.png"
theme.layout_spiral                             = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/spiral.png"
theme.layout_dwindle                            = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/dwindle.png"
theme.layout_max                                = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/max.png"
theme.layout_fullscreen                         = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/fullscreen.png"
theme.layout_magnifier                          = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/magnifier.png"
theme.layout_floating                           = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark" .. "/icons/floating.png"


-- theme.layout_txt_tile                           = "[t]"
-- theme.layout_txt_tileleft                       = "[l]"
-- theme.layout_txt_tilebottom                     = "[b]"
-- theme.layout_txt_tiletop                        = "[tt]"
-- theme.layout_txt_fairv                          = "[fv]"
-- theme.layout_txt_fairh                          = "[fh]"
-- theme.layout_txt_spiral                         = "[s]"
-- theme.layout_txt_dwindle                        = "[d]"
-- theme.layout_txt_max                            = "[m]"
-- theme.layout_txt_fullscreen                     = "[F]"
-- theme.layout_txt_magnifier                      = "[M]"
-- theme.layout_txt_floating                       = "[*]"
theme.titlebar_close_button_normal              = theme.default_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.default_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.default_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.default_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.default_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.default_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.default_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.default_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.default_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.default_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.default_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.default_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.default_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.default_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.default_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.default_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.default_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.default_dir.."/titlebar/maximized_focus_active.png"

-- lain related
--theme.layout_txt_cascade                        = "[cascade]"
--theme.layout_txt_cascadetile                    = "[cascadetile]"
--theme.layout_txt_centerwork                     = "[centerwork]"
--theme.layout_txt_termfair                       = "[termfair]"
--theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local white  = theme.fg_focus
local gray   = theme.fg_normal

-- Textclock
local mytextclock = wibox.widget.textclock(markup(white, " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Misc Tamsyn 11",
        fg   = white,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--[[ commented because it needs to be set before use
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail_notification_preset.fg = white

        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(gray, mail) .. markup(white, count)))
    end
})
--]]

-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset.fg = white

        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
        end

        widget:set_markup(markup.font(theme.font, markup(gray, artist) .. markup(white, title)))
    end
})

-- /home fs
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = white, bg = theme.bg_normal, font = "Misc Tamsyn 10.5" },
    settings  = function()
        local fs_header, fs_p = "", ""

        if fs_now["/home"].percentage >= 90 then
            fs_header = " Hdd "
            fs_p      = fs_now["/home"].percentage
        end

        widget:set_markup(markup.font(theme.font, markup(gray, fs_header) .. markup(white, fs_p)))
    end
})
--]]

-- ALSA volume bar
-- theme.volume = lain.widget.alsabar({
--     ticks = true, width = dpi(67),
--     notification_preset = { font = theme.font },
--     colors = {unmute = "#a6e22e", background = "#000000", mute = "#f92672"}
-- })
-- theme.volume.tooltip.wibox.fg = theme.fg_focus
-- theme.volume.tooltip.wibox.font = theme.font
-- theme.volume.bar:buttons(my_table.join (
--           awful.button({}, 1, function()
--             awful.spawn(string.format("%s -e alsamixer", terminal))
--           end),
--           awful.button({}, 2, function()
--             os.execute(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
--             theme.volume.update()
--           end),
--           awful.button({}, 3, function()
--             os.execute(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
--             theme.volume.update()
--           end),
--           awful.button({}, 4, function()
--             os.execute(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
--             theme.volume.update()
--           end),
--           awful.button({}, 5, function()
--             os.execute(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
--             theme.volume.update()
--           end)
-- ))
-- local volumebg = wibox.container.background(theme.volume.bar, "#898989", gears.shape.rectangle)
-- local volumewidget = wibox.container.margin(volumebg, dpi(7), dpi(7), dpi(5), dpi(5))

-- Weather
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
    notification_preset = { font = theme.font, fg = white }
})

-- Separators
local first = wibox.widget.textbox(markup.font("Misc Tamsyn 4", " "))
local spr   = wibox.widget.textbox('   ')

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()


    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox.forced_width = 18
    s.mylayoutbox.forced_height = 18
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Textual layoutbox
    -- s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    -- awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    -- awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    -- s.mytxtlayoutbox:buttons(my_table.join(
    --                        awful.button({}, 1, function() awful.layout.inc(1) end),
    --                        awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
    --                        awful.button({}, 3, function() awful.layout.inc(-1) end),
    --                        awful.button({}, 4, function() awful.layout.inc(1) end),
    --                        awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

--    s.mytasklist = awful.widget.tasklist {
--    screen   = s,
--    filter   = awful.widget.tasklist.filter.currenttags,
--    buttons  = tasklist_buttons,
--    style    = {
--        shape_border_width = 1,
--        shape_border_color = '#777777',
--	shape_radius = 3,
--        shape  = gears.shape.rounded_rect,
--    },
--    layout   = {
--        spacing = 10,
--	forced_width = 50,
--        spacing_widget = {
--            {
--                forced_width = 2,
--                shape        = gears.shape.circle,
--                widget       = wibox.widget.separator
--            },
--            valign = 'center',
--            halign = 'center',
--            widget = wibox.container.place,
--        },
--        layout  = wibox.layout.fixed.horizontal
--    },
--    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
--    -- not a widget instance.
--    widget_template = {
--        {
--            {
--                {
--                    {
--                        id     = 'icon_role',
--                        widget = wibox.widget.imagebox,
--                    },
--                    margins = 2,
--                    widget  = wibox.container.margin,
--                },
--                {
--                    id     = 'text_role',
--                    widget = wibox.widget.textbox,
--                },
--                layout = wibox.layout.fixed.horizontal,
--            },
--            left  = 10,
--            right = 10,
--            widget = wibox.container.margin
--        },
--        id     = 'background_role',
--        widget = wibox.container.background,
--    },
--}
    local sneakytray = wibox.widget.imagebox(theme.menu_submenu_icon)
    sneakytray:buttons(my_table.join(
                          awful.button({}, 1, function () mysystray.visible = not mysystray.visible end)))
    
    mykeyboardlayout = awful.widget.keyboardlayout()

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })
    s.borderwibox = awful.wibar({ position = "top", screen = s, height = dpi(1), bg = theme.taglist_bg_focus, x = dpi(0), y = dpi(19)})

    local stray = wibox.widget.systray()
    stray:set_base_size(22)
    --stray.forced_height = 22
 local strayw = wibox.container.margin(stray, 0,0,3,2)

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
--            wibox.container.background(s.mylayoutbox, "#f92672"),
            s.mylayoutbox,
            first,
            s.mytaglist,
            spr,
            --s.mytxtlayoutbox,
            --s.mylayoutbox,
            --spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --wibox.widget.systray(),
            --theme.mpd.widget,
            --sneakytray,
            --mysystray,
            strayw,
            spr,
            mykeyboardlayout,
            spr,
	    brightness_widget,
            spr,
	    battery_widget,
            spr,
	    volume_widget,
            spr,
	    --theme.mail.widget,
            --theme.fs.widget,
            --volumewidget,
            mytextclock,
        },
    }
end

return theme
