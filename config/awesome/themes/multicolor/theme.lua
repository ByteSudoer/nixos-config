--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]
local gears = require("gears")
local beautiful = require("beautiful")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.confdir = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.font = "Comic Mono 10"
theme.taglist_font = "Comic Mono 10"
-- Gruvbox
theme.menu_bg_normal = "#1d2021"
theme.menu_bg_focus = "#1d2021"
-- theme.bg_normal                                 = "#565F65"
theme.bg_normal = "#1d2021"
theme.bg_focus = "#1d2021"
theme.bg_urgent = "#1d2021"
theme.fg_normal = "#f9f5d7"
theme.fg_focus = "#ff8c00"
theme.fg_urgent = "#af1d18"
theme.fg_minimize = "#f9f5d7"
theme.border_width = dpi(3)
theme.border_normal = "#1c2022"
theme.border_focus = "#fb4934"
theme.border_marked = "#3ca4d8"
theme.menu_border_width = 0
theme.menu_width = dpi(130)
theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal = "#aaaaaa"
theme.menu_fg_focus = "#ff8c00"
-- theme.menu_bg_normal = "#050505dd"
-- theme.menu_bg_focus = "#050505dd"

-- theme.menu_bg_normal = "#282a36"
-- theme.menu_bg_focus = "#44475a"
-- theme.bg_normal = "#1d2021"
-- theme.bg_focus = "#1d2021"
-- theme.bg_urgent = "#1d2021"
-- theme.fg_normal = "#f9f5d7"
-- theme.fg_focus = "#bd93f9"
-- theme.fg_urgent = "#ff5555"
-- theme.fg_minimize = "#f9f5d7"
-- theme.border_width = dpi(3)
-- theme.border_normal = "#1c2022"
-- theme.border_focus = "#8be9fd"
-- theme.border_marked = "#3ca4d8"
-- theme.menu_border_width = 0
-- theme.menu_width = dpi(130)
-- theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
-- theme.menu_fg_normal = "#bd93f9"
-- theme.menu_fg_focus = "#ffb86c"

----------------
theme.widget_temp = theme.confdir .. "/icons/temp.png"
theme.widget_uptime = theme.confdir .. "/icons/ac.png"
theme.widget_cpu = theme.confdir .. "/icons/cpu.png"
theme.widget_weather = theme.confdir .. "/icons/dish.png"
theme.widget_fs = theme.confdir .. "/icons/fs.png"
theme.widget_mem = theme.confdir .. "/icons/mem.png"
theme.widget_netdown = theme.confdir .. "/icons/net_down.png"
theme.widget_netup = theme.confdir .. "/icons/net_up.png"
theme.widget_mail = theme.confdir .. "/icons/mail.png"
theme.widget_batt = theme.confdir .. "/icons/bat.png"
theme.widget_clock = theme.confdir .. "/icons/clock.png"
-- theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.widget_music = theme.confdir .. "/icons/note.png"
theme.widget_music_on = theme.confdir .. "/icons/note.png"
theme.widget_music_pause = theme.confdir .. "/icons/pause.png"
theme.widget_music_stop = theme.confdir .. "/icons/stop.png"
theme.taglist_squares_sel = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = 3
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock

local weather_widget = require("awesome-wm-widgets.weather-widget.weather")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
-- local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-widget")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- local battery_widget = require("awesome-wm-widgets.battery-widget.battery")
-- local docker_widget = require("awesome-wm-widgets.docker-widget.docker")
-- local todo_widget = require("awesome-wm-widgets.todo-widget.todo")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")

mytextclock = wibox.widget.textclock()
local cw = calendar_widget({
	theme = "nord",
	placement = "top_right",
	start_sunday = true,
	radius = 8,
	-- with customized next/previous (see table above)
	previous_month_button = 1,
	next_month_button = 3,
})
mytextclock:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		cw.toggle()
	end
end)

function theme.at_screen_connect(s)
	-- -- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	-- Create the wibox
	s.mywibox =
		awful.wibar({ position = "top", screen = s, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mylayoutbox,
			s.mytaglist,
			s.mypromptbox,
		},
		--s.mytasklist, -- Middle widget
		nil,
		{
			-- Right widgets
			layout = wibox.layout.fixed.horizontal,
			-- spotify_widget({
			-- 	font = "Source Code Pro 9",
			-- 	play_icon = "/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg",
			-- 	pause_icon = "/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg",
			-- 	dim_when_paused = true,
			-- 	dim_opacity = 0.5,
			-- 	max_lenght = 5,
			-- }),
			wibox.widget.systray(),
			-- todo_widget(),
			-- docker_widget({
			-- 	number_of_containers = 5,
			-- }),
			ram_widget({
				timeout = 1,
			}),
			-- memicon,
			-- memory.widget,
			-- cpuicon,
			-- cpu.widget,
			cpu_widget({
				width = 70,
				step_width = 4,
				step_spacing = 1,
				-- color = beautiful.fg_normal,
				process_info_max_length = -1,
				timeout = 1,
			}),
			net_speed_widget(),
			mytextclock,
			volume_widget({
				widget_type = "arc",
				device = "default",
				mixer_cmd = "pavucontrol",
				step = 5,
			}),
			-- battery_widget(),
			weather_widget({
				api_key = "7b78ee65feb3b7d1cf3a81ccedad3871",
				coordinates = { 36.81897, 10.16579 },
				font_name = "Source Code Pro",
				icons = "VitalyGorbachev",
				icons_extension = ".svg",
				show_hourly_forecast = true,
				show_daily_forecast = true,
				time_format_12h = true,
			}),
			logout_menu_widget({
				font = "Comic Mono 10",
				onlock = function()
					awful.spawn.with_shell("betterlockscreen -l blur 0.5")
				end,
			}),
		},
	})
end

return theme
