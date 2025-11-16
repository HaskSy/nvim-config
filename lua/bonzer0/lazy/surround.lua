return {
	"tpope/vim-surround",
	config = function() end,
}

-- Cheatsheet:
--
-- [ `cs"'` ]: "Hello world" -> 'Hello world'
-- [ `ysi"<div>` ] "Hello world" -> "<div>Hello world</div>"
-- 
-- Left parentesis (`{`, `[`, `(`): Perform acctions with additional spaces
-- Right parentesis (`{`, `[`, `(`): Perform acctions without spaces
--
-- [ `cs][` ]:  [ "Hello world" ] -> ["Hello world"]
-- [ `ysiW[` ]: "Some[difficult-message_]" -> [ "Some[difficult-message_]" ]
-- [ `ds]` ]:   |[ "Hello world" ]| -> | "Hello world" |
-- [ `ds[` ]:   |[ "Hello world" ]| -> |"Hello world"|
--
-- t - tag target
-- [ `cst<p>` ]: "<div>Hello world</div>" -> "<p>Hello world</p>"
--
-- Works with `targets.vim`
--
-- [ `ysia[` ]: [ a, b, c, d, e, f ] -> [ a, b, c, d, e, f ]
--
-- You can surround the whole line using `yss`
--
-- [ `yss{` ]:
--[===[
    Hello world
--]===]
-- <tuns into>
--[===[
    { Hello world }
--]===]
--
-- You can surround multiline stuff in visual mode using `S`
--
--[===[
{
    This multi-line comment
    Was surrounded by `S{`.
    Also got indented nicely
}
--]===]
--
