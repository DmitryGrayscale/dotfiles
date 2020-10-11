## Usage

[Read here.](https://github.com/lcpz/lain/wiki/Widgets#usage)

### Description

Shows the current CPU temperature.

```lua
local mytemp = lain.widget.temp()
```

## Input table

Variable | Meaning | Type | Default
--- | --- | --- | ---
`timeout` | Refresh timeout (in seconds) | integer | 30
`settings` | User settings | function | empty function

`settings` can use the string `coretemp_now`, which contains the current core temperature, and the table `temp_now`, which contains an entry for each `/sys/class/thermal/thermal_zone*` directory.

All values are expressed in Celsius (GNU/Linux standard).

## Output table

Variable | Meaning | Type
--- | --- | ---
`widget` | The widget | `wibox.widget.textbox`
`update` | Update `widget` | function
