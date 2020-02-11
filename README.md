# Configurations

##### Конфигурации к Alacritty, vim, tmux, xterm, hyper

# О репозитории

В этом репозитории лежат файлы конфигурации к различным консольным программам
Созданы они для того, что стандартные настройки показались мне достаточно грубыми. В этом репозитории почти все файлы заточены на vi-подобные хоткеи

```bash
git clone https://www.github.com/username77177/Configurations/ ~/Configurations
```

# О i3

i3 - прекрасный тайловый менеджер окон, однако его настройка у меня вызвала некоторые проблемы. Я позаимствовал настройки у [addy-dclxvi](https://github.com/addy-dclxvi/)
Также, хочу приложить [ссылку на его замечательный репозиторий](https://github.com/addy-dclxvi/i3-starterpack)

# Мануал

### Терминалы

#### [Alacritty](https://raw.github.com/alacritty/alacritty)

![Alacritty Image](https://raw.github.com/Username77177/Configurations/master/img/Alacritty.png)

Пока что, наилучший терминал, который я видел. Пройдемся по основным изменениям, которые я сделал в файле конфигурации:

- Всё что обведено мышью сразу же идёт в буфер обмена
- Терминал изначально запускается в полноэкранном режиме
- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 14px
- Цветовая схема ["Base16 Dark"](https://github.com/eendroroy/alacritty-theme)
- Начальная оболочка Bash с tmux при старте

#### xterm

![Xterm Image](https://raw.github.com/Username77177/Configurations/master/img/Xterm.png)

Стандартный терминал, который настроен как и все остальные терминалы, однако работает с минимальными настройками

- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 15px
- Тема [Dracula](https://github.com/dracula/xresources)
- Копирование при выделении
- Начальная оболочка Bash/zsh/fish

#### [Hyper](https://hyper.is/)

![Hyper Image](https://raw.github.com/Username77177/Configurations/master/img/Hyper.png)

Терминал, построенный на веб-технологиях

- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 16px
- Терминал при старте: zsh
- Копирование при выделении мышью
- 6 плагинов, которые отвечают за стилизацию панелей, вставку текста и так далее
- Hyper tmux не требуется, он и сам умеет делить окна

### Редакторы

#### [NeoVim](https://neovim.io/)

Улучшенная версия Vim

- Множество плагинов для упрощения работы
- [Emmet](https://github.com/mattn/emmet-vim)
- [NERDTree](https://github.com/preservim/nerdtree)
- [LightLine](https://github.com/itchyny/lightline.vim)
- [Syntastic](https://github.com/scrooloose/syntastic)
- [Vim-Closetag](https://github.com/alvan/vim-closetag)
- [Vim-prettier](https://github.com/prettier/vim-prettier)
- Хоткеи на удобную работу с табами
