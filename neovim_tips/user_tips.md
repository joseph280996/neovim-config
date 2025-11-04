# Your personal Neovim tips

# Title: Match inside parenthesis 
# Category: s&r, search, subtitute, replace
# Tags: s&r, parenthesis, bracket, curly-braces, regex, quotation
---

Use this regex to match any text inside quotation, parentheses, bracket or
curly-braces in the search and replace operation (replace the quotation as
needed).

```vim
:s/\("[^"]*")*/\1/

```

***
# Title: Repeat last :s command on current line
# Category: subtitute, search, repeat, s&r, replace
# Tags: s&r, replace, subtitute, search, repeat
---


```vim
&
```

***
