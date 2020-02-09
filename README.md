# Configurations

##### Конфигурации к Alacritty, vim, tmux, xterm, hyper

# О репозитории

В этом репозитории лежат файлы конфигурации к различным консольным программам
Созданы они для того, что стандартные настройки показались мне достаточно грубыми. В этом репозитории почти все файлы заточены на vi-подобные хоткеи

# Мануал

### Терминалы

#### [Alacritty](https://github.com/alacritty/alacritty)

![](https://github.com/Username77177/Configurations/tree/master/img/Alacritty.png)

Пока что, наилучший терминал, который я видел. Пройдемся по основным изменениям, которые я сделал в файле конфигурации:

- Всё что обведено мышью сразу же идёт в буфер обмена
- Терминал изначально запускается в полноэкранном режиме
- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 15px
- Цветовая схема ["Base16 Dark"](https://github.com/eendroroy/alacritty-theme)
- Начальная оболочка Bash с tmux при старте

#### xterm

![](https://github.com/Username77177/Configurations/tree/master/img/Xterm.png)

Стандартный терминал, который настроен как и все остальные терминалы, однако работает с минимальными настройками

- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 15px
- Тема [Dracula](https://github.com/dracula/xresources)
- Выделение при наведении
- Начальная оболочка Bash/zsh/fish

#### [Hyper](https://hyper.is/)

![](https://github.com/Username77177/Configurations/tree/master/img/Hyper.png)

Терминал, построенный на веб-технологиях

- Начальный шрифт [Fira Code](https://github.com/tonsky/FiraCode)
- Размер шрифта 16px
- Терминал при старте: zsh
- Копирование при выделении мышью
- 6 плагинов, которые отвечают за стилизацию панелей, вставку текста и так далее
- Hyper tmux не требуется, он и сам умеет делить окна
